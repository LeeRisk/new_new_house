package com.laj.action;

import java.util.Map;

import com.laj.biz.UsersBiz;
import com.laj.bizimpl.UsersBizImpl;
import com.laj.daoimpl.UserDaoImpl;
import com.laj.entity.Users;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class useraction extends ActionSupport {
	private Users user;
	private String repassword;

	// 登录
	public String check() {
		UsersBiz ub = new UsersBizImpl();
		Users users = ub.checkLogin(user);
		if (users == null) {

			return Action.INPUT;
		} else {
			// 非注入非耦合得到servletapi
			ActionContext cxt = ActionContext.getContext();
			Map<String, Object> session = cxt.getSession();
			session.put("user", users);
			return Action.SUCCESS;
		}

	}

	// 注册
	public String addUsers() {
		if (user == null) {

			return Action.INPUT;
		}
		UsersBiz ud = new UsersBizImpl();
		ud.addUsers(user);
		ActionContext.getContext().getSession().put("user", user);
		return Action.SUCCESS;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

}
