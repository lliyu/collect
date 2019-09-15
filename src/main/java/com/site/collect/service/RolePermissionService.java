package com.site.collect.service;

import com.site.collect.entity.RolePermission;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.RolePermisDto;
import com.site.collect.pojo.dto.RolePermisVo;

import java.util.List;


public interface RolePermissionService {

    Object addRolesPermis(RolePermisVo vo);
    List<RolePermission> findRolesPermisByRole(ParamsDto dto);

    Integer findCountByRole(Long roleId,String url);

    List<RolePermisDto> findRolesPermisByFatherId(Long fatherId, Long rid);
}
