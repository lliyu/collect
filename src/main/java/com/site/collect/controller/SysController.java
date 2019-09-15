package com.site.collect.controller;

import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Attribute;
import com.site.collect.entity.AttributeDetail;
import com.site.collect.entity.LoginLog;
import com.site.collect.entity.OperatingRecord;
import com.site.collect.pojo.dto.AttributeDetailDto;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.vo.AttributeDetailVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.AttributeDetailService;
import com.site.collect.service.AttributeService;
import com.site.collect.service.LoginLogService;
import com.site.collect.service.OperatingRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = "sys/")
public class SysController {

    @Autowired
    /**
     * 属性
     */
    private AttributeService attributeService;

    @Autowired
    /**
     * 属性明细
     */
    private AttributeDetailService attributeDetailService;


    @Autowired
    /**
     * 操作记录
     */
    private OperatingRecordService operatingRecordService;

    @Autowired
    private LoginLogService loginLogService;

    /**
     * @desc: 查询属性
     */
    @RequestMapping(value = "/findAttributesByPage" ,method = RequestMethod.GET)
    public PageInfo<Attribute> findAttributesByPage(ParamsDto dto) {
        PageInfo<Attribute> list = attributeService.findAttributesByPage(dto);
        return list;
    }

    /**
     * @desc: 查询属性明细
     */
    @RequestMapping(value = "/findAttributesDetailByPage" ,method = RequestMethod.GET)
    public PageInfo<AttributeDetail> findAttributesDetailByPage(ParamsDto dto) {

        PageInfo<AttributeDetail> list = attributeDetailService.findAttributeDetailByPage(dto);
        return list;
    }

    /**
     * @desc: 新增属性
     */
    @RequestMapping(value = "/addAttributes" ,method = RequestMethod.POST)
    public Object addAttributes(@Valid Attribute attribute, BindingResult bindingResult) {
        return attributeService.addAttributes(attribute);
    }

    /**
     * @desc: 新增属性明细
     */
    @RequestMapping(value = "/addAttributeDetail" ,method = RequestMethod.POST)
    public Object addAttributeDetail(@Valid AttributeDetailVo vo, BindingResult bindingResult) {
        return attributeDetailService.addAttributeDetail(vo);
    }

    /**
     * @desc: 删除属性
     */
    @RequestMapping(value = "/delAttributes",method = RequestMethod.POST)
    public Object delAttributes(ParamsDto dto) {
        if (null == dto.getIds() || dto.getIds().length == 0) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return attributeService.delAttributes(dto.getIds());
    }

    /**
     * @desc: 删除属性明细
     */
    @RequestMapping(value = "/delAttributeDetails",method = RequestMethod.POST)
    public Object delAttributeDetails(ParamsDto dto) {
        if (null == dto.getIds() || dto.getIds().length == 0) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return attributeDetailService.delAttributeDetails(dto.getIds());
    }

   /**
    * @desc: 根据属性id查询属性
    */
    @RequestMapping(value = "/findAttributeDetailByAttrId",method = RequestMethod.GET)
    public Object selAttributeDetailsByAttrId(ParamsDto dto) {
        if (StringUtils.isEmpty(dto.getId())) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        List<AttributeDetailDto> list = attributeDetailService.findAttributeDetailByAttrId(dto.getId());
        if (null == list || list.isEmpty()) {
            return new BaseResponse(StatusCode.NONE.getValue(), "没有记录");
        }
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(), list);
    }

    /**
     * 查询操作记录
     */
    @RequestMapping(value = "/findOperatingRecordByPage" ,method = RequestMethod.GET)
    public PageInfo<OperatingRecord> findOperatingRecordByPage(ParamsDto dto) {

        PageInfo<OperatingRecord> list = operatingRecordService.findOperatingRecordByPage(dto);
        return list;

    }

    /**
     * 用户登录日志
     */
    @RequestMapping(value = "/findUserLoginLogByPage", method = RequestMethod.GET)
    public PageInfo<LoginLog> findUserLoginLogByPage(ParamsDto dto) {
        PageInfo<LoginLog> list = loginLogService.findUserLoginLogByPage(dto);
        return list;

    }

    /**
     * 统计用户登录
     */
    @RequestMapping(value = "/findUserLoginTotal", method = RequestMethod.GET)
    public Object findUserLoginTotal() {
        return loginLogService.findUserLoginTotal();
    }

    /**
     * 访问统计
     */
    @RequestMapping(value = "/findUserReqTotal", method = RequestMethod.GET)
    public Object findUserReqTotal() {
        return operatingRecordService.findUserReqTotal();
    }


}
