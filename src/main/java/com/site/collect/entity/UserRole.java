package com.site.collect.entity;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Table(name = "sys_user_role")
public class UserRole implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * 用户ID
     */
	private Long uid;
    /**
     * 角色ID
     */
	private Long rid;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public Long getRid() {
		return rid;
	}

	public void setRid(Long rid) {
		this.rid = rid;
	}

}
