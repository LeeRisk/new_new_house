<%@ page language="java" import="java.util.*,com.laj.entity.*,com.laj.biz.*,com.laj.bizimpl.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
Users user=(Users)session.getAttribute("user");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>蓝点租房 - 用户注册</title>
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
			<dt>新用户注册</dt>
			<dd class="past">填写个人信息</dd>
		</dl>
		<div class="box">
			<s:form action="addUsersusersaction.action" method="post">
				<div class="infos">
					<table class="field">
						<tr>
							<td class="field">用 户 名：</td>
							<td><s:textfield class="text" name="user.name" /> </td>
						</tr>
						<tr>
							<td class="field">密　　码：</td>
							<td><s:password class="text" name="user.password" /></td>
						</tr>
						<tr>
							<td class="field">确认密码：</td>
							<td><s:password class="text" name="repassword" /> </td>
						</tr>
						<tr>
							<td class="field">电　　话：</td>
							<td><s:textfield class="text" name="user.telephone" /> </td>
						</tr>
						<tr>
							<td class="field">用户姓名：</td>
							<td><s:textfield class="text" name="user.username" /> </td>				
						</tr>
					</table>
					<div class="buttons"><s:submit name="submit" value="立即注册" /></div>
				</div>
			</s:form>
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

