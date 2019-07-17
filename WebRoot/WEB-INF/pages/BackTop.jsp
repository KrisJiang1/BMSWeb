<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BackTop.jsp' starting page</title>
    
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
            padding:0;
            margin: 0;
        }
        .top{
            height: 100px;
            width: 100%;    
        }
        .container-top{
            width:70%;
            height:100%;
            padding-top: 30px;
            padding-left:15%;
            padding-right:15%;
            font-size:25px;
            font-weight: 700;
            text-align: center;   
        }
        
    </style>
  </head>
  
  <body>
    <div class="top">
        <div class="container-top">图书管理后台界面</div>
    </div>
  </body>
</html>
