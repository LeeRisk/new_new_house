<%@ page language="java" import="java.util.*,com.laj.entity.*,com.laj.biz.*,com.laj.bizimpl.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>蓝点租房 - 用户登录</title>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<script type="text/javascript" src="scripts/function.js"></script>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><img src="images/logo.gif" /></div>
</div>
<div id="regLogin" class="wrap">
	<div class="dialog">
		<div class="box">
			<h4>用户登录</h4>
		<s:form action="checkusersaction.action" method="post" validate="true" >
			
				<div class="infos">
					<table class="field">
								
						<tr>
							<td colspan="2" >
</td>
						</tr>
					
						<tr>
							<td class="field">用 户 名：</td>
							<td><s:textfield  name="user.name" />
							</td>
						</tr>
						<tr>
							<td class="field">密　　码：</td>
							<td><s:password  name="user.password" />
							</td>
						</tr>
					</table>
					<div class="buttons">
						<s:submit theme="simple" value="立即登录"/>
						<input type='button' value='注册' onclick='document.location="register.jsp"'/>
					</div>
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


