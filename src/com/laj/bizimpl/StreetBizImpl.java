package com.laj.bizimpl;

import java.util.List;

import org.junit.Test;

import com.laj.biz.StreetBiz;
import com.laj.dao.StreetDao;
import com.laj.daoimpl.StreetDaoImpl;
import com.laj.entity.District;
import com.laj.entity.Street;

public class StreetBizImpl implements StreetBiz {

	public Street getStreetById(int id) {
		StreetDao sd = new StreetDaoImpl();
		return sd.getStreetById(id);
	}

	public List<Street> getStreets() {
		StreetDao sd = new StreetDaoImpl();
		return sd.getAllStreet();
	}
	@Test
	public void testpage()
	{
		List<Street> list=getStreets();
		System.out.println(list.size());
		for(Street h: list)
		{
			System.out.println(h.getStreetName());
		}
	}

}
