<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>开心聊</title>
<style type="text/css">
body,ul,li,p,h1,h2,h3,h4,h5,h6,form,fieldset,table,td,img,div,dl,dt,dd,iput{margin:0;padding:0;}

body{font-size:12px;}

img{border:none;}

li{list-style:none;}

input,select,textarea{outline:none;}

textarea{resize:none;}

a{text-decoration:none;}

#wrapMain{
	height:620px;
	background:#003;
}
.logoMain{
	width:100%;
	height:80px;
	
	text-align:center;
}
.logoText{
	line-height:80px;
	font-family:"微软雅黑";
	font-size:30px;
	color:#FFF;
	
}
.setting{
	float:right;
	
	margin-top:20px;
	margin-right:10px; 
}
.left{
	float:left;
	background:#EEE;
	width:300px;
	height:500px;
	border:2px solid #FFF;
	margin-left:60px;
}
.contacts{
	width:100%;
	height:40px;
	text-align:center;
	font-family:"微软雅黑";
	font-size:25px;
	
	border-bottom:2px solid #FFF;
	background:url(../images/menu.png) no-repeat right;
}
.right{
	float:left;
	background:#EEE;
	width:900px;
	height:530px;	
}
.chattingWindow{
	width:900px;
	height:370px;
	overflow:auto;
}
.inputBox{
	width:880px;
	height:150px;
	margin:0 auto;
}
.inputBox textarea{
	width:700px;
	height:100px;
	margin-left:25px;
	margin-top:15px;
	font-family:"微软雅黑";
	font-size:14px;
	
}
.buttons{
	width:95px;
	height:110px;
	float:right;
	margin-top:74px;
	margin-right:50px;	
}
.send_button{
	width:95px;	
	height:45px;
	font-family:"微软雅黑";
	font-size:20px;
	background:#06F;
	color:#FFF;
}
.user_list{
	padding:10px 30px;
	overflow:auto;
}
.user_list li{
	
	margin-bottom:20px;	
	cursor:pointer;
}
.user_list li span{
	margin-right:10px;
	display:block;
	float:left;
	
}
.user_list li em{	
	display:inline-block;
	width:30px;
	height:30px;
	line-height:30px;
	font-family:"微软雅黑";
	font-size:14px;	
	font-style:normal;	
	
}
.user_box{
	width:800px;
	margin:20px auto 0;
	
	overflow:auto;
	
}
.user_face{
	float:left;
}
.content_box{
	position:relative;
	background:#0CF;
	padding:15px;
	margin-left:50px;
	
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
}
.user_message{
	font-family:"微软雅黑";
	font-size:14px;	
	line-height:24px;
}
.name_time{
	margin-left:50px;
}
</style>
</head>

<body>
<div id="wrapMain">

<div id="headMain">
<div class="logoMain">
<span class="logoText">聊天室</span>
<div class="setting">
<a href="#" title="设置"><img src="../images/setting.png"></a>
</div>
</div>
</div>

<div id="bodyMain">
  <c:if test="${user!=null }">
  欢迎：${user.username } <a href="${pageContext.request.contextPath }/servlet/loginOutServlet">注销</a><br/>
  </c:if>
   <a href="${pageContext.request.contextPath }/servlet/registerUIServlet">注册</a> <br>
   <a href="${pageContext.request.contextPath }/servlet/loginUIServlet">登录</a> <br>
<div class="left">
<div class="contacts">联系人</div>

<ul class="user_list" title="">
	<li><span><img src="../images/53f44283a4347.jpg" width="30" height="30"/></span><em>1号</em></li>
   	<li><span><img src="../images/53f442834079a.jpg" width="30" height="30"/></span><em>2号</em></li>
    <li><span><img src="../images/hetu.jpg" width="30" height="30"/></span><em>3号</em></li>
</ul>

</div>

<div class="right">
<div class="chattingWindow">

 <div class="user_box">
  <img class="user_face" src="../images/53f442834079a.jpg" width="40" height="40" />
   <div class="name_time">一号·1分钟前</div>
  <div class="content_box">
  	<span class="user_message">1号说的话坎坎坷坷扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩</span>
  </div>
 </div>
 
 <div class="user_box">
  <img class="user_face" src="../images/hetu.jpg" width="40" height="40" />
  <div class="name_time">二号·1分钟前</div>
  <div class="content_box">
  	<span class="user_message">2号说的话</span>
  </div>
 </div>
 
 <div class="user_box">
  <img class="user_face" src="../images/53f442834079a.jpg" width="40" height="40" />
  <div class="name_time">一号·1分钟前</div>
  <div class="content_box">
  	<span class="user_message">1号说的话坎坎坷坷扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩</span>
  </div>
 </div>
 
 <div class="user_box">
  <img class="user_face" src="../images/53f442834079a.jpg" width="40" height="40" />
  <div class="name_time">一号·1分钟前</div>
  <div class="content_box">
  	<span class="user_message">1号说的话坎坎坷坷扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩</span>
  </div>
 </div>
 
 <div class="user_box">
  <img class="user_face" src="../images/53f442834079a.jpg" width="40" height="40" />
  <div class="name_time">一号·1分钟前</div>
  <div class="content_box">
  	<span class="user_message">1号说的话坎坎坷坷扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩扩</span>
  </div>
 </div>
 
</div>
<form>
<div class="inputBox">
<textarea></textarea>
<div class="buttons"><input type="submit" value="发送" class="send_button"/></div>
</div>
</form>
</div>
</div>

<div id="footMain">
</div>
</div>
</body>
</html>
