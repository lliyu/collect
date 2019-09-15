package com.site.collect.mapper;

import com.site.collect.entity.Role;
import com.site.collect.pojo.dto.ParamsDto;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RoleMapper extends Mapper<Role> {

    List<Role> findRoleByPage(@Param("dto") ParamsDto dto);

    List<Role> findAllRoles();
}