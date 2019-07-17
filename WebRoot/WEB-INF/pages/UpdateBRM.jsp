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
    
    <title>My JSP 'AddBRM.jsp' starting page</title>
    
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
  	<c:if test="${mode=='updateBRMFir'}">
	    <p>请输入要修改的借阅记录的ID</p><br>
	    <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateBRMFir" method="POST">
	    	<input type="text" name="id" id="id">
	    </form> 
    </c:if>
    
    <c:if test="${mode=='updateBRM'}">
    	<p>修改借阅记录</p>
    	<form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateBRM" method="POST">
	    	<ul>
	    		<li>用户ID:<input type="text" name="userid" id="userid" value="${br.userid}"></li>
	            <li>图书条形码:<input type="text" name="barcode" id="barcode" value="${br.barcode}"></li>
	           	<li>借阅日期:<input type="date" name="borrdate" id="borrdate" value="${br.borrdate}"></li>
	            <li>借阅时长:<input type="number" name="borrtime" id="borrtime" value="${br.borrtime}">天</li>
	            <li>归还日期:<input type="date" name="returndate" id="returndate" value="${br.returndate}"></li>
	        </ul>
        	<input type="submit" value="确定修改">
  		</form>
    </c:if>
    
    <c:if test="${mode=='updateBRMSucceed'} ">
    	<p>完成修改</p>
    	<a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateBRMFir" target="view_frame">返回</a>
    </c:if>
  </body>
</html>
