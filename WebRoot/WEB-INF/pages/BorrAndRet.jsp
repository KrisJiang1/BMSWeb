<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'BorrAndRet.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	

	</script>

  </head>
  
  <body>
    <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=addBRM" target="view_frame">添加用户借还信息</a>
    <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateBRMFir" target="view_frame">修改用户借还信息</a>
    <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=deleteBRM" target="view_frame">删除用户借还信息</a>
    <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBRM" target="view_frame">查询用户借还信息</a>
  </body>
</html>
