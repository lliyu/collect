package com.site.collect.pojo.dto;

import org.hibernate.validator.constraints.NotBlank;

/**
 * @desc: 角色权限vo
 */
public class RolePermisVo {

    /**
     * 角色id
     */
    private Long roleId;

    /**
     * 菜单ids
     */
    private Long[] permiIds;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public Long[] getPermiIds() {
        return permiIds;
    }

    public void setPermiIds(Long[] permiIds) {
        this.permiIds = permiIds;
    }
}
