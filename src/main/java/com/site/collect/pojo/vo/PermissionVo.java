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

    /**
     * 菜单类型
     */
    private String type;

    /**
     * 父级菜单id
     */
    private Long fId;

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

    public Long getfId() {
        return fId;
    }

    public void setfId(Long fId) {
        this.fId = fId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }
}
