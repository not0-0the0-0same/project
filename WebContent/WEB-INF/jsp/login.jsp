<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" href="../../css/Untitled-1.css" type="text/css"/>
</head>

<body>
<div id="wrap">
<div id="header">
	<div class="logo">网页聊天室</div>
    <div class="navigation">
    <ul>
    	<li class="nav1"><a href="#" class="nav1_on">账号登录</a></li>
        <li class="nav2"><a href="register.jsp">账号注册</a></li>
    </ul>
    </div>
</div>
<div id="mainbody">
<div class="loginBox">
<form action="${pageContext.request.contextPath }/servlet/LoginServlet" method="post">
<ul>
    <li class="txt_style"><label class="c">账号</label><input type="text" placeholder="请输入账户" class="text user"></li>
    <li class="txt_style"><label class="c">密码</label><input type="password" placeholder="请输入密码" class="text password"></li>
    <li><input type="submit" value="登录" class="login_button" name="submit"></li>
</ul>
</form>
</div>
</div>
<div id="footer">
</div>
</div>
</body>
</html>
