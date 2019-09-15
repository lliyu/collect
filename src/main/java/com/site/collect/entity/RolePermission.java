package com.site.collect.entity;

import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "sys_role_permission")
public class RolePermission implements Serializable {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 角色ID
     */
	private String rid;
    /**
     * 权限ID
     */
	private String pid;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public static final String ID = "id";

	public static final String RID = "rid";

	public static final String PID = "pid";

	@Override
	public String toString() {
		return "RolePermission{" +
			"id=" + id +
			", rid=" + rid +
			", pid=" + pid +
			"}";
	}
}
