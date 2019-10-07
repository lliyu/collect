package com.site.collect.service;

import com.site.collect.entity.collect.CollectEntity;
import com.site.collect.pojo.dto.CollectDto;

import java.util.List;

public interface CollectService {

    List<CollectEntity> page(CollectDto collectDto);

    void delete(Long[] ids);

    Long add(CollectDto collectDto);

    CollectDto getCollectInfoById(Long id);
}
