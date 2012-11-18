package com.laj.dao;


import com.laj.entity.Users;

public interface UsersDao {
	public Users getUser(Users user);
	public void addUsers(Users user);

}
