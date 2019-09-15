package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.Role;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.vo.RoleVo;

import java.util.List;

public interface RoleService {

    PageInfo<Role> findRoleByPage(ParamsDto dto);

    Object addRoles(RoleVo vo);

    Object delRole(Long[] ids);

    List<Role> findAllRoles();
}
