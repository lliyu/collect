package com.site.collect.controller;

import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Permission;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.PermisDto;
import com.site.collect.pojo.vo.PermisVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(value = "permission/")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    /**
     * @desc: 查询权限
     */
    @ResponseBody
    @RequestMapping(value = "/list" ,method = RequestMethod.GET)
    public PageInfo<Permission> findPermissionByPage(ParamsDto dto) {

        PageInfo<Permission> list = permissionService.findPermissionByPage(dto);
        return list;
    }

    /**
     * @desc: 新增权限
     */
    @ResponseBody
    @RequestMapping(value = "/add" ,method = RequestMethod.POST)
    public Object addPermissions(@Valid PermisVo vo, BindingResult bindingResult) {
//      vo.setUserName(super.getUserName());
//      vo.setUserId(super.getUserId());
      return permissionService.addPermissions(vo);
    }

    /**
     * @desc: 删除权限项
     */
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object delPermis(ParamsDto dto) {
        if (null == dto.getIds() || dto.getIds().length == 0) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return permissionService.delPermis(dto.getIds());
    }

    /**
     * @desc: 查询父级菜单为0的所有菜单权限
     */
    @ResponseBody
    @RequestMapping(value = "/root" ,method = RequestMethod.GET)
    public Object findAllBasePermission(String type) {
        List<Permission> list = permissionService.findLastPermissionByType(type);
        if (null == list ||list.isEmpty()) {
            return new BaseResponse(StatusCode.NONE.getValue(),"没有记录");
        }
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(),list);
    }

    /**
     * @desc: 绑定树形菜单
     */
    @ResponseBody
    @RequestMapping(value = "/findBasePermission" ,method = RequestMethod.GET)
    public Object findBasePermission() {
        List<PermisDto> list = permissionService.findBasePermission();
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(),list);
    }
}
