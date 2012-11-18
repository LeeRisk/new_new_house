<%@ page language="java" import="java.util.*,com.laj.entity.*,com.laj.biz.*,com.laj.bizimpl.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	
	HouseBiz hb = new HouseBizImpl();
	Users user=(Users)session.getAttribute("user");
	QueryHouseConditions qc =new QueryHouseConditions();
	qc.setUser(user);
	List<House> list=hb.getHouses(qc);
	int count=5;
	
	
	int totalpage =list.size()%count==0?list.size()/count:list.size()/count+1;
	int pages=request.getParameter("pages")==null?1:new Integer(request.getParameter("pages"));
	if (pages > totalpage) {
		pages = totalpage;
	}
	if (pages < 1) {
		pages = 1;
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>蓝点租房 - 用户管理</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<script type="text/javascript" src="scripts/function.js"></script>

</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
	<div class="search">
    欢迎<%=user.getName() %>使用蓝点租房系统&nbsp;&nbsp;&nbsp;&nbsp;
		<label class="ui-green"><input onclick="window.location.href='index.jsp'" type="button" name="search" value="首    页" /></label>
		<label class="ui-green"><input onclick="window.location.href='add.jsp'" type="button" name="search" value="发布信息" /></label>	
		<label class="ui-green"><input onclick="window.location.href='logout.jsp'" type="button" name="search" value="退    出" /></label>
	</div>
</div>
<div class="main wrap">
	<table class="house-list">
<% for(House h:list) {%>
		<tr>
			<td class="house-thumb"><span><a href="show.jsp?houseid=<%=h.getId() %>"><img src="images/thumb_house.gif" /></a></span></td>
			<td>
				<dl>
					<dt><a href="show.jsp?houseid=<%=h.getId() %>"><%=h.getTitle() %></a></dt>
					<dd>
						<%=h.getStreet().getDistrict().getDistrictName() %>区<%=h.getStreet().getStreetName()%>,<%=h.getSize() %>平米<br />
						联系方式：<%=h.getContact() %>	
					</dd>
				</dl>
			</td>
			<td class="house-type"><label class="ui-green"><input type="button" onclick='document.location="modify.jsp?houseid=<%=h.getId() %>"' name="search" value="修    改" /></label></td>
			<td class="house-price"><label class="ui-green"><input type="button" name="search" value="删    除" onclick='document.location="domanage.jsp?type=del&houseid=<%=h.getId() %>"'  /></label></td>
		</tr>
	<% } %>
	 
  <% if (list.size()==0){ %>
    	<tr><c:out value="无租房信息"></c:out></tr> 
<% } %>
	</table>
	<div class="pager">
		<ul>
			<li class="current"><a href="manage.jsp?pages=1">首页</a></li>
			<li><a href="manage.jsp?pages=<%=pages-1 %>">上一页</a></li>
			<li><a href="manage.jsp?pages=<%=pages+11 %>">下一页</a></li>
			<li><a href="manage.jsp?pages=<%=totalpage %>">末页</a></li>
		</ul>
		<span class="total"><%=pages %>/<%=totalpage %>页</span>
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


