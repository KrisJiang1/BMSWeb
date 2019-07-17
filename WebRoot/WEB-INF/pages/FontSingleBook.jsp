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
    
    <title>图书管理系统/图书详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style>
        body{
            padding: 0;
            margin: 0;
        }
        .header{
            width: 100%;
           
        }
        .component-header{
            height: 90px;
            width: 1000px;
            margin: auto;
           	border-bottom: 1px solid gainsboro;

        }

        .container{
            width: 600px;
            height: 100%;
            float: right;
        }

        .container-login{
            width: 100px;
            height: 100%;
            display: block;
            float: left;
            margin-right:14px;
            font-size: 18px;
        }
        .container-other{
            float: left;
            height: 100%;
        }
        .login,.search,.book-type,.my-bookrack{
            position: relative;
            height: 40px;
            line-height: 40px;
            margin-top: 20px;
            display: inline-block;
            text-decoration: none;
        }
        .login{
            background: url("img/user2.ico");
            background-repeat: no-repeat;
            background-size: 35px;
            background-position: 0;
            width: 100%; 
            padding-left: 47px;
            border: none;
            font-size: 20px;
            outline: none;
            cursor: pointer;
        }
        .active3{
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
   	    	color:#5c3317;
	    	font-weight: 700;
	    	font-size:22px;
	    }
        
        .search{
            background: url("img/search2.png");
            background-repeat: no-repeat;
            background-size: 32px;
            border: none;
            font-size: 20px;
            padding-left:40px;
            width: 100px;
            background-position-y: 3px;
            margin-right: 5px;
            outline: none;
            cursor: pointer;
        }

        .my-bookrack{
            font-size: 20px;
            text-decoration: none;
            background: url("img/my.ico");
            background-size:35px;
            background-repeat: no-repeat;
            padding-left: 50px;
        }

        .book-type{
            font-size: 20px;
            background: url("img/type1.ico");
            background-repeat: no-repeat;
            background-size: 35px;
            padding-left: 45px;
        }
        .my-bookrack,.book-type{
            width: 120px;
        }

        .container i{  
            display: block;
            float: left;
            width: 1px;
            height: 40px;
            margin-top:20px;
            background: gray;
            margin-right:28px; 
        }
        .header .component-search{
            height: 80px;
            width: 100%;
            background: #4573ab;
            color: honeydew;
            font-size: 18px;

        }

        .header .component-search .search-container{
            width: 1000px;
            height: 80px;
            line-height: 80px;
            margin: auto;
            position: relative;
        }

        .header .component-search .search-container .search-select-item{
            height:100%;
            width:100%;
            line-height: 80px;    
        }

        .header .component-search .search-container .search-select-item strong{
            font-size: 18px;
            font-weight: 400;
        }

        .header .component-search .search-container .search-select-item .search-text{
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

        .header .component-search .search-container .search-select-item .hidden-xs{
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

        .header .component-search .search-container .search-select-item .hidden-xs .search-submit{
            width:120px;
            height: 40px;
            margin-left: 0px;
            position: absolute;
            background: url("img/search27g");
            background-position: 5px 5px;
            background-size: 30px;
            background-repeat: no-repeat;
            border: 0px;
            padding:0px;
            outline: none;
        }
        
        .model-container{
            width: 452px;
            height: 500px;
            margin: auto;
            background:white;
            position:fixed;
            z-index: 1000;
            left: 533.6px;
            top:150px;
        }
        .component-login .model-container h2{
            display: inline-block;
            width: 100%;
            margin: 0px;
            font-size: 24px;
            font-weight: 400;
            text-align: center;
            padding-top:28px;
        }
        
        .code{
            font-family:Arial;
            font-style:italic;
            color:#D8B7E3;
            font-size:28px;
            border:0;
            letter-spacing:3px;
            font-weight:bolder;                
            cursor:pointer;
            width:110px;
            height:45px;
            line-height:45px;
            margin-top: 2px;
            text-align:center;
            vertical-align:middle;
            background-color:lightslategray;
            float: left;
            margin-left: 16px;
        }
        

        .user-login-list{
            list-style: none;
            padding:0px;
            margin-top: 40px;
            margin-bottom: 34px;
            margin-left: 36px;
            margin-right: 36px;
        }
        
        .clearfix{
            width: 380px;
            height: 49px; 
            box-sizing: border-box;  
        }
        
        .username,.userpwd{
            width: 100%;
            height: 45px;
            padding: 0;
            border: 1px solid #e0e5e8;
            border-radius:5px;
            padding-left: 35px;
            box-sizing: border-box;
            color: #999;
        }
        
        .username:hover{
            border:1px solid #D8B7E3;
        }
        
        .userpwd:hover{
            border:1px solid #D8B7E3;
        }

        .usercode{
            width: 250px;
            height: 45px;
            padding: 0;
            border: 1px solid #e0e5e8;
            border-radius:5px;
            padding-left: 35px;
            box-sizing: border-box;
            color: #999;
        }
        .usercode:hover{
            border:1px solid #D8B7E3;
        }

        .clearfix span{
            font-size: 12px;

        }
        .login-action{
            margin-left:35px;
            font-size: 13px;
            box-sizing: border-box;
            line-height: 23px;
            padding-left: 3px;
        }

        .login-action span{
            display: inline-block;
            height: 21px;
            line-height: 21px;
            vertical-align: middle;
        }
        #checkbox1{
            display: block;
            width: 19px;
            height: 21px;
            cursor:pointer;
            border-color: lightslategray;
            margin: 0px;
            float: left;
        }

        .checkbox1-label{
            display: block;
            height: 100;
            width:70px;
            float: left;
            padding-left: 10px;
        }

        .login-action a{
            text-decoration: none;
            color:#333;
            float: right;
            font-size: 12px;
            margin-right: 36px;
        }

        .login-button{
            width: 380px;
            height: 49px;
        }

        .login-button input{
            width: 100%;
            height: 100%;
            margin-left: 36px;
            margin-top: 25px;
            font-size: 20px;
            background:royalblue;
            border: none;
            border-radius: 5px;
        }

        .model-container i{
            display: inline-block; 
            width: 18Px;
            height:2px; 
            background:#333;
            line-height: 0;
            font-size:0;
            vertical-align: middle;
            transform: rotate(45deg);
            margin-left: 405px;
            margin-top: 40px;
            cursor: pointer;
        }
        .model-container i:after{
            content:'/';
            display:block;
            width: 18px;
            height:2px;
            background: #333;
            transform: rotate(-90deg);
        }
        #hidebg { 
            position:absolute;left:0px;top:0px;
            background-color:#000;
            width:100%;  /*宽度设置为100%，这样才能使隐藏背景层覆盖原页面*/
            filter:alpha(opacity=60);  /*设置透明度为60%*/
            opacity:0.6;  /*非IE浏览器下设置透明度为60%*/
            display:none; /* http://www.jb51.net */
            z-Index:2;
        }
        
        .book-details{
        	width:100%;
        	height: 650px;
        }
        
        .book-details .details-container{
        	height: 100%;
        	width: 1000px;
        	margin: 0 auto;
        }
        
        .book-details .details-container .container-title{
        	font-size:12px;
        }
        
        .book-details .details-container .container-infor{
        	height: 210px;
        	width: 100%;
        }
        
        .book-details .details-container .container-infor img,.information{
        	float:left;
        
        }
        .information{
        	margin-left:60px;
        }
        
        .bookname{
        	font-size:18px;
        	margin-top:8px;
        	font-style: normal;
        }
        .bookauthor,.bookpagenum,.bookprice,.bookpub{
        	margin: 0px;
        	color:#959ca5;
        	font-size:14px;
        	margin-bottom: 8px;
        }
        .book-synosi p{
        	margin:40px 0;
        	text-align: center;
        	font-size:18px;
        	color:#333;
        	font-weight: 500;
        }
        
        .synosi-content{
        	font-size:14px;
        	color:#666;
        	line-height: 29px;
        }
        .action-btn{
        	float: right;
        	margin: 180px 50px 0 0;
        }
        .action-btn button{
        	margin-left:20px;
        	width: 100px;
		    height: 30px;
		    margin-left: 20px;
		    line-height: 26px;
		    font-size: 14px;
		    color: #fff;
    		background-color: #5f9ce3;
    		border: none;
    		outline: none;
        }
        
        .chooseDay{
        	height: 350px;
        	width:350px;
        	margin:auto;
        	display:none;
        	z-index: 1000;
        	background:#f0f3f6;
            position:fixed;
            top:100;
            left:584.6;
        }
        
        .chooseDay img{
        	margin-left: 300px;
        	margin-top: 20px;
        }
        
        .chooseDay p{
			font-size: 18px;
		    color: #ccc;
		    margin-top: 30px;
		    text-align: center;
        } 
		
		.chooseDay select {
			height: 30px;
		    width: 180;
		    font-size: 16px;
		    margin: 20px 85px;
		    border-radius: 5px;
		}
		.chooseDay input {
			margin-left:125px;
			margin-top:30px;
        	width: 100px;
		    height: 30px;
		    line-height: 26px;
		    font-size: 14px;
		    color: #fff;
    		background-color: #5f9ce3;
    		border: none;
    		outline: none;
    		cursor: pointer;
    	}	
    	.borrowSucc{
    		width:1000px;
    		height: 500px;
    		margin: 0 auto;
    	}
    	
    	.borrowSucc-title{
		    font-size: 18px;
		    margin-left: 100px;
		    margin-top: 50px;
    	}
    
    	.notice{
    		width: 250px;
		    font-size: 13px;
		    margin-left: 100px;
		    margin-top: 30px;
    	}
    </style>
	<script>
        function selectBook(){
            var search = document.getElementById("search");
            var header = document.getElementById("header");
            if(search.style.display=="none"){
                search.style.height = "80px";
                search.style.display="block";     
            }else{
                search.style.display="none";
                search.style.height = "0px";
            }
        }
        window.onload=function(){
            createCode(4);    
        }

        //生成验证码的方法
        function createCode(length) {
            var code = "";
            var codeLength = parseInt(length); //验证码的长度
            var checkCode = document.getElementById("checkCode");
            ////所有候选组成验证码的字符，当然也可以用中文的
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
            //循环组成验证码的字符串
            for (var i = 0; i < codeLength; i++)
            {
                //获取随机验证码下标
                var charNum = Math.floor(Math.random() * 62);
                //组合成指定字符验证码
                code += codeChars[charNum];
            }
            if (checkCode)
            {
                //为验证码区域添加样式名
                checkCode.className = "code";
                //将生成验证码赋值到显示区
                checkCode.innerHTML = code;
            }
        }
        
	    function validateCode(){
	        //获取显示区生成的验证码
	        var checkCode = document.getElementById("checkCode").innerHTML;
	        //获取输入的验证码
	        var inputCode = document.getElementById("inputCode").value;
	        console.log(checkCode);
	        console.log(inputCode);
	        if (inputCode.length <= 0){
	            alert("请输入验证码！");
	        }else if (inputCode.toUpperCase() != checkCode.toUpperCase()){
	            alert("验证码输入有误！");
	            createCode(4);
	        }else{
	            alert("验证码正确！");
	        }       
	    }    
	    
    
	    function verity(){
	    	var username = $(".username").val();
	    	var userpwd = $(".userpwd").val();
	    	var checkCode = $("#checkCode").html();
	    	var inputCode = $("#inputCode").val();
	    	console.log(checkCode);
	        console.log(inputCode);
	    	if(username == '' || username ==null || userpwd == '' || userpwd == null){
	    		alert('输入用户名或密码');
	    		return false;
	    	}else if(inputCode.length <= 0){
	    		alert("请输入验证码！");
	    		return false;
	    	}else if (inputCode.toUpperCase() != checkCode.toUpperCase()){
	            alert("验证码输入有误！");
	            return false;
	        }
		}

        function loginappear(){
            var hidebg = document.getElementById("hidebg");
            hidebg.style.display="block";
            hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
            document.getElementById("component-login").style.display="block";  //显示弹出层
        }

        function logindisappear(){
            document.getElementById("hidebg").style.display="none";
            document.getElementById("component-login").style.display="none";
            
        }   
        
        function borrowBookAppear(){
        	var hidebg = document.getElementById("hidebg");
            hidebg.style.display="block";
            hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
            document.getElementById("chooseDay").style.display="block";  //显示弹出层
        }
        
        function borrowBookDisappear(){
            document.getElementById("hidebg").style.display="none";
            document.getElementById("chooseDay").style.display="none";
            
        }   
    </script>
  </head>
  <body>
  	<div id="hidebg"></div>
    <header class="header">
        <div class="component-header">
            <div class="container">
                <div class="container-login">
                    <c:if test="${sessionScope.user==null}">
                        <button id="login" class="login" onclick="loginappear()">登录</button>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                       <div class="active3">${user.userName}</div>
                    </c:if>
                </div>
                <i></i>
                <div class="container-other">
                    <button class="search" onclick="selectBook()">搜索</button>    
                    <a href="" class="my-bookrack">我的书架</a>
                    <a href="" class="book-type">分类浏览</a>
                </div>
            </div>        
        </div>
        <form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=selectBookByKeyWord" method="POST" target="_blank">
            <div class="component-search" id="search" style="display: none">
                <div class="search-container">
                    <div class="search-select-item">
                        <strong class="book-search">书目检索</strong>
                        <input type="text" placeholder="搜索关键字" autofocus="autofocus" class="search-text" name="bookKeyWord">
                        <i></i>
                        <div class="hidden-xs"><input type="submit" value="搜索" class="search-submit"></div>
                    </div>
                </div>
            </div>
        </form>
        <form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=singleBookuserLogin" method="POST" onsubmit="return verity()">
        <input type="hidden" name="bookname" value="${book.bookName}">
        <div class="component-login" style="display: none" id="component-login">
            <div class="model-container">
                <i onclick="logindisappear()"></i>
                <h2>用户登录</h2>
                <ul class="user-login-list">
                    <li class="clearfix"><input type="text" placeholder="请输入用户名"  class="username" name="username"></li>
                    <li class="clearfix" style="margin-top: 20px"><input type="password" placeholder="请输入密码" class="userpwd" name="userpwd"></li>
                    <li class="clearfix" style="margin-top: 20px"><input type="text" placeholder="请输入验证码" class="usercode" name="usercode" id="inputCode" style="float: left;">
                        <div id="checkCode" class="code"  onclick="createCode(4)" ></div>
                    </li>
                </ul>
                <div class="login-action">
                    <span><input type="checkbox" name="remember" class="checkbox1" id="checkbox1"> <label for="checkbox1" class="checkbox1-label">记住我一周</label></span>
                    <a href="">找回密码</a>
                </div>
                <div class="login-button"><input type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录"></div>
            </div>
        </div>
    </form>
    </header>
    <c:if test="${mode=='singBook'}">
    	<div class="book-details">
	  		<div class="details-container">
	  			<p class="container-title"><a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>>图书详情</p>
	  			<div class="container-infor">
	  				<img src="img/${book.bookName}.jpg" height="200px" width="138px">
	  				<div class="information">
	  					<p class="bookname">${book.bookName}</p>
	  					<div style="margin-top:70px"> 
	  						<p class="bookauthor">${book.bookAuthor}</p>
	  						<p class="bookpagenum">${book.bookPageNum}页</p>
	  						<p class="bookprice">${book.bookPrice}元</p>
	  						<p class="bookpub">${book.bookPub}</p>
	  					</div>
	  				</div>
	  				<div class="action-btn">
						<button onclick="javascript:window.locatio.href:'${pageContext.request.contextPath}/servlet/FontEndServlet?'">加入书架</button>
						<button onclick="borrowBookAppear()">立即借阅</button>
	  				</div>
	  			</div>
	  			<p style="height:1px;width:1000px;background:gainsboro"></p>
	 			<div class="book-synosi">
	  				<p class="synosi-title">—&nbsp;&nbsp;&nbsp;简介&nbsp;&nbsp;&nbsp;—</p>
	  				<div class="synosi-content">
	  					${book.bookSynopsi}
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	  	<div class="chooseDay" id="chooseDay">
	  		<c:if test="${result=='true'}">
		  		<form action="${pageContext.request.contextPath}/servlet/FontEndServlet" method="post">
		  			<input type="hidden" name="method" value="borrowBook">
		  			<input type="hidden" name="userid" value="${user.userId}">
		  			<input type="hidden" name="bookid" value="${book.bookId}">
			  		<img src="img/close1.gif" height="30px" width="30px" onclick="borrowBookDisappear()">
			  		<p>请选择你要借阅的天数</p>
			  		<select name="borrtime">
			  			<option value="5">5天</option>
			  			<option value="10">10天</option>
			  			<option value="15">15天</option>
			  			<option value="20">20天</option>
			  			<option value="25">25天</option>
			  			<option value="30">30天</option>
			  		</select>
			  		<input type="submit" value="确定">
			  	</form>
		  	</c:if>
		  	<c:if test="${result=='false'}">
	  			<p style="margin-top:150px; text-align: center;font-size: 16px; color:black">很抱歉 库存中此书已全部借出 请选择别的图书</p>
	  			<button onclick="borrowBookDisappear()" style="width: 100px;height: 35px;margin-left:125px;margin-top: 30px; border-radius:5px;cursor: pointer; border: none;">确定</button>
		  	</c:if>
	  	</div>
	  	
    </c:if>
  	<c:if test="${mode=='borrowSucceed'}">
  		<form method="post" action="${pageContext.request.contextPath}/servlet/FontEndServlet">
  			<input type="hidden" name="jspSkip" value="yes">
  			<input type="hidden" name="oparetion" value="borrowSucceed">
  			<input type="hidden" name="bookname" value="${book.bookName}">
	  		<div class="borrowSucc">
	  			<p class="borrowSucc-title">借阅成功</p>
	  			<p class="notice">注意:请在指定日期前归还图书,如不能按时归会影响用户的信誉分，会影响用户下次借书</p>
	  			<input type="submit"  value="返回" style="float:left;margin-left:305px; border:none ;cursor:pointer; outline:none;text-decoration: underline; background: ghostwhite;font-size:16px">
	  		</div>
  		</form>
  	</c:if>
  </body>
</html>
