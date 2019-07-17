<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书管理系统/新闻公告</title>
    
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
	
	    .header .component-header .container .header-items .active1,.active2,.active3{
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
	    .news{
	    	width: 100%;
	    	height:2000px;
	    }
	    
	    .news-container{
	    	width: 1000px;
	    	height: 100%;
	    	margin: 0 auto;
	    }
	    .container-title{
			height: 50px;
		    width: 100%;
		    font-size: 13px;
		    box-sizing: border-box;
		    padding-top: 15px;
		    margin: auto;
		}
		
		.container-title a{
			text-decoration: none;
		    color: rgb(102, 102, 102);
		    padding-top: 2px;
		    display: inline-block;
		}	
	  	.news-container p{
		  	height: 60px;
		    line-height: 60px;
		    font-size: 20px;
		    border-bottom: 1px solid #eee;
		    margin: 0px;
	  	}
		
		.newsList{
			width: 100%;
			height: 1000px;
			position: relative;
			
		}
		
		.newsList ul{
			width: 100%;
			height: 100%;
			padding: 0px;
			margin: 0px;
		}
		
		.newsList ul li{
			border-bottom: 1px solid #e0e5e8;
		    line-height: 60px;
		    height: 59px;
			list-style: none;
			position: relative;
		}	
		.newsList ul li a{
			display: inline-block;
		    text-decoration: none;
		    width: 100%;
		    height: 100%;
		}
		.newsList ul li a p{
			display: inline-block;
		    width: 100%;
		    font-size: 16px;
		    color: #666;
		    margin: 0;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    padding:0px;
		}
		
		.newsList ul li a span{
			position: absolute;
		    bottom: 0;
		    right: 0;
		    color: #bfbfbf;
		    margin-right: 25px;
		    font-size:14px;
		}	
	    
	    .news-title{
            position: relative;
            width: 100%;
            height: 50px;
            border-bottom: 1px solid #e0e5e8;
            margin-bottom: 50px;
        }
        .news-title h2{
            padding-right: 80px;
            height: 100%;
            font-size: 24px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-weight: 500;
            border-bottom: 1px solid #e0e5e8;
        }
        .news-title span{
            position: absolute;
            top: 0;
            right: 0;
            margin-top: 5px;
            font-size: 14px;
        }
        .news-content{
            font-size: 16px;
            color: #666;
            line-height: 30px;
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
    <c:if test="${mode=='homepage'}">
    	<div class="news">
	    	<div class="news-container">
	    		<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>>新闻公告
	            </div>
	            <p>新闻公告</p>
	            <div class="newsList">
	            	<ul>
	            		<li>
	            			<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcementContent&num=1">
	            				<p>《习近平新时代中国特色社会主义思想学习纲要》出版发行</p>
	            				<span>2019-06-09</span>
	            			</a>
	            		</li>
	            		
	            		<li>
	            			<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcementContent&num=2">
	            				<p>《20世纪西藏美术史》出版发行</p>
	            				<span>2019-05-21</span>
	            			</a>
	            		</li>
	            		<li>
	            			<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcementContent&num=3">
	            				<p>习近平《论坚持推动构建人类命运共同体》英文版出版发行</p>
	            				<span>2019-04-09</span>
	            			</a>
	            		</li>
	            		<li>
	            			<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcementContent&num=4">
	            				<p>《马克思主义新闻观十二讲》3月1日出版发行</p>
	            				<span>2019-03-01</span>
	            			</a>
	            		</li>
	            		
	            		<li>
	            			<a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcementContent&num=5">
	            				<p>《读懂中国：海外知名学者谈中国新时代》出版发行</p>
	            				<span>2019-01-28</span>
	            			</a>
	            		</li>
	            		
	            	</ul>
	            </div>
	    	</div>
    	</div>
    </c:if>
    <c:if test="${mode=='secondpage'}">
    
    	<c:if test="${newsnum=='1'}">
    	<div class="news">
    		<div class="news-container">
    			<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>><ahref="${pageContext.request.contextPath}/servlet/FontEndServlet">新闻公告</a>>新闻详情
	            </div>
	            <div>
	            	<div class="news-title">
	            		<h2>《习近平新时代中国特色社会主义思想学习纲要》出版发行</h2>
	            		<span>2019-06-09</span>
	            	</div>
	            	<div class="news-content">
	            		新华社北京6月9日电 为把学习贯彻习近平新时代中国特色社会主义思想进一步引向深入，根据中央要求，中央宣传部组织编写了《习近平新时代中国特色社会主义思想学习纲要》（以下简称《纲要》）一书，已由学习出版社、人民出版社联合出版，即日起在全国发行。<br><br>《纲要》共21章、99目、200条，近15万字。全书紧紧围绕习近平新时代中国特色社会主义思想是党和国家必须长期坚持的指导思想这一主题，以“八个明确”和“十四个坚持”为核心内容和主要依据，对习近平新时代中国特色社会主义思想作了全面系统的阐述，有助于广大干部群众更好理解把握这一思想的基本精神、基本内容、基本要求，更加自觉地用以武装头脑、指导实践、推动工作。《纲要》内容丰富、结构严整，忠实原文原著、文风生动朴实，是全党开展“不忘初心、牢记使命”主题教育的重要学习材料，是广大干部群众深入学习领会习近平新时代中国特色社会主义思想的重要辅助读物。
	            	</div>
	            </div>
    		</div>
    	</div>
    	</c:if>
    	
    	<c:if test="${newsnum=='2'}">
    	<div class="news">
    		<div class="news-container">
    			<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>><ahref="${pageContext.request.contextPath}/servlet/FontEndServlet">新闻公告</a>>新闻详情
	            </div>
	            <div>
	            	<div class="news-title">
	            		<h2>《20世纪西藏美术史》出版发行</h2>
	            		<span>2019-05-21</span>
	            	</div>
	            	<div class="news-content">
	            		新华社拉萨5月21日电（记者 李键）总字数达20余万字的《20世纪西藏美术史》，21日在拉萨出版发行。<br><br>西藏美术发展源远流长，题材、体裁丰富多样，表现形式、手法技巧不拘一格，历来被国内外学者高度关注。然而学术界的研究领域主要局限于藏族传统美术，对西藏现代美术的研究存在许多空白和不足，有的只是对一些画家的访谈，或某些艺术家、某一流派的个案论述，没有一部关于西藏现代美术史的系统专著。<br><br>据介绍，《20世纪西藏美术史》作者是西藏大学艺术学院教授、画家次旺扎西，全书共分为六章，内容涉及绘画、雕塑、建筑、工艺等领域，收录了作者在拉萨、日喀则、昌都、山南等地的大量田野调查素材以及许多珍贵的口头、文字和图片资料，其中不少资料是第一次被发现和引用。<br><br>此外，这部美术专著还收集了国内外有关西藏美术史论的研究成果，包括美术家介绍、画册、艺术评论、艺术家个人的文章、展览图录等各种资料，通过不同角度，把西藏美术的民族特质和地域特征刻画出来。
	            	</div>
	            </div>
    		</div>
    	</div>
    	</c:if>
    	
    	<c:if test="${newsnum=='3'}">
    	<div class="news">
    		<div class="news-container">
    			<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>><ahref="${pageContext.request.contextPath}/servlet/FontEndServlet">新闻公告</a>>新闻详情
	            </div>
	            <div>
	            	<div class="news-title">
	            		<h2>习近平《论坚持推动构建人类命运共同体》英文版出版发行</h2>
	            		<span>2019-04-09</span>
	            	</div>
	            	<div class="news-content">
	            	新华社北京4月9日电 中共中央党史和文献研究院翻译的习近平《论坚持推动构建人类命运共同体》一书英文版，近日由中央编译出版社出版发行。<br><br>《论坚持推动构建人类命运共同体》，已于2018年6月由中央文献出版社出版，收入习近平有关重要文稿85篇。为适应国外读者阅读习惯，英文版在中文版基础上增加了注释、索引、缩略语等内容。该书英文版出版发行，有助于国外读者深入了解习近平关于“建设一个什么样的世界、如何建设这个世界”等关乎人类前途命运的重大课题的理论思考，了解构建人类命运共同体理念的时代背景、重大意义、主要内容、实现途径，对深刻理解习近平外交思想的丰富内涵和我国外交方针政策具有重要意义。
	            	</div>
	            </div>
    		</div>
    	</div>
    	</c:if>
    	
    	<c:if test="${newsnum=='4'}">
    	<div class="news">
    		<div class="news-container">
    			<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>><ahref="${pageContext.request.contextPath}/servlet/FontEndServlet">新闻公告</a>>新闻详情
	            </div>
	            <div>
	            	<div class="news-title">
	            		<h2>《马克思主义新闻观十二讲》3月1日出版发行</h2>
	            		<span>2019-03-01</span>
	            	</div>
	            	<div class="news-content">
	            	新华社北京3月1日电 由中宣部、教育部和全国哲学社会科学工作办公室设立的国家社科基金特别委托项目课题“马克思主义新闻观研究”成果《马克思主义新闻观十二讲》3月1日由高等教育出版社出版发行。<br><br>《马克思主义新闻观十二讲》由全国知名新闻院校和科研机构的13名专家学者共同撰写。该书系统梳理了马克思主义新闻观的产生及其中国化的历史进程，对新闻工作基本要求、新闻传播规律、新闻事业根本性质、舆论导向、社会责任等马克思主义新闻观系列重要问题作了专题论述。该书配有二维码，链接了生动、丰富的相关案例和音视频拓展资料。
	            	</div>
	            </div>
    		</div>
    	</div>
    	</c:if>
    	
    	
    	<c:if test="${newsnum=='5'}">
    	<div class="news">
    		<div class="news-container">
    			<div class="container-title">
	                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>><a href="${pageContext.request.contextPath}/servlet/FontEndServlet?jspSkip=yes&oparetion=announcement">新闻公告</a>>新闻详情
	            </div>
	            <div>
	            	<div class="news-title">
	            		<h2>《读懂中国：海外知名学者谈中国新时代》出版发行</h2>
	            		<span>2019-01-28</span>
	            	</div>
	            	<div class="news-content">
	            	新华社北京1月28日电（记者 王绥翊）讲好中国故事、传播好中国声音、阐释好中国道路，《读懂中国：海外知名学者谈中国新时代》日前由天津人民出版社出版发行。<br><br>

　　该书由解读中国工作室编著。为了给世界提供感知中国的别样视角，解读中国工作室在过去五年时间里，采访了80多位美、英、法、俄、韩、日等国家的评论家、学者、政要和资深媒体人，将2012年10月至2018年10月的采访文稿，结集出版。

　　<br><br>该书从新时代中国、中国梦、全面建成小康社会、全面深化改革、全面依法治国、全面从严治党、以新发展理念引领发展、建设文化强国、“一带一路”倡议、全球治理等10个方面，回答了中国为何能够成功、中国如何影响世界、中国共产党为什么能、“一带一路”将给世界带来什么、为什么全球治理变革离不开中国等一系列问题，围绕习近平新时代中国特色社会主义思想，解读中国制度、中国道路、中国方案优势所在，总结中国的和平崛起对于世界经济增长的重大意义，向世界各国分享中国的治理方案。

　　<br><br>英国剑桥大学政治与国际关系学院资深研究员马丁·雅克在书中提出了两个观点：第一，中国是不同的，而且将一直不同，如果想了解中国，就得了解这种不同；第二，中国的崛起会持续下去，中国将改变世界，不仅在经济方面，还包括政治和文化等方面。中国正在沿着正确的方向发展，也许还有很长的路要走，但已经取得了一些进步，正在坚定不移地走下去。

　　<br><br>据介绍，该书既能让读者从多维度解读处在历史变革和伟大复兴进程中的中国，使海内外受众更加全面深入地了解中国，了解中国新时代，拓展读者对发展中国家如何走向现代化的认识，也可为那些既希望加快发展又希望保持自身独立性的国家和民族提供思想启迪。
	            	</div>
	            </div>
    		</div>
    	</div>
    	</c:if>
    </c:if>
  </body>
</html>
