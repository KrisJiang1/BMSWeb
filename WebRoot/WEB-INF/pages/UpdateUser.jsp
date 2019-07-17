<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UpdateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<c:if test="${mode=='updateUserFir'}">
	  	<div>
	        <p>修改用户信息</p>
	        <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateUserFir" method="POST">
	            <ul>
	                <li>修改的用户的ID: <input type="text" name="userid" id="userid"></li>
	            </ul>
	            <input type="submit" value="确认">
	        </form>
	    </div>
  	</c:if>
  	
  	<c:if test="${mode=='updateUser'}">
	    <div>
	    	<p>修改用户信息</p>
	        <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateUser" method="POST">
	            <ul>
	                <li><input type="hidden" id="userid" name="userid" value="${user.userId}"></li>
	                <li>名称: <input type="text" name="username" id="username" value="${user.userName}"></li>
	                <li>年龄: <input type="number" name="userage" id="userage" value="${user.userAge}"></li>
	                <li>电话：<input type="tel" name="usertel" id="usertel" value="${user.userTel}"></li>
	                <li>性别: <select name="usersex" id="usersex" value="${userSex}">
	                            <option value="男">男</option>
	                            <option value="女">女</option>
	                         </select></li>
	                <li>注册日期: <input type="date" name="userregtime" id="userregtime" value="${userRegTime}"></li>
	                <li></li>
	            </ul>
	            <input type="submit" value="确定修改">
	        </form>
	    </div>
    </c:if>
    
    <c:if test="${mode=='updateUserSucceed'}">
    	<p>修改成功</p>
    	<a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateUser" target="view_frame">返回</a>
    </c:if>
  </body>
</html>
