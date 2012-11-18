package com.laj.bizimpl;

import java.util.List;

import org.junit.Test;

import com.laj.biz.DistrictBiz;
import com.laj.dao.DistrictDao;
import com.laj.daoimpl.DistrictDaoImpl;
import com.laj.entity.District;
import com.laj.entity.House;

public class DistrictBizImpl implements DistrictBiz {

	public District getDistrictByid(int id) {
	
		return (District) new DistrictDaoImpl().get(District.class, id);
	}

	public List<District> getDistricts() {
		DistrictDao db =new DistrictDaoImpl();
		return db.getAllDistrict();
	}
	@Test
	public void testpage()
	{
		List<District> list=getDistricts();
		System.out.println(list.size());
		for(District h: list)
		{
			System.out.println(h.getDistrictName());
		}
	}

}
