package com.site.collect.entity;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "sys_attribute")
public class Attribute implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
	private Long id;

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

	public static final String ID = "id";

	public static final String NAME = "name";


	@Override
	public String toString() {
		return "Attribute{" +
			"id=" + id +
			", name=" + name +
			"}";
	}
}
