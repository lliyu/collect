package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;

import java.util.Date;

@Table(name = "sys_login_log")
public class LoginLog implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Id
    private Long id;
    /**
     * 用户id
     */
    private Long uid;
    /**
     * 登录时间
     */
    @Column(name = "login_time")
    private Date loginTime;
    /**
     * 登录ip
     */
    @Column(name = "login_ip")
    private String loginIP;
    /**
     * 登录总次数
     */
    @Column(name = "login_total")
    private Integer loginTotal;


    /**
     * 用户名称
     */
    @Transient
    private String userName;

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

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public String getLoginIP() {
        return loginIP;
    }

    public void setLoginIP(String loginIP) {
        this.loginIP = loginIP;
    }

    public Integer getLoginTotal() {
        return loginTotal;
    }

    public void setLoginTotal(Integer loginTotal) {
        this.loginTotal = loginTotal;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        return "LoginLog{" +
                "id=" + id +
                ", uid=" + uid +
                ", loginTime=" + loginTime +
                ", loginIP=" + loginIP +
                ", loginTotal=" + loginTotal +
                "}";
    }
}
