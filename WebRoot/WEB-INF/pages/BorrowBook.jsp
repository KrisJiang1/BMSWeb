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
    
    <title>My JSP 'BorrowBook.jsp' starting page</title>
    
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
  	<c:if test="${mode=='borrowBookFir'}">
    <form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=borrowedBook" method="post">
    	<input type="hidden" name="userid" id="userid" value="${sessionScope.userid}">
    	请输入图书条形码:<input type="text" name="barcode" id="barcode">
    	请选择归还天数:<select name="borrtime" id="borrtime">
    				  	<option>5</option>
    				  	<option>7</option>
    				  	<option>9</option>
    				  </select> 
    	<input type="submit" value="确定">
    </form>
    </c:if>
    
    <c:if test="${mode=='borrowBookSucceed'}">
	<div>
    	<p>亲爱的${username}请于${latestreturndate}之前将此书归还</p>
	</div>
	</c:if>
  </body>
</html>
