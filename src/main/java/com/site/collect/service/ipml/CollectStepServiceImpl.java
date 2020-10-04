package com.site.collect.service.ipml;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.site.collect.entity.collect.CollectStep;
import com.site.collect.entity.collect.Item;
import com.site.collect.mapper.CollectStepMapper;
import com.site.collect.service.CollectStepService;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class CollectStepServiceImpl implements CollectStepService {

    @Autowired
    private CollectStepMapper collectStepMapper;


    @Override
    @Transactional
    public void addSteps(List<CollectStep> steps) {
        for (CollectStep step:steps) {
            if(step.getId() != null){
                step.setUpdateTime(new Date());
                collectStepMapper.updateByPrimaryKey(step);
            }else {
                step.setCreateTime(new Date());
                step.setUpdateTime(new Date());
                collectStepMapper.insert(step);
            }
        }
    }

    @Override
    public Map<String, List<Object>> test(CollectStep step) {
        Map<String, List<Object>> maps = Maps.newHashMap();

        List<Item> items = JSONObject.parseArray(step.getValue(), Item.class);
        items.stream().forEach(item -> {
            //解析
            try {
                if (StringUtils.isNotBlank(item.getName())) {
                    if(step.getMode() == 0){
                        JSONObject res = ParseUtils.regexParseForItem(step.getAddr(), item);
                        maps.put(item.getName(), Arrays.asList(res));
                    }else if(step.getMode() == 1){
                        maps.put(item.getName(), ParseUtils.parse(step.getAddr(), item));
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        return maps;
    }

    @Override
    @Cacheable(value = "collectStep", key = "#step.collectId + ':' + #step.index")
    public CollectStep getStepByCidAndIndex(CollectStep step) {
        Example example = new Example(CollectStep.class);
        example.createCriteria().andEqualTo("collectId", step.getCollectId()).andEqualTo("index", step.getIndex()+1);
        CollectStep collectStep = collectStepMapper.selectOneByExample(example);
        return collectStep;
    }

    @Override
    public List<CollectStep> getStepsByCid(Integer cid) {
        Example example = new Example(CollectStep.class);
        example.createCriteria().andEqualTo("collectId", cid);
        List<CollectStep> collectSteps = collectStepMapper.selectByExample(example);
        return collectSteps;
    }


}
