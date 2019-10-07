package com.site.collect.service.ipml;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import com.site.collect.controller.api.UserApi;
import com.site.collect.entity.collect.CollectEntity;
import com.site.collect.mapper.CollectMapper;
import com.site.collect.pojo.dto.CollectDto;
import com.site.collect.pojo.vo.CollectVO;
import com.site.collect.service.CollectService;
import org.apache.commons.lang3.StringUtils;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

@Service
public class CollectServiceImpl implements CollectService {

    @Autowired
    private CollectMapper collectMapper;

    @Override
    public List<CollectEntity> page(CollectDto collectDto) {
        List<CollectVO>  list = Lists.newArrayList();
        PageHelper.startPage(collectDto.getStart(), collectDto.getPageSize());
        Example example = new Example(CollectEntity.class);
        Example.Criteria criteria = example.createCriteria();
        if(StringUtils.isNotBlank(collectDto.getName()))
            criteria.andEqualTo("name", collectDto.getName());
        List<CollectEntity> collectEntities = collectMapper.selectByExample(example);
//        BeanUtils.copyProperties(collectEntities, list);

        return collectEntities;
    }

    @Override
    public void delete(Long[] ids) {
        for(Long id:ids)
            collectMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Long add(CollectDto collectDto) {
        CollectEntity collectEntity = new CollectEntity();
        BeanUtils.copyProperties(collectDto, collectEntity);

        collectEntity.setCreateTime(new Date());
        collectEntity.setUpdateTime(new Date());
        collectEntity.setUid(UserApi.getUserId());
        collectMapper.insert(collectEntity);
        return collectEntity.getId();
    }

    @Override
    public CollectDto getCollectInfoById(Long id) {
        CollectEntity collectEntity = collectMapper.selectByPrimaryKey(id);
        CollectDto dto = new CollectDto();
        BeanUtils.copyProperties(collectEntity, dto);
        return dto;
    }
}
