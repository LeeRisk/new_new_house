package com.laj.daoimpl;

import java.util.List;

import org.junit.Test;

import com.laj.dao.BaseHibernateDao;
import com.laj.dao.HouseTypeDao;
import com.laj.entity.Housetype;

public class HousetypeDaoImpl extends BaseHibernateDao implements HouseTypeDao {

	public List<Housetype> getAllHousetype() {
		
		return super.getAll(Housetype.class);
	}
	@Test
	public void getAll()
	{
		for(Housetype hy:getAllHousetype())
		System.out.println(hy.getTypeName());
	}

}
