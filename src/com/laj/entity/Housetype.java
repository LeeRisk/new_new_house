package com.laj.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Housetype entity. @author MyEclipse Persistence Tools
 */

public class Housetype implements java.io.Serializable {

	// Fields

	private Integer id;
	private String typeName;
	private Set houses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Housetype() {
	}

	/** full constructor */
	public Housetype(String typeName, Set houses) {
		this.typeName = typeName;
		this.houses = houses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public Set getHouses() {
		return this.houses;
	}

	public void setHouses(Set houses) {
		this.houses = houses;
	}

}