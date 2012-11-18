package com.laj.dao;

import java.util.List;

import com.laj.entity.House;
import com.laj.entity.QueryHouse;
import com.laj.entity.Users;

public interface HouseDao {
	public void updateHouse(House house);
	public void addHouse(House house);
	public List<House> getAllHouse(int pageNum,int pageCount);
	public List<House> getAllHouse(int pageNum,int pageCount,QueryHouse qh);
	public List<House> getAllHouse(int pageNum,int pageCount,Users user);
	public int getHousepages(int count);
	public int getHousepages(int count,Users user);
	
	

}
