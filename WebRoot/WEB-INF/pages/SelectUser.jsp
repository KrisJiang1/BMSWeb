<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SeleteUser.jsp' starting page</title>
    
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
  	<c:if test="${mode=='selectUserFir'}">
	  <div>
		  <p>查询用户信息</p>
		  <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=selectUserById" method="POST">
		  <ul>
		  <li>查询的用户的ID<input type="text" name="userid" id="userid"></li>
		  </ul>
		  <input type="submit" value="确定">
		  </form>
	  </div>   
	</c:if> 
	<c:if test="${mode=='selectUser'}">	
      <div>
        <p>查询到的用户信息</p>
        <ul>
        	<li>用户名:${user.userName}</li>
        	<li>密码:${user.userPassword}</li>
        	<li>年龄:${user.userAge}</li>
        	<li>电话:${user.userTel}</li>
        	<li>性别:${user.userSex}</li>
        	<li>注册时间:${user.userRegTime}</li>
        </ul>
        <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectUser" target="view_frame">返回</a>
     </div> 
   </c:if>   
  </body>
</html>
