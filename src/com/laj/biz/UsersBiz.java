package com.laj.biz;

import com.laj.entity.Users;

public interface UsersBiz {
	public Users getUserById(int id);
	public void addUsers(Users user);
	public Users checkLogin(Users user);

}
