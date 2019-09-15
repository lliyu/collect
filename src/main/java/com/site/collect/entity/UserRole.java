package com.site.collect.entity;

import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "sys_user_role")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 用户ID
     */
	private String uid;
    /**
     * 角色ID
     */
	private String rid;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public static final String ID = "id";

	public static final String UID = "uid";

	public static final String RID = "rid";

	@Override
	public String toString() {
		return "UserRole{" +
			"id=" + id +
			", uid=" + uid +
			", rid=" + rid +
			"}";
	}
}
