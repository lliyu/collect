package com.site.collect.entity;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;


@Table(name = "sys_role")
public class Role implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;
    /**
     * 角色名称
     */
	private String name;
    /**
     * 角色类型
     */
    private Integer type;

	/**
	 * 角色描述
	 */
	private String description;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public static final String ID = "id";

	public static final String NAME = "name";

	public static final String TYPE = "type";

	public static final String DESCRIPTION = "description";

	@Override
	public String toString() {
		return "Role{" +
				"id='" + id + '\'' +
				", name='" + name + '\'' +
				", type='" + type + '\'' +
				", description='" + description + '\'' +
				'}';
	}
}
