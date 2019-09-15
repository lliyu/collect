package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

import java.util.Date;


@Table(name = "sys_operating_record")
public class OperatingRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * 请求的url
     */
    @Column(name = "request_url")
	private String requestUrl;
    /**
     * 远程的ip地址
     */
	@Column(name = "remote_addr")
	private String remoteAddr;
    /**
     * 请求参数
     */
	private String params;
    /**
     * 请示方式
     */
	private String method;
	@Column(name = "create_time")
	private Date createTime;
    /**
     * 用户id
     */
    private Long uid;
    /**
     * 标识
     */
    private String flag;

	/**
	 * 用户名称
	 */
	@Transient
	private String userName;

    /**
     * 菜单名称
     */
    @Transient
    private String permName;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRequestUrl() {
		return requestUrl;
	}

	public void setRequestUrl(String requestUrl) {
		this.requestUrl = requestUrl;
	}

	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getUid() {
		return uid;
	}

	public void setUid(Long uid) {
		this.uid = uid;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

    public String getPermName() {
        return permName;
    }

    public void setPermName(String permName) {
        this.permName = permName;
    }

	@Override
	public String toString() {
		return "OperatingRecord{" +
			"id=" + id +
			", requestUrl=" + requestUrl +
			", remoteAddr=" + remoteAddr +
			", params=" + params +
			", method=" + method +
			", createTime=" + createTime +
                ", uid=" + uid +
                ", flag=" + flag +
			"}";
	}
}
