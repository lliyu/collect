package com.site.collect.mapper;

import com.site.collect.entity.Attribute;
import com.site.collect.pojo.dto.ParamsDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AttributeMapper extends Mapper<Attribute> {

    List<Attribute> findAttributesByPage(@Param("dto") ParamsDto dto);
}