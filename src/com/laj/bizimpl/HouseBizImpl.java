package com.laj.bizimpl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.laj.biz.HouseBiz;
import com.laj.dao.HouseDao;
import com.laj.daoimpl.HouseDaoImpl;
import com.laj.entity.House;
import com.laj.entity.QueryHouse;
import com.laj.entity.Users;

public class HouseBizImpl implements HouseBiz {

	public void addHouse(House house) {
		HouseDao hd = new HouseDaoImpl();
		hd.addHouse(house);

	}

	public void delHouse(int id) {
		 new HouseDaoImpl().delete(House.class, id);
	

	}

	public House getHouseByid(int id) {


		return (House) new HouseDaoImpl().get(House.class, id);
	}

	public List<House> getHouseBypage(int pageNum, int count) {
		HouseDao hd = new HouseDaoImpl();
		return hd.getAllHouse(pageNum, count) == null ? new ArrayList<House>()
				: hd.getAllHouse(pageNum, count);
	}

	public List<House> getHouses() {
		
		return new HouseDaoImpl().getAll(House.class);
	}

	public void update(House house) {
		
		new HouseDaoImpl().update(house);

	}
      //获得总页数
	public int totalpage(int count) {
		HouseDao hd = new HouseDaoImpl();
	
			return hd.getHousepages(count);
	
	}
	public List<House> getHouseBypage(int pageNum, int count,
			QueryHouse qh) {
		HouseDao hd = new HouseDaoImpl();
		return hd.getAllHouse(pageNum, count, qh);
	}

	public List<House> getHouseBypage(int pageNum, int count,
			Users user) {
		HouseDao hd = new HouseDaoImpl();
		return hd.getAllHouse(pageNum, count, user);
	}


	@Test
	public void testpage() {
		List<House> list = getHouseBypage(2, 15);
		System.out.println(list.size());
		for (House h : list) {
			System.out.println(h.getTitle());
		}
	}

	@Test
	public void testtotalpage() {
		System.out.println("totalpage      " + totalpage(15));
	}


	
}
