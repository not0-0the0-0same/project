<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
  
  var input=document.getElementById("chatMsg");
  var user=document.getElementById("user");
  input.focus();
  
  var XMLHttpReq;
  
  function createXMLHttpRequest()
  {
  	if(window.XMLHttpRequest)
  		XMLHttpReq=new XMLHttpRequest();
  	else if(window.ActiveXObject)
  	{
  		try{
  			XMLHttpReq= new ActiveXObject("Msxml2.XMLHTTP");
  		}
  		catch(e)
  		{
  			try{
  				XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
  			}
  			catch(e){alert("都不行");}
  		}
  	}
  	
  }//判断浏览器版本
  
  function sendRequest()
  {

  	createXMLHttpRequest();
  	
  	var url="http://localhost/HappyChat/control/ChatServlet";
  	XMLHttpReq.open("POST",url,true);
  	XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	XMLHttpReq.onreadystatechange= processResponse;
  	var conten = "user="+user.value+"&chatMsg="+input.value;
  	XMLHttpReq.send(conten);
  	input.value="";
  }//发送请求
  
  function sendEmptyRequest()
  {
  	createXMLHttpRequest();
  	var url="${pageContext.request.contextPath }/servlet/ChatServlet" ;
  	XMLHttpReq.open("POST",url,true);
  	XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	XMLHttpReq.onreadystatechange= processResponse;
  	XMLHttpReq.send(null);
  	setTimeout("sendEmptyRequest()",800);
  }

  function processResponse()
  {
  	if(XMLHttpReq.readyState==4)
  	{	
  		if(XMLHttpReq.status==200)
  		{
  		document.getElementById("chatArea").value=XMLHttpReq.responseText;
  		}
  		else
  		{
  		window.alert("state是"+XMLHttpReq.readyState+" status是"+XMLHttpReq.status);
  		}
  	}
  }
  
  
  function enterHandler(event)
  {
  	var keyCode=event.keyCode?event.keyCode:event.which?event.which:event.charCode;
  	if(keyCode==13)
  	{
  	sendRequest();
  	}
  }
  
  </script>
  </head>
  
  <body onload="sendEmptyRequest()">
  
  
  
  <table width="780" border="1" align="center">
  <tr>
  <td><p align="center">聊天页面</p>
  <p align="center">
  	<textarea id="chatArea" name="chatArea" rows="20" cols="100" readonly></textarea>
  </p>
  
  <div>
  	昵称:<input id="user" name="user" type="text" size="8" />
  	输入信息:<input id="chatMsg" name="chatMsg" size="82" onkeypress="enterHandler(event);"/>
  	<input type="button" name="button" value="提交" onclick="sendRequest();"/>
  </div>
  </td>
  </tr>
  </table>
  
  </body>
  
  
</html>
