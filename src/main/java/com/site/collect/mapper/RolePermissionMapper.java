package com.site.collect.mapper;

import com.site.collect.entity.RolePermission;
import com.site.collect.pojo.dto.ParamsDto;
import com.site.collect.pojo.dto.RolePermisDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RolePermissionMapper extends Mapper<RolePermission> {

    /**
     * 根据角色查询角色权限
     *
     * @param dto
     * @return
     */
    List<RolePermission> findRolesPermisByRole(@Param("dto") ParamsDto dto);

    /**
     * 根据角色id查询记录数
     * @param roleId
     * @return
     */
    Integer findCountByRole(@Param("roleId") Long roleId,@Param("url") String url);

    List<RolePermisDto> findRolesPermisByFatherId(@Param("fatherId") Long fatherId, @Param("rid") Long rid);
}