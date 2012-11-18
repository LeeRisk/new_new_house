package com.laj.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.laj.biz.HouseBiz;
import com.laj.biz.HousetypeBiz;
import com.laj.biz.StreetBiz;
import com.laj.bizimpl.HouseBizImpl;
import com.laj.bizimpl.HousetypeBizImpl;
import com.laj.bizimpl.StreetBizImpl;
import com.laj.entity.House;
import com.laj.entity.Housetype;
import com.laj.entity.QueryHouse;
import com.laj.entity.Street;
import com.laj.entity.Users;
import com.opensymphony.xwork2.ActionSupport;

public class inaction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Users user;

	private int pages;
	private int totalpage;

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		// HttpSession session = request.getSession();
		// int pages = session.getAttribute("pages") == null ? 1 :
		// Integer.parseInt(session.getAttribute("pages").toString());
		int count = 3;
		pages = request.getParameter("pages") == null ? 1 : new Integer(request
				.getParameter("pages"));
		HouseBiz hb = new HouseBizImpl();
		HousetypeBiz htb = new HousetypeBizImpl();
		StreetBiz sb = new StreetBizImpl();

		totalpage = hb.totalpage(count);
		if (pages > totalpage) {
			pages = totalpage;
		}
		if (pages < 1) {
			pages = 1;
		}
		List<House> houses = hb.getHouseBypage(pages, count, new QueryHouse());
		request.setAttribute("pages", pages);

		List<Street> streets = sb.getStreets();
		List<Housetype> housetypes = htb.getHousetypes();
		request.setAttribute("houses", houses);
		request.setAttribute("streets", streets);
		request.setAttribute("housetypes", housetypes);
		return "success";
	}

	public int getTotalpage() {
		return totalpage;
	}

	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

}
