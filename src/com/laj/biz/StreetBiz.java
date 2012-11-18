package com.laj.biz;

import java.util.List;

import com.laj.entity.Street;

public interface StreetBiz {
	public Street getStreetById(int id);
	public List<Street> getStreets();

}