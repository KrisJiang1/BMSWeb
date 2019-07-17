<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理界面/主界面</title>
    <link rel="shortcut icon" href="img/user1.ico" type="image/x-icon">        
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<style>
	    body{
	        padding: 0;
	        margin: 0;
	        width: 100%;
	        height:2000px;
	        background: #f0f3f6;
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
	
	    .header .component-header .container .header-items .active1,.active2,.active3,.function{
	        position: relative;
	       	float:left;
	        padding-right: 10px;
	        padding-left: 3px;
	        box-sizing:border-box;
	        font-size: 20px;
	        line-height: 80px;
	        height: 100%;
	        text-decoration: none;
	        padding-left: 50px;
	    }
	    .header .component-header .container .header-items .active3{
	    	color:#5c3317;
	    	font-weight: 700;
	    	font-size:22px;
	    }
	    
	
	    .header .component-header .container .header-items .active1{
	        background: url("img/search1.ico");
	        background-position: 0;
	        background-repeat: no-repeat;
	        background-size: 32px 32px;
	        border: none;
	        outline: none;
	    }
	
	    .header .component-header .container .header-items .active2{
	        background: url("img/user1.ico");
	        background-position: 0;
	        background-repeat: no-repeat;
	        background-size: 35px 35px;
	        margin-left: 35px;
	        border: none;
	        outline: none;
	        cursor: pointer;
	    }
	    
	    .header .component-header .container .header-items .function{
	    	background: url("img/functionlist.gif");
	        background-position: 0;
	        background-repeat: no-repeat;
	        background-size: 60px 60px;
	        border: none;
	        outline: none;
	        cursor: pointer;
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
	
	    .allfunction .function-about{
	        height: 40px;
	        padding-left: 300px;
	        font-size: 15px;
	        padding-top: 20px;
	        background-color:#99cccc;
	    }
	        
	    .allfunction .component-function{
	        height: 120px;
	        width: 100%;
	        background: #99cccc;
	    }
	
	    .allfunction .component-function .container{
	        width: 1000px;
	        height: 100%;
	        padding: 0;
	        margin: auto;
	        text-align: center;
	    }
	
	    .allfunction .component-function .container a{
	        float: left;
	        display: block;
	        height: 100%;
	        width: 115px;
	        text-decoration: none;
	        text-align: center;
	        margin-right: 50px;
	        margin-left: 8px;
	        box-sizing: border-box;
	        padding-top: 17px;
	        font-size: 15px;
	        font-weight: 400;
	        color:dimgray;
	    }
	
	    .allfunction .component-function .container a span{
	        height: 56px;
	        width: 58px;
	        display: inline-block;  
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
	    
	    
	    .weekly-recommended{
	        width: 1519.2px;
	        height: 1062.2px;
	        background-color: #f0f3f6;
	    }
	
	    .weekly-recommended .container{
	        width: 970px;
	        height: 100%;
	        margin: 0 266px;
	        padding:0 15px;
	    }
	
	    .component-title{
	        width: 1000px;
	        height: 80px;
	        padding-top: 10px;
	        
	    }
	    .component-title .column-title{
	        width: 100%;
	        height: 100%;
	        margin: 15px 0;
	        text-align: center;
	        font-weight: 400;
	    }
	
	    .book-container{
	        width: 1000px;
	        height: 960px;
	        border-bottom: 1px solid gainsboro;
	    }
	
	    .recommened-book{
	        width: 470px;
	        height: 240px;
	        padding: 0 15px;
	        float: left;
	    }
	
	    .recommened-book a{
	        height: 100%;
	        width: 100%;
	    }
	
	    .component-book-info{
	        height: 200px;
	        width: 470px;
	        margin-bottom: 40px;
	        box-sizing: border-box;
	    }
	
	    .book-cover{
	        height: 100%;
	        width: 161px;
	        display: inline-block;
	        float: left;
	    }
	    .book-cover img{
	        height: 100%;
	        width: 161px;
	    }
	
	    .book-about{
	        width: 279px;
	        height: 100%;
	        box-sizing: border-box;
	        float: left;
	        margin-left: 30px;
	    }
	
	    .book-about .book-name{
	        width: 100%;
	        height: 25.6px;
	        margin-bottom: 18px;
	        overflow: hidden; 
	        text-overflow: ellipsis;
	        white-space: nowrap;
	        position: relative;
	        top: -3px;
	        margin-top: 0;
	        font-size: 18px;
	        font-weight: 400;
	    }
	
	    .book-about .book-author-publish{
	        width: 100%;
	        height: 48.4px;
	        margin-top: -6px;
	    }
	
	    .book-about .book-author-publish p{
	        width: 100%;
	        height: 20px;
	        margin: 0px;
	        font-size: 13px;
	        color: #999;
	    }
	
	    .book-about .book-intro{
	        width: 100%;
	        height: 102px;
	        overflow: hidden;
	        display: -webkit-box;
	        -webkit-box-orient: vertical;
	        -webkit-line-clamp:5;
	        margin-top: 15px;
	        padding: 0px;
	        font-size:15px;
	        color: #999;
	        text-indent: 15px;
	    }
	    .shutter-img img { 
	        border: 0; 
	        vertical-align: top; 
	    }
	    ul, li { 
	        list-style: none; 
	    }
	
	    .shutter {
	        overflow: hidden;
	        width: 1000px;
	        height: 358px;
	        position: relative;
	        margin: 50px auto;
	        margin-left: 295px;
	        display: inline-block;
	    }
	    .shutter-img {
	        z-index: 1;
	    }
	    .shutter-img,.shutter-img a {
	        position: absolute;
	        left: 0;
	        top: 0;
	        width: 100%;
	        height: 100%;
	    }
	    .shutter-img a {
	        cursor: default;
	    }
	    .shutter-img a > img {
	        width: 100%;
	        height: 100%;
	    }
	    .shutter-img .created {
	        overflow: hidden;
	        position: absolute;
	        z-index: 20;
	    }
	    .shutter-btn li {
	        position: absolute;
	        z-index: 2;
	        top: 50%;
	        width: 49px;
	        height: 49px;
	        margin-top: -25px;
	        cursor: pointer;
	    }
	    .shutter-btn li.prev {
	        left: 20px;
	        background: url(img/shutter_prevBtn.png) no-repeat 0 -49px;
	    }
	    .shutter-btn li.next {
	        right: 20px;
	        background: url(img/shutter_nextBtn.png) no-repeat 0 -49px;
	    }
	    .shutter-desc {
	        position: absolute;
	        z-index: 2;
	        left: 0;
	        bottom: 0;
	        width: 100%;
	        height: 36px;
	        background: url(img/shutter_shadow.png) repeat;
	    }
	    .shutter-desc p {
	        padding-left: 20px;
	        line-height: 20px;
	        color: #fff;
	        font-size: 14px;
	    }
	</style>
	<script type="text/javascript">
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
	
	    window.onload=function(){
	        createCode(4);    
	    }
	
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
	
	    function loginappear(){
	    	var hidebg = document.getElementById("hidebg");
	        hidebg.style.display="block";
	        hidebg.style.height="2000px";  //设置隐藏层的高度为当前页面高度
	        document.getElementById("component-login").style.display="block";  //显示弹出层
	    }
	
	    function logindisappear(){
	    	document.getElementById("hidebg").style.display="none";
	    	document.getElementById("component-login").style.display="none";
	    }  
	    
	     function functiondis(){
	        var allfunction=document.getElementById("allfunction");
	        var middle = document.getElementById("middle");
	        var recommended = document.getElementById("weekly-recommended");
	        if(allfunction.style.display=="none"){
	            allfunction.style.display="block";
	            middle.style.display="none";
	            recommended.style.display="none";
	            allfunction.style.height ="180px";
	        }
	        else{
	       		middle.style.display="block";
	            recommended.style.display="block";
	            allfunction.style.display="none";
	            allfunction.style.height="0px";
	        }
	    }
	</script>
    <script src="js/jquery.min.js"></script>
    <script src="js/shutter.js"></script>
    <script src="js/velocity.js"></script>
    <script>
            $(function () {

              $('.shutter').shutter({
                shutterW: 666, // 容器宽度
                shutterH: 415, // 容器高度
                isAutoPlay: true, // 是否自动播放
                playInterval: 3000, // 自动播放时间
                curDisplay: 3, // 当前显示页
                fullPage: false // 是否全屏展示
              });
            });
            
            function ifLogin(){
            	if(${sessionScope.user==null}){
            		loginappear();
            		return false;
            	}else{
            		return true;
            		
            		
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
    </script>   
  </head>
  
  <body>
	<header class="header">
		<div class="component-header">
			<div class="container">
				<a href="logo"></a>
	   			<div class="header-items">
					<button class="active1" id="active1" onclick="selectBook()">书目检索</button>
					<c:if test="${sessionScope.user==null}">
                        <button class="active2" onclick="loginappear()">我的图书馆</button>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <div class="active3">${user.userName}</div>
                    </c:if>
                    <span style="height:80px; width:1px;background:gainsboro;display:inline-block;float:left;margin:0 20px;"></span>
                    <button class="function" style="height: 80px;width:100px" onclick="functiondis()"></button>
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
		<div class="middle" id="middle">
	        <div class="shutter">
	            <div class="shutter-img">
	                <a href="#" data-shutter-title="世界读书日"><img src="img/幻灯片a.jpg" alt="#"></a>
	                <a href="#" data-shutter-title="开放数据应用开发"><img src="img/幻灯片b.jpg" alt="#"></a>
	                <a href="#" data-shutter-title="竞争情报上海论坛"><img src="img/幻灯片c.jpg" alt="#"></a>
	                <a href="#" data-shutter-title="《诗书画》"><img src="img/幻灯片d.jpg" alt="#"></a>
	            </div>
	            <ul class="shutter-btn">
	                <li class="prev"></li>
	                <li class="next"></li>
	            </ul>
	            <div class="shutter-desc">
	                <p>《诗书画》</p>
	            </div>
	            
	        </div>
	       
		</div>
	</header>
	<div id="hidebg"></div>
	<div class="allfunction" id="allfunction"style="display: none">
		<div class="function-about">>全部功能</div>
		<div class="component-function">
			<div class="container">
	            <a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=myBook" class="active" onclick="return ifLogin()">
	                <span class="my-bookrack">
	                    <img src="img/my.ico" alt="" width="52px" height="52px">
	                </span>
	                <p>我的书架</p>
	            </a> 
				
				<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=bookranking" class="active">
				    <span class="book-ranking">       
				        <img src="img/ranking.ico" alt="" width="52px" height="52px">
				    </span>
				    <p>借阅图书排行榜</p>
				</a>
	               
				<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=booktype" class="active" >
				    <span class="book-type">
				        <img src="img/type.ico" alt="" width="52px" height="52px">        
				    </span>
				    <p>图书分类浏览</p>
				</a>
				
                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet?method=selectAllBorMess" class="active" onclick="return ifLogin()">
                    <span class="borrow-bookhistory">
                        <img src="img/history.ico" alt="" width="52px" height="52px">
                    </span>
                    <p>借书历史</p>
                </a>
				<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?method=selectBorNoRetMess" class="active" onclick="return ifLogin()">
				    <span class="borrowed-book">
				        <img src="img/borrowed.ico" alt="" width="52px" height="52px">
				    </span>
				    <p>图书归还</p>
				</a>
	               
				
				
				<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcement" class="active" style="margin-right: 0px;">
				    <span class="activity-center">
				        <img src="img/activity.ico" alt="" width="54px" height="54px">
				    </span>
				    <p>新闻公告</p>
				</a>
			</div>
		</div>                        
	</div>
   	<div id="hidebg"></div>
       <form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=userLogin&url=FontMainInterface" method="POST" onsubmit="return verity()">
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
       <div class="weekly-recommended" id="weekly-recommended">
           <div class="container">
               <div class="component-title">
                   <h2 class="column-title">—— 每周推荐 ——</h2>
               </div>
               <div class="book-container">
               		<c:forEach items="${weeklyRecommended}" var="vbook">
	                   <div class="recommened-book">
	                       <a href="${pageContext.request.contextPath}/servlet/FontEndServlet?method=selectBook&bookname=${vbook.bookName}" target="_blank">
	                           <div class="component-book-info">
	                               <span class="book-cover">
	                                   <img src="img/${vbook.bookName}.jpg" alt="">
	                               </span>
	                               <div class="book-about">
	                                   <h3 class="book-name">${vbook.bookName}</h3>
	                                   <div class="book-author-publish">
	                                       <p>
	                                           <i class="icon-user-avatar"> </i>
	                                          	 ${vbook.bookAuthor}
	                                       </p>
	                                       <p>
	                                           <i class="icon-chubanshe"></i>
	                                           	${vbook.bookPub}
	                                       </p>
	                                   </div>
	                                   <p class="book-intro">${vbook.bookSynopsi}</p>
	                               </div>
	                           </div>
	                       </a>
	                   </div>
               		</c:forEach>
               	</div>
        	</div>       	
		</div>
  </body>
</html>
