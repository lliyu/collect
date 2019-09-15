package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_attribute_detail")
public class AttributeDetail {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * 属性id
     */
    @Column(name = "attr_id")
	private Long attrId;
    /**
     * 属性明细id
     */
	private String name;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAttrId() {
		return attrId;
	}

	public void setAttrId(Long attrId) {
		this.attrId = attrId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static final String ID = "id";

	public static final String ATTRID = "attrId";

	public static final String NAME = "name";

	@Override
	public String toString() {
		return "AttributeDetail{" +
			"id=" + id +
			", attrId=" + attrId +
			", name=" + name +
			"}";
	}
}
