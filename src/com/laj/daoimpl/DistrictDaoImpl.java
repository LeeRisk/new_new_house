package com.laj.daoimpl;

import java.util.List;

import com.laj.dao.BaseHibernateDao;
import com.laj.dao.DistrictDao;
import com.laj.entity.District;

public class DistrictDaoImpl extends BaseHibernateDao implements DistrictDao {

	public List<District> getAllDistrict() {
		// ODO Auto-generated method stub
		return super.getAll(District.class);
	}

}
