package com.laj.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Street entity. @author MyEclipse Persistence Tools
 */

public class Street implements java.io.Serializable {

	// Fields

	private Integer id;
	private District district;
	private String streetName;
	private Set houses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Street() {
	}

	/** full constructor */
	public Street(District district, String streetName, Set houses) {
		this.district = district;
		this.streetName = streetName;
		this.houses = houses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public District getDistrict() {
		return this.district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getStreetName() {
		return this.streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public Set getHouses() {
		return this.houses;
	}

	public void setHouses(Set houses) {
		this.houses = houses;
	}

}