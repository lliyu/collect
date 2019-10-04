package com.site.collect.pojo.dto;

import java.util.ArrayList;

/**
 * @desc: 菜单dto
 */
public class PermisDto {

    private Long id;

    /**
     * 菜单名称
     */
    private String name;

    private String code;

    /**
     * 子菜单
     */
    private ArrayList<PermisDto> children;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

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

    public ArrayList<PermisDto> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<PermisDto> children) {
        this.children = children;
    }
}
