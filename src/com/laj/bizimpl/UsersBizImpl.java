package com.laj.bizimpl;

import org.junit.Test;

import com.laj.biz.UsersBiz;
import com.laj.dao.UsersDao;
import com.laj.daoimpl.UserDaoImpl;
import com.laj.entity.Users;

public class UsersBizImpl implements UsersBiz {
	
	/**
	 * checkLogin(Users user)
	 * 根据用户名和密码来查询数据库
	 * true 该用户存在 false 用户不存在
	 */
	public Users checkLogin(Users user) {
		UsersDao us = new UserDaoImpl();
		return us.getUser(user);
		
	}

	public Users getUserById(int id) {
		Users user=new Users();
		user.setId(id);
		UsersDao us = new UserDaoImpl();
		return us.getUser(user);
	}

	public void addUsers(Users user) {
		UsersDao us = new UserDaoImpl();
		us.addUsers(user);

	}
	@Test
	public void testaddUsers()
	{
		Users user=new Users();
		user.setIsadmin("no");
		user.setName("wangwu");
		user.setPassword("123");
		this.addUsers(user);
		
		
	}
//	@Test
	public void testgetUserById()
	{
		System.out.println(this.getUserById(2).getName());
	}
	//@Test
	public void testcheckLogin()
	{

		Users user=new Users();

		user.setName("admin");
		user.setPassword("123");
		System.out.println(this.checkLogin(user));
	}

}
