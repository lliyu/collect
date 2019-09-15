package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.AttributeDetail;
import com.site.collect.mapper.AttributeDetailMapper;
import com.site.collect.pojo.dto.AttributeDetailDto;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.vo.AttributeDetailVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.AttributeDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AttributeDetailServiceImpl implements AttributeDetailService {
    @Autowired
    private AttributeDetailMapper attributeDetailMapper;

    /**
     * @desc: 查询属性明细
     */
    public PageInfo<AttributeDetail> findAttributeDetailByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<AttributeDetail> attributeDetails = attributeDetailMapper.findAttributeDetailByPage(dto);
        return new PageInfo<AttributeDetail>(attributeDetails);
    }

    /**
     * @desc: 新增属性明细
     *
     */
    public Object addAttributeDetail(AttributeDetailVo vo) {
        AttributeDetail attributeDetail = new AttributeDetail();
        attributeDetail.setAttrId(vo.getId());
        attributeDetail.setName(vo.getName());
        Integer rows = attributeDetailMapper.insert(attributeDetail);
      if (rows > 0) {
          return new BaseResponse(StatusCode.OK.getValue(), "新增成功");
      }
        return new BaseResponse(StatusCode.INTERNAL_SERVER_ERROR.getValue(), "新增失败");
    }

    /**
     * @desc: 根据属性id查询属性明细
     */
    public List<AttributeDetailDto> findAttributeDetailByAttrId(Long attrId) {
        return attributeDetailMapper.findAttributeDetailByAttrId(attrId);
    }

    /**
     * @desc: 删除属性明细
     */
    public Object delAttributeDetails(Long[] ids) {

        for (Long id : ids) {
            attributeDetailMapper.deleteByPrimaryKey(id);
        }

        return new BaseResponse(StatusCode.OK.getValue(), "删除成功");
    }

    @Override
    public void deleteAttrById(Long id) {
        attributeDetailMapper.deleteByPrimaryKey(id);
    }


}
