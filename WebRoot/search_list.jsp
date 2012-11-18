<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>蓝点租房 - 首页</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<script type="text/javascript" src="scripts/function.js"></script>
	<script type="text/javascript">
		function toUrl(url){
			window.location.href = url;
			return;
		}
		
		function doSearch(){
			var f = document.getElementById('sform');
			f.submit();
		}
		function init(){
			var price = '${price}';
			var p = document.getElementById('price');
			if(price == '0-100'){
				p.selectedIndex = 1;
			}else if(price == '100-200'){
				p.selectedIndex = 2;
			}else if(price == '200-1000000'){
				p.selectedIndex = 3;
			}

			var street = '${street_id}';
			var d = document.getElementById('street');
			if(street == '1000'){
				d.selectedIndex = 1;
			}else if(street == '1001'){
				d.selectedIndex = 2;
			}else if(street == '1002'){
				d.selectedIndex = 3;
			}else if(street == '1003'){
				d.selectedIndex = 4;
			}

			var housetype = '${type_id}';
			var h = document.getElementById('housetype');
			if(housetype == '1000'){
				h.selectedIndex = 1;
			}else if(housetype == '1001'){
				h.selectedIndex = 2;
			}else if(housetype == '1002'){
				h.selectedIndex = 3;
			}else if(housetype == '1003'){
				h.selectedIndex = 4;
			}
			
			var floorage = '${floorage}';
			var f = document.getElementById('floorage');
			if(floorage == '0-40'){
				f.selectedIndex = 1;
			}else if(floorage == '40-500'){
				f.selectedIndex = 2;
			}else if(floorage == '500-1000000'){
				f.selectedIndex = 3;
			}
		}
	</script>
</head>
<body onload='init()'>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
</div>
<div id="navbar" class="wrap">

	<dl class="search clearfix">
		<form method="post" action="search.action" id='sform'>
			<dt>
				<ul>
					<li class="bold">房屋信息</li>
					<li>
						标题：<input type="text" class="text" value='${title }' name="title" />
						<label class="ui-blue"><input type="button" onclick='doSearch()' name="search" value="搜索房屋" /></label>
					</li>
				</ul>
			</dt>
			<dd>
				<ul>
					<li class="first">
						价格
					</li>
					<li>
						<select name='price' id='price'>
							<option value=''>不限</option>
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
								<option value=''>不限</option>
								<option value='1000'>知春路</option>
								<option value='1001'>中关村大街</option>
								<option value='1002'>学院路</option>
								<option value='1003'>朝阳路</option>								
							</select>
					</li>
				</ul>
			</dd>
			<dd>
				<ul>
					<li class="first">房型</li>
					<li>
							<select name='type_id' id='housetype'>
								<option value=''>不限</option>
								<option value='1000'>一室一厅</option>
								<option value='1001'>一室两厅</option>
								<option value='1002'>两室一厅</option>
								<option value='1003'>两室两厅</option>								
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
							<select name='floorage' id='floorage'>
								<option value=''>不限</option>
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
	<c:if test="${requestScope.result ne null}">	
	<c:forEach items="${requestScope.result}" var="house" varStatus="status">
		<c:if test="${status.count%2 != 0}">
		<tr>
			<td class="house-thumb"><span><a href="show?id=${house.id}"><img src="images/thumb_house.gif" /></a></span></td>
			<td>
				<dl>
					<dt><a href="detail.action?id=${house.id}">${house.title}</a></dt>
					<dd>
						${house.street.district.name}区${house.street.name},${house.floorage }平米<br />
						联系方式：${house.contact }	
					</dd>
				</dl>
			</td>
			<td class="house-type">${house.type.name }</td>
			<td class="house-price"><span>${house.price }</span>元/月</td>
		</tr>
		</c:if>
		<c:if test="${status.count%2 == 0}">
		<tr class="odd">
			<td class="house-thumb"><span><a href="view.html"><img src="images/thumb_house.gif" /></a></span></td>
			<td>
				<dl>
					<dt><a href="detail.action?id=${house.id}">${house.title}</a></dt>
					<dd>
						${house.street.district.name}区${house.street.name},${house.floorage }平米<br />
						联系方式：${house.contact }				
					</dd>
				</dl>
			</td>
			<td class="house-type">${house.type.name }</td>
			<td class="house-price"><span>${house.price }</span>元/月</td>
		</tr> 
		</c:if>
		
    </c:forEach>
    </c:if>   
  	<c:if test="${empty requestScope.result}">
    	<tr><c:out value="无租房信息"></c:out></tr> 
    </c:if>
	</table>
	<div class="pager">
		<ul>
			<li class="current"><a href="#">首页</a></li>
			<li><a href="#">上一页</a></li>
			<li><a href="#">下一页</a></li>
			<li><a href="#">末页</a></li>
		</ul>
		<span class="total">1/2页</span>
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