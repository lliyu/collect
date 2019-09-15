package com.site.collect.pojo.dto;

/**
 * @desc: 属性明细dto
 */
public class AttributeDetailDto {

    /**
     * 属性id
     */
    Long id;

    /**
     * 属性名称
     */
    String name;

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
}
