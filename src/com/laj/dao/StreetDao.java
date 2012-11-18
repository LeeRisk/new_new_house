package com.laj.dao;

import java.util.List;

import com.laj.entity.Street;

public interface StreetDao {
	public List<Street> getAllStreet();
	public Street getStreetById(int Streetid);
	

}
