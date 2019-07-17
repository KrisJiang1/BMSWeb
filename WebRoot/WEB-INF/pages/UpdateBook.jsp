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
    
    <title>My JSP 'UpdateBook.jsp' starting page</title>
    
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
	  <c:if test="${mode='updateBookFir'}">
	  	<div>
	        <p>修改图书信息</p>
	        <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateBookFir" method="POST">
	            <ul>
	                <li>查询的修改图书的ID<input type="text" name="bookid" id="bookid"></li>
	            </ul>
	            <input type="submit" value="确定">
	        </form>
    	</div>  
	  </c:if>
	

	 <c:if test="${mode='updateBook'}">
		<div>
	        <p>修改图书信息</p>
	        <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=updateBook" method="POST">
	            <ul>
	                <li>名称:<input type="text" name="bookname" id="bookname" value="${book.bookName}"></li>
	                <li>类型:
	                        <select name="booktype" id="booktype" value="${book.bookType}">
	                            <option value="哲学类">哲学类</option>
			                    <option value="社会科学类">社会科学类</option>
			                    <option value="政治类">政治类</option>
			                    <option value="法律类">法律类</option>
			                    <option value="军事类">军事类</option>
			                    <option value="经济类">经济类</option>
			                    <option value="文化类">文化类</option>
			                    <option value="教育类">教育类</option>
			                    <option value="体育类">体育类</option>
			                    <option value="语言文字类">语言文字类</option>
			                    <option value="艺术类">艺术类</option>
			                    <option value="历史类">历史类</option>
			                    <option value="地理类">地理类</option>
			                    <option value="天文学类">天文学类</option>
			                    <option value="生物学类">生物学类</option>
			                    <option value="医学卫生类">医学卫生类</option>
			                    <option value="农业类">农业类</option>
	                        </select></li>
	                <li>作者:<input type="text" name="bookauthor" id="bookauthor" value="${book.bookAuthor}"></li>
	                <li>页码:<input type="number" name="bookpagenum" id="bookPageNum" value="${book.bookPageNum}"></li>
	                <li>译者:<input type="text" name="booktranslator" id="bookTranslator" value="${book.bookTranslator}"></li>
	                <li>入馆日期:<input type="date" name="booklibtime" id="bookLibtime" value="${book.bookLibtime}"></li>
	                <li>价格:<input type="text" name="bookprice" id="bookprice" value="${book.bookPrice}"></li>
	                <li>出版社:<input type="text" name="bookpub" id="bookpub" value="${book.bookPub}"></li>
	            </ul>
	           <input type="submit" value="确定修改">
	        </form>
    	</div>
    </c:if>
    
    <c:if test="${mode='updateBookSucceed'}">
    	修改成功
    	<a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=updateBook" target="view_frame">返回</a>
    </c:if>
  </body>
</html>
