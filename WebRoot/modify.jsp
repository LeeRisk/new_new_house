<%@ page language="java" import="java.util.*,com.laj.entity.*,com.laj.biz.*,com.laj.bizimpl.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	HouseBiz hb = new HouseBizImpl();
	int houseid=new Integer(request.getParameter("houseid"));
	House house=hb.getHouseByid(houseid);
	
	HousetypeBiz htb = new HousetypeBizImpl();
	DistrictBiz db=new DistrictBizImpl();
	StreetBiz sb = new StreetBizImpl();
	List<Street> streets = sb.getStreets();
	List<Housetype> housetypes = htb.getHousetypes();
	List<District> districts = db.getDistricts();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>蓝点租房 -修改房屋信息</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>

</div>
<div id="regLogin" class="wrap">
	<div class="dialog">
		<dl class="clearfix">
			<dt>房屋信息修改</dt>
			<dd class="past">修改房屋信息</dd>

		</dl>
		<div class="box">
			<form action="domodify.jsp"  method="post">
			<input type='hidden' value='<%=houseid %>' name='houseid'/> 
				<div class="infos">
					<table class="field">
						<tr>
							<td class="field">标　　题：</td>
							<td><input type="text" class="text" name="title" value='<%=house.getTitle() %>'/></td>
						</tr>
						<tr>
							<td class="field">户　　型：</td>
							<td><select  class="text" name="type_id" value="<%=house.getHousetype().getId() %>">
							<%
									for (Housetype ht : housetypes) {
								%>
								<option value='<%=ht.getId()%>'
								
								<% 
								
								if(ht.getId()==house.getHousetype().getId())
								out.println("selected = 'selected'");
								 %>
								><%=ht.getTypeName()%></option>
								<%
									}
								%>			

							</select></td>
						</tr>
						<tr>
							<td class="field">面　　积：</td>
							<td><input type="text" class="text" name="floorage"  value='<%=house.getSize() %> '/></td>
						</tr>
						<tr>
							<td class="field">价　　格：</td>
							<td><input type="text" class="text" name="price"  value='<%=house.getPrice()%>'/></td>
						</tr>
                        <tr>
							<td class="field">位　　置：</td>
							<td>区：
							<select  class="text" name="district_id" value="<%=house.getStreet().getDistrict().getId() %>">
								<%
									for (District d : districts) {
								%>
								<option value='<%=d.getId()%>' <% 
								
								if(d.getId()==house.getStreet().getDistrict().getId())
								out.println("selected = 'selected'");
								 %>><%=d.getDistrictName()%></option>
								<%
									}
								%>		</select>
                            	街：<select  class="text" name="street_id" value="<%=house.getStreet().getId() %>">
                            	<%
									for (Street s : streets) {
								%>
								<option value='<%=s.getId()%>' <% 
								
								if(s.getId()==house.getStreet().getId())
								out.println("selected = 'selected'");
								 %>
								 ><%=s.getStreetName()%></option>
								<%
									}
								%>		
                            	</select>
                            </td>
						</tr>
                        <tr>
							<td class="field">联系方式：</td>
							<td><input type="text" class="text" name="contact" value='<%=house.getContact() %>'/></td>
						</tr>
                        <tr>
							<td class="field">详细信息：</td>
							<td><textarea name="description"><%=house.getDescription() %></textarea></td>
						</tr>
					</table>
					<div class="buttons"><input type="submit" name="submit" value="立即修改" /></div>
				</div>
			</form>
		</div>
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



