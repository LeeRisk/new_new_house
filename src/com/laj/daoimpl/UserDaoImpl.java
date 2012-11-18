package com.laj.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Example;

import com.laj.dao.BaseHibernateDao;
import com.laj.dao.UsersDao;
import com.laj.entity.Users;

public class UserDaoImpl extends BaseHibernateDao implements UsersDao {

	public void addUsers(Users user) {
		super.add(user);
	}

	public Users getUser(Users user) {
	Criteria criteria=getSession().createCriteria(Users.class);
	criteria.add(Example.create(user));
		List<Users> list = criteria.list();
		if (list.size() > 0) {
			return list.get(0);
		} else

			return null;
	}

}
