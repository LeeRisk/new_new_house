package com.laj.entity;

public class QueryHouse {
	private String title;
	private double minprice;
	private double maxprice;
	private Street street;
	private Housetype housetype;
	private double minsize;
	private double maxsize;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getMinprice() {
		return minprice;
	}

	public void setMinprice(double minprice) {
		this.minprice = minprice;
	}

	public double getMaxprice() {
		return maxprice;
	}

	public void setMaxprice(double maxprice) {
		this.maxprice = maxprice;
	}

	public Street getStreet() {
		return street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	public Housetype getHousetype() {
		return housetype;
	}

	public void setHousetype(Housetype housetype) {
		this.housetype = housetype;
	}

	public double getMinsize() {
		return minsize;
	}

	public void setMinsize(double minsize) {
		this.minsize = minsize;
	}

	public double getMaxsize() {
		return maxsize;
	}

	public void setMaxsize(double maxsize) {
		this.maxsize = maxsize;
	}

}
