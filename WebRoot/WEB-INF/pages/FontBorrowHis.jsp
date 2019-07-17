<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统/借阅历史</title>
    <link rel="shortcut icon" href="img/user1.ico" type="image/x-icon">    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
	    body{
	        padding: 0;
	        margin: 0;
	        width: 100%;
	        height:2000px;
	    }
	
	    .header{
	        width: 100%;
	    }
	
	    .header .component-header{
	        border: none;
	        height: 80px;
	        background: #fff;
	    }
	
	    .header .component-header .container{
	        width: 1000px;
	        height: 100%;
	        margin: auto;
	
	    }
	
	    .header .component-header .container .header-items{
	        height: 100%;
	        width: 500px;
	        float: right;
	        text-align: center;
	    }
	
	    .header .component-header .container .header-items .active1,.active3{
	        position: relative;
	        display: inline-block;
	        padding-right: 10px;
	        padding-left: 3px;
	        box-sizing:border-box;
	        font-size: 20px;
	        line-height: 80px;
	        height: 100%;
	        text-decoration: none;
	        padding-left: 50px;
	        float:left;
	    }
	    
	    .header .component-header .container .header-items .active3{
	    	color:#5c3317;
	    	font-weight: 700;
	    	font-size:22px;
	    	margin-left:35px;
	    }
	    
	
	    .header .component-header .container .header-items .active1{
	        background: url("img/search1.ico");
	        background-position: 0;
	        background-repeat: no-repeat;
	        background-size: 32px 32px;
	        border: none;
	        outline: none;
	        margin-left:180px;
	    }
	
	    .header .component-search{
	        height: 80px;
	        width: 100%;
	        background: #4573ab;
	        color: honeydew;
	        font-size: 18px;
	        display:none;
	        
	    }
	
	    .header .component-search .container{
	        width: 1000px;
	        height: 80px;
	        line-height: 80px;
	        margin: auto;
	        position: relative;
	    }
	
	    .header .component-search .container .search-select-item{
	        height:100%;
	        width:100%;
	        line-height: 80px;    
	    }
	
	    .header .component-search .container .search-select-item strong{
	        font-size: 18px;
	        font-weight: 400;
	    }
	
	    .header .component-search .container .search-select-item .search-text{
	        width: 780px;
	        height: 40px;
	        margin-left:10px;
	        box-sizing: border-box;
	        font-size: 16px;
	        border: white;
	        background: whitesmoke;
	        padding-left: 15px;
	        border-radius: 25px 0 0 25px;
	        outline: none;
	    }
	
	    .header .component-search .container .search-select-item .hidden-xs{
	        width:120px;
	        height: 40px;
	        margin-left: -6px;
	        margin: auto;
	        position: absolute;
	        top:50%;
	        right: 0;
	        margin-top: -18px;
	        margin-right: 12px;
	        background: whitesmoke;
	        border-radius: 0 25px 25px 0;
	    }
	
	    .header .component-search .container .search-select-item .hidden-xs .search-submit{
	        width:120px;
	        height: 40px;
	        margin-left: 0px;
	        position: absolute;
	        background: url("img/search2.png");
	        background-position: 5px 5px;
	        background-size: 30px;
	        background-repeat: no-repeat;
	        border: 0px;
	        padding:0px;
	    }

        .history{
            height: 1500px;
            width: 100%;
        }
        .history .history-content{
            height: 100%;
            width: 1000px;
            margin: 0 auto;
        }
        .history .history-content .content-title{
            border-top: 1px ;
            height:40px;
            color: #666;
            text-align: center;
            background-color: #f2f6fa;
            box-sizing: border-box;
            line-height: 40px;
        }

        .history .history-content table{
            width: 1000px;
            margin: 0px;
        }
        .history .history-content table thead,.history .history-content table tbody{
            height:  40px;
            line-height: 40px;
            color: #666;
            font-size: 16px;
            font-weight: 400;
        }

        .history .history-content table thead{
            background-color: #f7fafc;
        }


        .history .history-content table thead tr,.history .history-content table tbody tr{
            height:100%;
        }
        .history .history-content table thead tr th,.history .history-content table tbody tr td{
            text-align: center;
            border-bottom: 1px solid #e0e5e8;
            font-weight:400; 
        }

    </style>
    <script src="js/jquery.min.js"></script>
    <script>
        function selectBook(){
	        var active1=document.getElementById("active1");
	        var search=document.getElementById("search");
	        if(search.style.display=="none"){
	            search.style.display="block";
	            search.style.height ="80px";
	        }
	        else{
	            search.style.display="none";
	            search.style.height="0px";
	        }
	    }
        
        
    </script>
    <script>
        $(function(){
            $(".table-tbody tr:even").css("background","#fff");
            $(".table-tbody tr:odd").css("background","#f2f6fa");
        });
    </script>
  </head>
  
  <body>
    <header class="header">
		<div class="component-header">
			<div class="container">
				<a href="logo"></a>
	   			<div class="header-items">
					<button class="active1" id="active1" onclick="selectBook()">书目检索</button>
                    <div class="active3">${user.userName}</div>
				</div>
			</div>
		</div>
		<form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=selectBookByKeyWord" method="POST" target="_blank">
			<div class="component-search" id="search" style="display:none">
			    <div class="container">
			        <div class="search-select-item">
			            <strong class="book-search">书目检索</strong>
			            <input type="text" placeholder="搜索书名关键字" autofocus="autofocus" class="search-text" name="bookKeyWord">
			            <i></i>
			            <div class="hidden-xs"><input type="submit" value="搜索" class="search-submit"></div>
			        </div>
			    </div>
			</div>
        </form>
    </header>
    <div style="width: 1000px;margin:30px auto 20px;border:1px solid gainsboro;" ></div>
    <div style="font-size: 13px;margin-left:258px; margin-bottom: 30px; color: rgb(102, 102, 102);"><a href="${pageContext.request.contextPath}/servlet/FontEndServlet" style="text-decoration: none;padding-top: 2px;color: rgb(102, 102, 102);display: inline-block; ">首页</a>>图书借阅历史</div>
    <h2 style="font-size: 20px; font-weight: 500;margin: 0 auto 50px;width: 1000px; text-align: center;">—&nbsp;&nbsp;&nbsp;借书历史&nbsp;&nbsp;&nbsp;—</h2>
    <div class="history">
        <div class="history-content">
            <div class="content-title">借书记录</div>
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>书名</th>
                        <th>状态</th>
                        <th>借阅时间</th>
                        <th>应还时间</th>
                        <th>归还时间</th>
                        <th>条形码</th>
                    </tr>
                </thead>
                <tbody class="table-tbody">
                	<c:forEach items="${allBRM1}" var="vbrm">
	                    <tr>
	                        <td>${vbrm.bookName}</td>
	                        <c:if test="${vbrm.ifBorrowed==0}">
	                        	<td>归还</td>
	                        </c:if>
	                        <c:if test="${vbrm.ifBorrowed==1}">
	                        	<td>借出</td>
	                        </c:if>
	                        <td>${vbrm.borrDate}</td>
	                        <td>${vbrm.latestretDate}</td>
	                        <td>${vbrm.returnDate}</td>
	                        <td>${vbrm.barCode}</td>
	                    </tr>
                    </c:forEach>
                </tbody>
                
            </table>
           
        </div>
       
    </div>
  </body>
</html>
