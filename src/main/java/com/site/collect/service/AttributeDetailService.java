package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.AttributeDetail;
import com.site.collect.pojo.dto.AttributeDetailDto;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.vo.AttributeDetailVo;

import java.util.List;


public interface AttributeDetailService {

    PageInfo<AttributeDetail> findAttributeDetailByPage(ParamsDto dto);

    Object addAttributeDetail(AttributeDetailVo attributeDetail);

    List<AttributeDetailDto> findAttributeDetailByAttrId(String attrId);

    Object delAttributeDetails(String[] ids);

    void deleteAttrById(Long id);
}
