package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.Attribute;
import com.site.collect.pojo.dto.ParamsDto;

public interface AttributeService {

    PageInfo<Attribute> findAttributesByPage(ParamsDto dto);

    Object addAttributes(Attribute attribute);

    Object delAttributes(Long[] ids);

}
