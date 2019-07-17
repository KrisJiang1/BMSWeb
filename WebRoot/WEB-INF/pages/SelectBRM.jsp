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
  
  	<c:if test="${mode=='selectBRMFir'}">
  		<div>
	        <p>查询借阅信息</p>
	        <ul>
		        <li><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBRMByUserid" target="view_frame">查询单个用户的所有借阅信息</a></li>
		        <li><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBRMByUseridBarcode" target="view_frame">查询单个用户此本书的借阅信息</a></li>
		        <li><a href="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=selectBRMByBarcode" target="view_frame">查询此本书的借阅信息</a></li>
		        <li><a href="${pageContext.request.contextPath}/servlet/BackServlet?method=selectAllBRM" target="view_frame">查询所有借阅信息</a></li>
	    	</ul>
    	</div>
  	</c:if>
  	
    
    <c:if test="${mode=='selectBRM'}">
	    <div>
	    	<c:if test="${selectmode=='ByUserid'}">
		    	<p>查询单个用户的所有借阅信息</p>
			    <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=selectBRMByUserid" method="POST">
			    	<ul>
			          <li>用户ID:<input type="text" name="userid" id="userid" placehoder="用户ID"></li>
			        </ul>
			    	<input type="submit" value="确定">
			    </form>
			</c:if>
	        <c:if test="${selectmode=='ByUseridBarcode'}">
		    	<p>查询单个用户此本书的借阅信息</p>
			    <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=selectBRMByUseridBarcode" method="POST">
			    	<ul>
			          <li>用户ID:<input type="text" name="userid" id="userid" placehoder="用户ID"></li>
			          <li>图书条形码:<input type="text" name="barcode" id="barcode" placehoder="图书条形码"></li>
			        </ul>
			    	<input type="submit" value="确定">
			    </form>
			</c:if>
			<c:if test="${selectmode=='ByBarcode'}">
		    	<p>查询单本书的借阅信息</p>
			    <form action="${pageContext.request.contextPath}/servlet/BackServlet?method=selectBRMByBarcode" method="POST">
			    	<ul>
			          <li>图书条形码:<input type="text" name="barcode" id="barcode" placehoder="图书条形码"></li>
			        </ul>
			    	<input type="submit" value="确定">
			    </form>
			</c:if>
			<c:if test="${selectmode=='AllMess'}">
		    	<p>所有借阅信息</p>
		    	<table width="500px" border="1px" cellspacing="0" cellpadding="0">
		  		<tr>
		  			<td>ID</td>
		  			<td>用户ID</td>
		  			<td>图书条形码</td>
		  			<td>借阅日期</td>
		  			<td>借阅时长</td>
		  			<td>归还时间</td>
		  		</tr>
		    	<c:forEach items="${allBRM}" var="vbrm" varStatus="vs">
		    	<tr>
		    		<td>${vbrm.id}</td>
		  			<td>${vuser.userId}</td>
		  			<td>${vuser.barCode}</td>
		  			<td>${vuser.borrDate}</td>
		  			<td>${vuser.borrTime}</td>
		  			<td>${vuser.returnDate}</td>
		  		</tr>
		    	</c:forEach>
			</c:if>
	    </div>
    </c:if>
    
    <c:if test="${mode=='selectBRMSucceed'}">
    	<c:if test="${selectmode == 'ByUserid'}">
    		<table width="500px" border="1px" cellspacing="0" cellpadding="0">
		  		<tr>
		  			<td>ID</td>
		  			<td>用户ID</td>
		  			<td>图书条形码</td>
		  			<td>借阅日期</td>
		  			<td>借阅时长</td>
		  			<td>归还时间</td>
		  		</tr>
		  		<c:forEach items="${byUseridAl}" var="vbrm" varStatus="vs">
		    	<tr>
		    		<td>${vbrm.id}</td>
		  			<td>${vuser.userId}</td>
		  			<td>${vuser.barCode}</td>
		  			<td>${vuser.borrDate}</td>
		  			<td>${vuser.borrTime}</td>
		  			<td>${vuser.returnDate}</td>
		  		</tr>
		    	</c:forEach>
		    </table>
    	</c:if>
    	
    	<c:if test="${selectmode=='ByUseridBarcode'}">
    		<ul>
    			<li>ID:${br.id}</li>
    			<li>用户ID:${br.userId} </li>
    			<li>图书条形码:${br.barCode}</li>
    			<li>借阅日期:${br.borrDate}</li>
    			<li>借阅时长:${br.borrTime}</li>
    			<li>归还时间:${br.returnDate}</li>
    		</ul>
    	</c:if>
    	
    	<c:if test="${selectmode=='ByBarcode'}">
    		<ul>
    			<li>ID:${br.id}</li>
    			<li>用户ID:${br.userId} </li>
    			<li>图书条形码:${br.barCode}</li>
    			<li>借阅日期:${br.borrDate}</li>
    			<li>借阅时长:${br.borrTime}</li>
    			<li>归还时间:${br.returnDate}</li>
    		</ul>
    	</c:if>
    </c:if>
    
  </body>
</html>
