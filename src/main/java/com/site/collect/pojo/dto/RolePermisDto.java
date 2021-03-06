package com.site.collect.pojo.dto;

import java.util.ArrayList;

/**
 * 动态菜单
 */
public class RolePermisDto {

    private Long id;

    /**
     * name
     */
    private String name;

    /**
     * url
     */
    private String url;

    /**
     * icon
     */
    private String iconCls;

    /**
     * children
     */
    private ArrayList<RolePermisDto> children;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getIconCls() {
        return iconCls;
    }

    public void setIconCls(String iconCls) {
        this.iconCls = iconCls;
    }

    public ArrayList<RolePermisDto> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<RolePermisDto> children) {
        this.children = children;
    }
}
