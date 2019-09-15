package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

import java.util.Date;

@Table(name = "sys_permission")
public class Permission implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * url描述
     */
	private String name;
    /**
     * url地址
     */
	private String url;
    /**
     * 请求方式
     */
    @Column(name = "request_type")
	private String requestType;
    /**
     * 上级菜单id
     */
	@Column(name = "fid")
	private Long fatherId;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 类型：页面、按钮
     */
	private String type;
    /**
     * 创建时间
     */
	@Column(name = "create_time")
	private Date createTime;
    /**
     * 修改时间
     */
	@Column(name = "update_time")
	private Date updateTime;
    /**
     * 创建人
     */
	private String creater;
    /**
     * 修改人
     */
	private String updater;

    /**
     * icon
     */
	@Column(name = "icon_cls")
    private String iconCls;

	/**
	 * 上级菜单
	 */
	@Transient
	private String lastPermis;

	/**
	 * 菜单类型
	 */
	@Transient
	private String typeName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getFatherId() {
		return fatherId;
	}

	public void setFatherId(Long fatherId) {
		this.fatherId = fatherId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public String getLastPermis() {
		return lastPermis;
	}

	public void setLastPermis(String lastPermis) {
		this.lastPermis = lastPermis;
	}

	public String getTypeName() {
		return typeName;
	}

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

	@Override
	public String toString() {
		return "Permission{" +
			"id=" + id +
			", name=" + name +
			", url=" + url +
			", requestType=" + requestType +
			", fatherId=" + fatherId +
			", sort=" + sort +
			", type=" + type +
			", createTime=" + createTime +
			", updateTime=" + updateTime +
			", creater=" + creater +
			", updater=" + updater +
			"}";
	}
}
