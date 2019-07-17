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
    
    <title>My JSP 'AddBook.jsp' starting page</title>
    
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
  	<c:if test="${mode=='addBook'}">
	<div>
        <p>添加图书</p>
        <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=addBook" method="POST">
            <ul>
            	<li>名称:<input type="text" name="bookname" id="bookname"></li>
                <li>类型:
                	<select name="booktype" id="booktype">
	                	<option value="艺术">艺术</option>
	                    <option value="交通运输">交通运输</option>
	                    <option value="语言文学">语言文学</option>
	                    <option value="文化科学">文化科学</option>
	                    <option value="文学">文学</option>
	                    <option value="医药卫生">医药卫生</option>
	                    <option value="经济">经济</option>
	                    <option value="自然科学">自然科学</option>
	                    <option value="数理科学">数理科学</option>
	                    <option value="工业技术">工业技术</option>
	                    <option value="社会科学">社会科学</option>
	                    <option value="政治法律">政治法律</option>
	                    <option value="综合性图书">综合性图书</option>
	                    <option value="军事">军事</option>
	                    <option value="生物学类">生物学类</option>
	                    <option value="航空航天">航空航天</option>
	                    <option value="历史地理">历史地理</option>
                      </select></li>
                <li>作者:<input type="text" name="bookauthor" id="bookauthor"></li>
                <li>页码:<input type="number" name="bookpagenum" id="bookPageNum"></li>
                <li>译者:<input type="text" name="booktranslator" id="bookTranslator"></li>
                <li>入馆日期:<input type="date" name="booklibtime" id="bookLibtime"></li>
                <li>价格:<input type="text" name="bookprice" id="bookprice"></li>
                <li>出版社:<input type="text" name="bookpub" id="bookpub"></li>
                <li>简介:<textarea rows="" cols="" name="booksynopsi" style="width:200px;height:200px"></textarea> </li>
            </ul>
            <input type="submit" value="提交">
        </form>
    </div>
  	</c:if>
  	
  	<c:if test="${mode=='addBookSucceed'}">
	  	添加成功<br>
	    <a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=addBook" target="view_frame">返回</a>
  	</c:if>
  	
  </body>
</html>
