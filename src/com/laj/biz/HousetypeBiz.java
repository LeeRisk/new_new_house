package com.laj.biz;

import java.util.List;

import com.laj.entity.Housetype;

public interface HousetypeBiz {
	public Housetype getHousetypeById(int id);
	public List<Housetype> getHousetypes();

}
