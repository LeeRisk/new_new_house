package com.laj.entity;

import java.sql.Timestamp;

/**
 * House entity. @author MyEclipse Persistence Tools
 */

public class House implements java.io.Serializable {

	// Fields

	private Integer id;
	private Users users;
	private Housetype housetype;
	private Street street;
	private String title;
	private String description;
	private Timestamp fdate;
	private Double price;
	private String contact;
	private Double size;

	// Constructors

	/** default constructor */
	public House() {
	}

	/** minimal constructor */
	public House(Timestamp fdate) {
		this.fdate = fdate;
	}

	/** full constructor */
	public House(Users users, Housetype housetype, Street street, String title,
			String description, Timestamp fdate, Double price, String contact,
			Double size) {
		this.users = users;
		this.housetype = housetype;
		this.street = street;
		this.title = title;
		this.description = description;
		this.fdate = fdate;
		this.price = price;
		this.contact = contact;
		this.size = size;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Housetype getHousetype() {
		return this.housetype;
	}

	public void setHousetype(Housetype housetype) {
		this.housetype = housetype;
	}

	public Street getStreet() {
		return this.street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getFdate() {
		return this.fdate;
	}

	public void setFdate(Timestamp fdate) {
		this.fdate = fdate;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public Double getSize() {
		return this.size;
	}

	public void setSize(Double size) {
		this.size = size;
	}

}