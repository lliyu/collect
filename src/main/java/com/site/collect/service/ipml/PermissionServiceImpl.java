package com.site.collect.service.ipml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.site.collect.Enum.StatusCode;
import com.site.collect.entity.Permission;
import com.site.collect.mapper.PermissionMapper;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.PermisDto;
import com.site.collect.pojo.vo.PermissionVo;
import com.site.collect.response.BaseResponse;
import com.site.collect.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *  权限
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    /**
     * @desc: 查询权限
     */
    public PageInfo<Permission> findPermissionByPage(ParamsDto dto) {
        PageHelper.startPage(dto.getStartPage(), dto.getPageSize());
        List<Permission> permissions = permissionMapper.findPermissionByPage(dto);
        return new PageInfo<Permission>(permissions);
    }

    /**
     * @desc: 添加权限项
     */
    public Object addPermissions(PermissionVo vo) {

        Permission p = new Permission();
        p.setName(vo.getName());
        p.setUrl(vo.getUrl());
        p.setType(vo.getType());
        p.setFatherId(vo.getfId());
        p.setCreateTime(new Date());
        p.setCreater(vo.getUserName());
        permissionMapper.insert(p);
        return new BaseResponse(StatusCode.OK.getValue(), "新增成功");

    }

    /**
     * @desc: 删除权限项
     *
     */
    public Object delPermis(Long[] ids) {

        for (Long id : ids) {
            permissionMapper.deleteByPrimaryKey(id);
        }
        return new BaseResponse(StatusCode.OK.getValue(), "删除成功");
    }

    /**
     * @desc: 根据菜单查询菜单
     *
     */
    public List<Permission> findPermissionByName(String name) {
        return permissionMapper.findPermissionByName(name);
    }

    /**
     * @desc: 根据父级id查询上级菜单
     */
    public List<Permission> findLastPermissionByType(String type) {
        return permissionMapper.findLastPermissionByType(type);
    }

    /**
     * @desc: 查询所有父级菜单绑定树形
     */
    public List<PermisDto> findBasePermission() {
        List<PermisDto> list = permissionMapper.findBasePermission();
        if (null != list && !list.isEmpty()) {
            for (int i = 0,j = list.size();i< j;i++) {
                List<PermisDto> children = permissionMapper.findPermissionByFatherId(list.get(i).getId());
                if (null != children && !children.isEmpty()) {
                    list.get(i).setChildren((ArrayList<PermisDto>) children);
                    for (int i1 = 0, j1 = children.size();i1 < j1; i1++) {
                        List<PermisDto> children1 = permissionMapper.findPermissionByFatherId(children.get(i1).getId());
                        if (null != children1 && !children1.isEmpty()) {
                            children.get(i1).setChildren((ArrayList<PermisDto>) children1);
                        }
                    }
                }
            }
        }
        return list;
    }

    /**
     * 根据url查询记录
     */
    public Integer findCountByUrl(String requestUrl) {
        return permissionMapper.findCountByUrl(requestUrl);
    }
}
