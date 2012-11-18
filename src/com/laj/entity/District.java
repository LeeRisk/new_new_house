package com.laj.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * District entity. @author MyEclipse Persistence Tools
 */

public class District implements java.io.Serializable {

	// Fields

	private Integer id;
	private String districtName;
	private Set streets = new HashSet(0);

	// Constructors

	/** default constructor */
	public District() {
	}

	/** full constructor */
	public District(String districtName, Set streets) {
		this.districtName = districtName;
		this.streets = streets;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDistrictName() {
		return this.districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public Set getStreets() {
		return this.streets;
	}

	public void setStreets(Set streets) {
		this.streets = streets;
	}

}