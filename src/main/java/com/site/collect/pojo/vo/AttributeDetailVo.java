package com.site.collect.pojo.vo;

import org.hibernate.validator.constraints.NotBlank;

/**
 * @desc: 属性明细vo
 */
public class AttributeDetailVo {

    /**
     * 属性id
     */
    private Long id;
    /**
     * 属性明细名称
     */
    private String name;

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
