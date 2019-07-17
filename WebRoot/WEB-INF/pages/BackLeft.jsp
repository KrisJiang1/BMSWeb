<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BackLeft.jsp' starting page</title>
    
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
            margin:0;
        }
        ul{
            padding:0;
            margin:0;
            height: 500px;
            width: 300px;
        }
        ul li{
            list-style-type:none;
            width: 300px;
            height: 58px;    
        } 
        a{
            text-decoration: none;
            color:black;
            font-size:20px;
        }
        button{
            width: 300px;
            height: 58px; 
            background: white;
            border: 0.5px solid grey;
        }
    </style>
  </head>
  
  <body>
     <ul>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=addBook" target="view_frame">添加图书</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateBook" target="view_frame">修改图书</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=deleteBook" target="view_frame">删除图书</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBook" target="view_frame">查询图书</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateUser" target="view_frame">修改用户</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=deleteUser" target="view_frame">删除用户</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectUser" target="view_frame">查询用户</a></button></li>
        <li><button><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=borrAndRet" target="view_frame">借阅信息查询</a></button></li>
    </ul>
  </body>
</html>
