package com.laj.biz;

import java.util.List;

import com.laj.entity.District;

public interface DistrictBiz {
public District getDistrictByid(int id);
public List<District> getDistricts();
}
