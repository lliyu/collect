package com.site.collect.entity;

import javax.persistence.Column;
import javax.persistence.Table;

@Table(name = "sys_attribute_detail")
public class AttributeDetail {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 属性id
     */
    @Column(name = "attr_id")
	private String attrId;
    /**
     * 属性明细id
     */
	private String name;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAttrId() {
		return attrId;
	}

	public void setAttrId(String attrId) {
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
