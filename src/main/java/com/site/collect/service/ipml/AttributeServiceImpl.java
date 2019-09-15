package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Attribute;
import com.site.collect.mapper.AttributeMapper;
import com.site.collect.pojo.dto.AttributeDetailDto;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.AttributeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AttributeServiceImpl implements AttributeService {

    @Autowired
    private AttributeDetailServiceImpl attributeDetailService;
    @Autowired
    private AttributeMapper attributeMapper;

    /**
     * @desc: 查询属性
     */
    public PageInfo<Attribute> findAttributesByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<Attribute> attributes = attributeMapper.findAttributesByPage(dto);
        return new PageInfo<Attribute>(attributes);
    }

    /**
     * @desc: 新增属性
     */
    public Object addAttributes(Attribute attribute) {
        attributeMapper.insert(attribute);
        return new BaseResponse(StatusCode.OK.getValue(), "新增成功");
    }

    /**
     * @desc: 删除属性
     */
    @Transactional
    public Object delAttributes(String[] ids) {
        for (String id : ids) {
            attributeMapper.deleteByPrimaryKey(id);
            List<AttributeDetailDto> list = attributeDetailService.findAttributeDetailByAttrId(id);
            if (null != list && !list.isEmpty()) {
                for (int i = 0; i < list.size(); i++) {
                    attributeDetailService.deleteAttrById(Long.valueOf(list.get(i).getId()));

                }
            }
        }
        return new BaseResponse(StatusCode.OK.getValue(), "删除成功");
    }
}
