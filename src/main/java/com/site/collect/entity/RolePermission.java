package com.site.collect.entity;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "sys_role_permission")
public class RolePermission implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * 角色ID
     */
	private Long rid;
    /**
     * 权限ID
     */
	private Long pid;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getRid() {
		return rid;
	}

	public void setRid(Long rid) {
		this.rid = rid;
	}

	public Long getPid() {
		return pid;
	}

	public void setPid(Long pid) {
		this.pid = pid;
	}

}
