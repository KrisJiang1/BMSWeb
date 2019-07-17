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
    
    <title>My JSP 'DeleteUser.jsp' starting page</title>
    
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
  	<c:if test="${mode=='deleteUser'}">
	  	<div>
	         <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=deleteUser" method="POST">
	            <p>删除用户</p>
	            <ul>
	                <li>要删除的用户的ID:<input type="text" name="userid" id="userid"></li>
	            </ul>
	            <input type="submit" value="确定提交">
	        </form>
	    </div>
  	</c:if>
  	
  	<c:if test="${mode=='deleteUserSucceed'}">
  		<div>
  			<p>删除成功</p>
  			<a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=deleteUser" target="view_frame">返回</a>
  		</div>
  	</c:if>
  </body>
</html>
