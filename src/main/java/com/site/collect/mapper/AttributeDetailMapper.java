package com.site.collect.mapper;

import com.site.collect.entity.AttributeDetail;
import com.site.collect.pojo.dto.AttributeDetailDto;
import com.site.collect.pojo.dto.ParamsDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface AttributeDetailMapper extends Mapper<AttributeDetail> {

    List<AttributeDetail> findAttributeDetailByPage(@Param("dto") ParamsDto dto);

    List<AttributeDetailDto> findAttributeDetailByAttrId(@Param("attrId") Long attrId);
}