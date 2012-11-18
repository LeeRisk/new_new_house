package com.laj.biz;

import java.util.List;

import com.laj.entity.House;
import com.laj.entity.QueryHouse;
import com.laj.entity.Users;

public interface HouseBiz {
	public void delHouse(int id);
	public void update(House house);
	public void addHouse(House house);
	public House getHouseByid(int id);
	
	public List<House> getHouses();
	public List<House> getHouseBypage(int pageNum,int count,QueryHouse qh);
	public List<House> getHouseBypage(int pageNum, int count,
			Users user) ;
	public int totalpage(int count);
	


}
