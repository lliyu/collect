package com.site.collect.service;

import com.github.pagehelper.PageInfo;
import com.site.collect.entity.Permission;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.PermisDto;
import com.site.collect.pojo.vo.PermissionVo;

import java.util.List;

public interface PermissionService {

    PageInfo<Permission> findPermissionByPage(ParamsDto dto);

    Object addPermissions(PermissionVo vo);

    Object delPermis(Long[] ids);

    List<Permission> findPermissionByName(String name);

    List<Permission> findLastPermissionByType(String type);

    List<PermisDto> findBasePermission();

    Integer findCountByUrl(String requestUrl);
}
