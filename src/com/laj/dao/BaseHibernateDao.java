package com.laj.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

public class BaseHibernateDao {
	public Session getSession() {
		return HibernateSessionFactory.getSession();
	}

	public void add(Object obj) {
		Session session = this.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(obj);
			tx.commit();
		} catch (RuntimeException e) {
			e.printStackTrace();
			tx.rollback();

		}
	}

	public Object get(Class clazz, int id) {
		return this.getSession().load(clazz, id);
	}

	public void delete(Class clazz, int id) {
		Session session = this.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(session.get(clazz, id));
			tx.commit();
		} catch (RuntimeException e) {
			e.printStackTrace();
			tx.rollback();

		}
	}

	public List getAll(Class clazz) {
		return this.getSession().createCriteria(clazz).list();
	}

	public List getAll(Class clazz, Object o) {
		Criteria criteria = this.getSession().createCriteria(clazz);
		criteria.add(Example.create(o));
		return criteria.list();
	}
public void update(Object obj)
{
	Session session = this.getSession();
	Transaction tx = null;
	try {
		tx = session.beginTransaction();
		session.update(obj);
		tx.commit();
	} catch (RuntimeException e) {
		e.printStackTrace();
		tx.rollback();

	}
}
}
