package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

import java.util.Date;


@Table(name = "sys_user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private String id;
    /**
     * 头像
     */
    @Column(name = "head_portraits")
    private String headPortraits;
    /**
     * 用户昵称
     */
    private String nickname;
    /**
     * 邮箱|登录帐号
     */
	private String email;
    /**
     * 密码
     */
	private String pswd;
    /**
     * 创建时间
     */
	@Column(name = "create_time")
	private Date createTime;
    /**
     * 最后登录时间
     */
	@Column(name = "last_login_time")
	private Date lastLoginTime;
    /**
     * 1:有效，0:禁止登录
     */
	private Integer status;

    /**
     * 角色id
     */
    @Transient
	private String rid;

	/**
	 * 角色名称
	 */
	@Transient
	private String roleName;
	/**
	 * 角色类型 1 超级管理员  2 普通用户
	 */
	@Transient
	private Integer type;

    public String getHeadPortraits() {
        return headPortraits;
    }

    public void setHeadPortraits(String headPortraits) {
        this.headPortraits = headPortraits;
    }


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPswd() {
		return pswd;
	}

	public void setPswd(String pswd) {
		this.pswd = pswd;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public static final String ID = "id";

    public static final String HEAD_PORTRAITS = "head_portraits";

	public static final String NICKNAME = "nickname";

	public static final String EMAIL = "email";

	public static final String PSWD = "pswd";

	public static final String CREATE_TIME = "create_time";

	public static final String LAST_LOGIN_TIME = "last_login_time";

	public static final String STATUS = "status";

	@Override
	public String toString() {
		return "User{" +
			"id=" + id +
			", nickname=" + nickname +
			", email=" + email +
			", pswd=" + pswd +
			", createTime=" + createTime +
			", lastLoginTime=" + lastLoginTime +
			", status=" + status +
			"}";
	}
}
