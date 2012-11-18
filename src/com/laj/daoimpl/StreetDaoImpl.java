package com.laj.daoimpl;

import java.util.List;

import com.laj.dao.BaseHibernateDao;
import com.laj.dao.StreetDao;
import com.laj.entity.Street;

public class StreetDaoImpl extends BaseHibernateDao implements StreetDao {

	public List<Street> getAllStreet() {
		
		return super.getAll(Street.class);
	}

	public Street getStreetById(int Streetid) {
		
		return (Street) super.get(Street.class, Streetid);
	}

}
