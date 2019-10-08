package com.site.collect.service.ipml;

import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.site.collect.entity.collect.CollectSetp;
import com.site.collect.entity.collect.Item;
import com.site.collect.mapper.CollectStepMapper;
import com.site.collect.service.CollectStepService;
import com.site.collect.utils.data.ParseUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class CollectStepServiceImpl implements CollectStepService {

    @Autowired
    private CollectStepMapper collectStepMapper;


    @Override
    @Transactional
    public void addSteps(CollectSetp[] steps) {
        for (CollectSetp step:steps) {
            collectStepMapper.insert(step);
        }
    }

    @Override
    public Map<String, List<Object>> test(CollectSetp setp) {
        Map<String, List<Object>> maps = Maps.newHashMap();

        List<Item> items = JSONObject.parseArray(setp.getValue(), Item.class);
        items.stream().forEach(item -> {
            //解析
            try {
                if (StringUtils.isNotBlank(item.getName())) {
                    maps.put(item.getName(), ParseUtils.parse(setp.getAddr(), item));
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        });

        return maps;
    }
}
