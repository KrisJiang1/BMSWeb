<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SeleteBook.jsp' starting page</title>
    
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
  	<c:if test="${mode=='selectBookFir'}">
	  	<div>
		  	<p>查询图书信息</p>
		    <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=selectBookById" method="POST">
		    	<ul>
		          <li>查询的图书的ID<input type="text" name="bookid" id="bookid"></li>
		        </ul>
		    	<input type="submit" value="确定">
		     </form>
		</div>
	</c:if> 
	
	<c:if test="${mode=='selectBook'}">
	<div>
		<p>查询图书信息</p>
		<ul>
			<li>名称:${book.bookName}</li>
			<li>类型:${book.bookType}</li>
			<li>作者:${book.bookAuthor}</li>
			<li>页码:${book.bookPageNum}</li>
			<li>译者:${book.bookTranslator}</li>
			<li>入馆日期:${book.bookLibtime}</li>
			<li>价格:${book.bookPrice}</li>
			<li>出版社:${book.bookPub}</li>
			<li><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBook" target="view_frame">返回</a></li>
	    </ul>
	</div>  
	</c:if>  
  </body>
</html>
