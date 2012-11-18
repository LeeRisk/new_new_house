package com.laj.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.laj.daoimpl.HouseDaoImpl;
import com.laj.daoimpl.HousetypeDaoImpl;
import com.laj.daoimpl.StreetDaoImpl;
import com.laj.entity.House;
import com.laj.entity.Housetype;
import com.laj.entity.QueryHouse;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class searchlistAction extends ActionSupport {
	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String street_id = request.getParameter("street_id");
		String type_id = request.getParameter("type_id");
		String floorage = request.getParameter("floorage");

		QueryHouse qh = new QueryHouse();

		if (title != null && !title.equals(""))
			qh.setTitle("%" + title + "%");
		if (price != null && !price.equals("")) {
			if (price.equals("0-100")) {
				qh.setMinprice(0.0);
				qh.setMaxprice(100.0);
			} else if (price.equals("100-200")) {
				qh.setMinprice(100.01);
				qh.setMaxprice(200.0);
			} else if (price.equals("200-1000000")) {
				qh.setMinprice(200.001);
				qh.setMaxprice(1000000.0);
			}
		}
		if (street_id != null && !street_id.equals("")) {
			qh.setStreet(new StreetDaoImpl().getStreetById(new Integer(
					street_id)));

		}
		if (type_id != null && !type_id.equals("")) {

			qh.setHousetype((Housetype) new HousetypeDaoImpl().get(
					Housetype.class, new Integer(type_id)));
		}
		if (floorage != null) {
			if (floorage.equals("0-40")) {
				qh.setMinsize(0.0);
				qh.setMaxsize(40.0);
			} else if (floorage.equals("40-500")) {
				qh.setMinsize(40.001);
				qh.setMaxsize(500.0);

			} else if (floorage.equals("500-1000000")) {
				qh.setMinsize(500.001);
				qh.setMaxsize(1000000.0);

			}
		}
		List<House> houses = new HouseDaoImpl().getAllHouse(1, 15, qh);
		request.setAttribute("queryhouses", houses);
		return Action.SUCCESS;
	}
}
