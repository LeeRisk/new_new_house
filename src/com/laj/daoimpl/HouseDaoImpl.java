package com.laj.daoimpl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;

import com.laj.dao.BaseHibernateDao;
import com.laj.dao.HouseDao;
import com.laj.entity.House;
import com.laj.entity.QueryHouse;
import com.laj.entity.Users;

public class HouseDaoImpl extends BaseHibernateDao implements HouseDao {

	public void addHouse(House house) {
		super.add(house);

	}

	public List<House> getAllHouse(int pageNum, int pageCount) {
		Session session = super.getSession();
		Criteria criteria = session.createCriteria(House.class);
		criteria.setFirstResult((pageNum - 1) * pageCount);
		criteria.setMaxResults(pageCount);
		return criteria.list();
	}

	public List<House> getAllHouse(int pageNum, int pageCount,
			QueryHouse qh) {
		Session session = super.getSession();
		String hql="from House where 1=1 ";
		if(qh!=null)
		{
			if(qh.getHousetype()!=null)
			{
				hql+=" and housetype=:housetype ";
			}
			if(qh.getMaxprice()>0)
			{
				hql+=" and price between :minprice and :maxprice";
			}
			if(qh.getMaxsize()>0)
			{
				hql+=" and size between :minsize and :maxsize";
			}
			if(qh.getStreet()!=null)
			{
				hql+=" and street =:street";
			}
			if(qh.getTitle()!=null)
			{
				hql+=" and title like :title";
			}
			
		}
		Query query=session.createQuery(hql);
		query.setProperties(qh);
		query.setFirstResult((pageNum - 1) * pageCount);
		query.setMaxResults(pageCount);

		return query.list();
	}

	public List<House> getAllHouse(int pageNum, int pageCount, Users user) {
		Session session = super.getSession();
		Criteria criteria = session.createCriteria(House.class);
		criteria.setFirstResult((pageNum - 1) * pageCount);
		criteria.setMaxResults(pageCount);
		criteria.add(Restrictions.eq("users", user));

		return criteria.list();
	}
     //获得页数
	public int getHousepages(int count) {
		Session session = getSession();
		String hql = "select count(*) from House ";
		List list = session.createQuery(hql).list();
		if (list.size() > 0)
		{
			int total=Integer.parseInt(list.get(0).toString());
			return total%count==0?total/count:(total/count+1);
		}
		else
			return 0;
	}

	public void updateHouse(House house) {
		super.update(house);

	}

	public int getHousepages(int count, Users user) {
		Session session = getSession();

		Criteria criteria = session.createCriteria(House.class);
		criteria.add(Restrictions.eq("users", user));
		List list =criteria.list();
		if (list.size() > 0)
		{
			int total=list.size();
			return total%count==0?total/count:(total/count+1);
		}
		else
			return 0;
	}
	@Test 
	public void testgetHousepages()
	{
		Users user=new Users();
		user.setId(1);
		System.out.println(getAllHouse(1, 5, user)) ;
	}




}
