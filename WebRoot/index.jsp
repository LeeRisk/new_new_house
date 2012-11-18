<%@ page language="java" import="java.util.*,com.laj.entity.*,com.laj.biz.*,com.laj.bizimpl.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	request.setCharacterEncoding("utf-8");
	//int pages = session.getAttribute("pages") == null ? 1 : Integer.parseInt(session.getAttribute("pages").toString());
/*	int count = 3;
	int pages=request.getParameter("pages")==null?1:new Integer(request.getParameter("pages"));
	HouseBiz hb = new HouseBizImpl();
	HousetypeBiz htb = new HousetypeBizImpl();
	StreetBiz sb = new StreetBizImpl();
	
	Users user=(Users)session.getAttribute("user");

	int totalpage = hb.totalpage(count);
	if (pages > totalpage) {
		pages = totalpage;
	}
	if (pages < 1) {
		pages = 1;
	}
	List<House> houses = hb.getHouseBypage(pages, count);
	session.setAttribute("pages", pages);

	List<Street> streets = sb.getStreets();
	List<Housetype> housetypes = htb.getHousetypes();*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>蓝点租房 - 首页</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
    <div class="search">
    	欢迎<s:property value="#session.user" default="%{****}" />使用蓝点租房系统&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="ui-green"><input onclick="window.location.href='manage.jsp'" type="button" name="search" value="会员中心" /></label>
		<label class="ui-green"><input onclick="window.location.href='logout.jsp'" type="button" name="out" value="退    出" /></label>
        <label class="ui-green"><input onclick="window.location.href='login.jsp'" type="button" name="login" value="登    陆" /></label>	
	</div>
</div>
<div id="navbar" class="wrap">

	<dl class="search clearfix">
		<form method="post" action="" id='sform'>
			<dt>
				<ul>
					<li class="bold">房屋信息</li>
					<li>
						标题：<input type="text" class="text" value='' name="title" />
						<label class="ui-blue"><input type="submit" name="search" value="搜索房屋" /></label>
					</li>
				</ul>
			</dt>
			<dd>
				<ul>
					<li class="first">
						价格
					</li>
					<li>
						<select name='price'>
							<option value='0'>不限</option>
							<option value='0-100'>100元以下</option>
							<option value='100-200'>100元—200元</option>
							<option value='200-1000000'>200元以上</option>
						</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">房屋位置</li>
					<li>
							<select name='street_id' id='street'>
								<option value='0'>不限</option>
								<s:iterator value="#request.streets" var="s" >				
								<option value='${s.id}'>${s.streetName}</option>
							</s:iterator>						
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">房型</li>
					<li>
							<select name='type_id'>
								<option value='0'>不限</option>
								<s:iterator var="ht" value="housetypes">
								<option value='${ht.id }'>${ht.typeName}</option>
								</s:iterator>							
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">
						面积
					</li>
					<li>
							<select name='floorage'>
								<option value='0'>不限</option>
								<option value='0-40'>40以下</option>
								<option value='40-500'>40-500</option>
								<option value='500-1000000'>500以上</option>							
							</select>
					</li>
				</ul>
			</dd>
		</form>
	</dl>
</div>
<div class="main wrap">
	<table class="house-list">
	<s:iterator var="h" value="houses">
		<tr>
			<td class="house-thumb"><span><a href="show.jsp?houseid="><img src="images/thumb_house.gif" /></a></span></td>
			<td>
				<dl>
					<dt>${h.title }</dt>
					<dd>
						${h.street.district.districtName }区${h.street.streetName },${h.size }平米<br />
						联系方式：${h.contact }
					</dd>
				</dl>
			</td>
			<td class="house-type">${h.housetype.typeName }</td>
			<td class="house-price"><span>${h.price}</span>元/月</td>
		</tr>
	</s:iterator>
		
  	
	</table>
	<div class="pager">
		<ul>
			<li class="current"><a href="index.jsp?pages=1">首页</a></li>
			<li><a href="index.jsp?pages=${pages-1 }">上一页</a></li>
			<li><a href="index.jsp?pages=${pages-1 }">下一页</a></li>
			<li><a href="index.jsp?pages=${totalpage }">末页</a></li>
		</ul>
		<span class="total">${pages-1 }/${totalpage }页</span>
	</div>
</div>
<div id="footer" class="wrap">
	<dl>
    	<dt>蓝点租房 &copy; 2012 国信蓝点 京ICP证1000001号</dt>
        <dd>关于我们 · 联系方式 · 意见反馈 · 帮助中心</dd>
    </dl>
</div>
</body>
</html>