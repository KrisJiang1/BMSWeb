<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LoginMainInterface.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<style>
        body{
            padding: 0;
            marig:0;
            background-image:url('book1.jpg');    
            background-position-x: 100px;
        }

        #loginChoose{
            width: 350px;
            height: 480px;
            margin-top:130px; 
            float: right;
            margin-right: 150px; 
        }

        #stuLogin,#adminLogin{
            width: 270px;
            height: 90px;
            border: 5px solid burlywood;
            margin: auto;
            margin-top: 100px;
            font-weight: 900;
        }

        a{
            width: 100%;
            height: 100%;
            display: block;
            font-size: 32px;
            text-decoration: none;
            color:azure;
            text-align: center;
            box-sizing:border-box;
            padding-top: 26px;
        }
    </style>
 </head>
 <body>
    <div id="loginChoose">
        <div id="stuLogin"><a href="">学生登录</a></div>
        <div id="adminLogin"><a href="AdminLogin.html">管理员登陆</a></div>
    </div>
</body>
</html>
