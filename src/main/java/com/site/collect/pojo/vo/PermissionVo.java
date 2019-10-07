package com.site.collect.pojo.vo;

/**
 * @desc: 菜单vo
 */
public class PermissionVo {

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 地址
     */
    private String url;

    private String code;

    /**
     * 菜单类型
     */
    private String type;

    /**
     * 父级菜单id
     */
    private Long fid;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 用户id
     */
    private Long userId;

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

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getFid() {
        return fid;
    }

    public void setFid(Long fid) {
        this.fid = fid;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
