package com.laj.bizimpl;

import java.util.List;

import org.junit.Test;

import com.laj.biz.HousetypeBiz;
import com.laj.daoimpl.HousetypeDaoImpl;
import com.laj.entity.Housetype;

public class HousetypeBizImpl implements HousetypeBiz {

	public Housetype getHousetypeById(int id) {
		HousetypeDaoImpl hd = new HousetypeDaoImpl();
		return (Housetype) hd.get(Housetype.class, id);
	}

	public List<Housetype> getHousetypes() {
		HousetypeDaoImpl hd = new HousetypeDaoImpl();
		return hd.getAll(Housetype.class);
	}

	@Test
	public void testpage() {
		List<Housetype> list = getHousetypes();
		System.out.println(list.size());
		for (Housetype h : list) {
			System.out.println(h.getTypeName());
		}
	}

}
