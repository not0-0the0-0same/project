<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>注册</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/Untitled-1.css" type="txet/css"><!--绝对路径  -->
</head>
<body>
<div id="wrap">
<div id="head">
<div class="logo">网页聊天室</div>
    <div class="navigation">
    <ul>
    	<li class="nav1"><a href="${pageContext.request.contextPath}/jsp/login.jsp">账号登录</a></li>
        <li class="nav2"><a href="#" class="nav2_on">账号注册</a></li>
    </ul>
    </div>
</div>
<div id="mainbody">
<div class="registerBox">
<form action="/HappyChat/RegisterServlet" method="post">
<ul>
    <li><span class="d">账号</span><input type="text"           placeholder="请输入账户" class="text user"     name="username"  value="${form.username }"><span class="m">${form.errors.username }</span></li>
    <li><span class="d">输入密码</span><input type="password"    placeholder="请输入密码" class="text password" name="password" value="${form.password}"> <span class="m">${form.errors.password}</span></li>
    <li><span class="d">再次输入密码</span><input type="password" placeholder="请输入密码" class="text password" name="password2"> 						   <span class="m">${form.errors.password2}</span></li>
    <li><span class="d">您的昵称是</span><input type="text"      placeholder="请输入昵称" class="text"          name="nickname" value="${form.nickname}"><span class="m">${form.errors.nickname}</span></li>
    <li><span class="d">您的邮箱是</span><input type="text" placeholder="请输入邮箱" class="text" name="email" value="${form.email}"><span class="m">${form.errors.email}</span></li>
    <li><span class="f"><input type="checkbox" id="t1" class="checked" /><label for="t1">我同意<a href="#">什么条款</a></label></span></li>
    <li><input type="submit" value="注册" class="reg_button" name="submit"></li>
</ul>
</form>
</div>
</div>
<div id="footer">
</div>
</div>
</body>
</html>
