package com.laj.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.laj.biz.HouseBiz;
import com.laj.bizimpl.HouseBizImpl;
import com.laj.entity.House;
import com.laj.entity.Users;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class mangeraction extends ActionSupport {
	private House house;

	public String show() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HouseBiz hb = new HouseBizImpl();
		Users user = (Users) ActionContext.getContext().getSession()
				.get("user");

		List<House> list = hb.getHouseBypage(1, 15, user);
		int count = 5;
		int totalpage = list.size() % count == 0 ? list.size() / count : list
				.size()
				/ count + 1;
		int pages = request.getParameter("pages") == null ? 1 : new Integer(
				request.getParameter("pages"));
		if (pages > totalpage) {
			pages = totalpage;
		}
		if (pages < 1) {
			pages = 1;
		}
		request.setAttribute("house", list);
		request.setAttribute("pages", pages);
		return Action.SUCCESS;
	}

	public String del() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HouseBiz hb = new HouseBizImpl();
		int id = new Integer(request.getParameter("id"));
		hb.delHouse(id);

		return Action.SUCCESS;
	}

	public String modify() {

		HouseBiz hb = new HouseBizImpl();

		hb.update(house);

		return Action.SUCCESS;
	}

	public String getByid() {

		HttpServletRequest request = ServletActionContext.getRequest();
		HouseBiz hb = new HouseBizImpl();
		int id = new Integer(request.getParameter("id"));
		House rs = hb.getHouseByid(id);
		request.setAttribute("house", rs);
		return Action.SUCCESS;
	}

}
