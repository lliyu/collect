package com.site.collect.controller;

import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Role;
import com.site.collect.entity.RolePermission;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.RolePermisVo;
import com.site.collect.pojo.vo.RoleVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.RolePermissionService;
import com.site.collect.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(value = "role/")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private RolePermissionService rolePermissionService;

    /**
     * @desc: 查询角色
     */
    @RequestMapping(value = "/findRoleByPage" ,method = RequestMethod.GET)
    public PageInfo<Role> findRoleByPage(ParamsDto dto) {

        PageInfo<Role> list = roleService.findRoleByPage(dto);
        return list;
    }

    /**
     * @desc: 新增角色
     */
    @RequestMapping(value = "/addRoles" ,method = RequestMethod.POST)
    public Object addRoles(@Valid RoleVo vo, BindingResult bindingResult) {
        return roleService.addRoles(vo);
    }

    /**
     * @desc: 删除角色
     */
    @RequestMapping(value = "/delRoles",method = RequestMethod.POST)
    public Object delRoles(ParamsDto dto) {
        if (null == dto.getIds() || dto.getIds().length == 0) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        return roleService.delRole(dto.getIds());
    }

    /**
     * 根据角色查询角色权限
     *
     * @param dto
     * @return
     */
    @RequestMapping(value = "/findRolesPermisByRole",method = RequestMethod.GET)
    public Object findRolesPermisByRole(ParamsDto dto) {
        if (null == dto.getId()) {
            return new BaseResponse(StatusCode.BAD_REQUEST.getValue(), StatusCode.BAD_REQUEST.getMsg());
        }
        List<RolePermission> list = rolePermissionService.findRolesPermisByRole(dto);
        String[] arr = new String[list.size()];
        for (int i = 0,j=list.size(); i < j; i++) {
            arr[i] = list.get(i).getPid();
        }
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(), arr);
    }

    /**
     * 添加角色权限
     * @param vo
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/addRolesPermis",method = RequestMethod.POST)
    public Object addRolesPermis(RolePermisVo vo, BindingResult bindingResult) {
        return rolePermissionService.addRolesPermis(vo);
    }

    /**
     * 绑定角色下拉框
     * @param vo
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "/findAllRoles",method = RequestMethod.GET)
    public Object findAllRoles(RolePermisVo vo,BindingResult bindingResult) {
        List<Role> list = roleService.findAllRoles();
        return new BaseResponse(StatusCode.OK.getValue(), StatusCode.OK.getMsg(),list);
    }

}
