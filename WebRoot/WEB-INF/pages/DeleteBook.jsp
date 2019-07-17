<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeleteBook.jsp' starting page</title>
    
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
  	<c:if test="${mode=='deleteBookFir'}">
	  	<div>
	  		<a href="${pageContext.request.contextPath}/servlet/BackServle?jspSkip=yes&oparetion=deleteBookByBookid" target="view_frame">根据图书ID删除图书</a>
	  		<a href="${pageContext.request.contextPath}/servlet/BackServle?jspSkip=yes&oparetion=deleteBookByBarcode" target="view_frame">根据条形码删除图书</a>  		
	  	</div>
  	</c:if>
  	
  	<c:if test="${mode=='deleteBook'}">
  		<c:if test="${deletemode=='byBookid'}">
	  		<div>
	  			<form action="${pageContext.request.contextPath}/servlet/BackServlet?method=deleteBookByBookid" method="post">
		  			<p>请输入要删除的图书的ID</p>
		  			<input type="text" name="bookid" id="bookid">
		  			<input type="submit" value="提交">		
	  			</form>
	  		</div>
  		</c:if>
  		
  		
  		<c:if test="${deletemode=='byBarcode'}">
  			<div>
  				<form action="${pageContext.request.contextPath}/servlet/BackServlet?method=deleteBookByBarcode" method="post">
  					<p>请输入要删除的图书条形码</p>
  					<input type="text" name="barcode" id="barcode">
  					<input type="submit" value="提交">
  				</form>
  			</div>
  		</c:if>
  	</c:if>
  	
  	<c:if test="${mode=='deleteBookSucceed'}">
  		<c:if test="${deletemode=='byBookid'}">
  			<p>删除成功</p>
  			<a href="${pageContext.request.contextPath}/servlet/BackServle?jspSkip=yes&oparetion=deleteBookByBookid" target="view_frame">返回</a>
  		</c:if>
  	
  	
  		<c:if test="${deletemode=='byBarcode'}">
  			<p>删除成功</p>
  			<a href="${pageContext.request.contextPath}/servlet/BackServle?jspSkip=yes&oparetion=deleteBookByBarcode" target="view_frame">返回</a>
  		</c:if>
  	</c:if>
  </body>
</html>
