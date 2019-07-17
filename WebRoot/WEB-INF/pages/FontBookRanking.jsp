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
    
    <title>图书管理系统/图书排行榜</title>
    <link rel="shortcut icon" href="img/user1.ico" type="image/x-icon">        
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/Ranking.css">

	
	<script src="js/jquery.min.js"></script>
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
	        	return true;
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
	<script>
	    $(document).ready(function(){
	        $('.list-content:eq(0)').click(function(){
	            $(".book-list:gt(0)").css("display","none");
	            $(".book-list:eq(0)").css("display","block");
	        });
	        $('.list-content:eq(1)').click(function(){
	            $(".book-list:gt(1)").css("display","none");
	            $(".book-list:lt(1)").css("display","none");
	            $(".book-list:eq(1)").css("display","block");
	        });
	        $('.list-content:eq(2)').click(function(){
	            $(".book-list:gt(2)").css("display","none");
	            $(".book-list:lt(2)").css("display","none");
	            $(".book-list:eq(2)").css("display","block");
	        });
	        $('.list-content:eq(3)').click(function(){
	            $(".book-list:gt(3)").css("display","none");
	            $(".book-list:lt(3)").css("display","none");
	            $(".book-list:eq(3)").css("display","block");
	        });
	        $('.list-content:eq(4)').click(function(){
	            $(".book-list:gt(4)").css("display","none");
	            $(".book-list:lt(4)").css("display","none");
	            $(".book-list:eq(4)").css("display","block");
	        });
	        $('.list-content:eq(5)').click(function(){
	            $(".book-list:gt(5)").css("display","none");
	            $(".book-list:lt(5)").css("display","none");
	            $(".book-list:eq(5)").css("display","block");
	        });
	        $('.list-content:eq(6)').click(function(){
	            $(".book-list:gt(6)").css("display","none");
	            $(".book-list:lt(6)").css("display","none");
	            $(".book-list:eq(6)").css("display","block");
	        });
	        $('.list-content:eq(7)').click(function(){
	            $(".book-list:gt(7)").css("display","none");
	            $(".book-list:lt(7)").css("display","none");
	            $(".book-list:eq(7)").css("display","block");
	        });
	        $('.list-content:eq(8)').click(function(){
	            $(".book-list:gt(8)").css("display","none");
	            $(".book-list:lt(8)").css("display","none");
	            $(".book-list:eq(8)").css("display","block");
	        });
	        $('.list-content:eq(9)').click(function(){
	            $(".book-list:gt(9)").css("display","none");
	            $(".book-list:lt(9)").css("display","none");
	            $(".book-list:eq(9)").css("display","block");
	        });
	        $('.list-content:eq(10)').click(function(){
	            $(".book-list:gt(10)").css("display","none");
	            $(".book-list:lt(10)").css("display","none");
	            $(".book-list:eq(10)").css("display","block");
	        });
	        $('.list-content:eq(11)').click(function(){
	            $(".book-list:gt(12)").css("display","none");
	            $(".book-list:lt(12)").css("display","none");
	            $(".book-list:eq(12)").css("display","block");
	        });
	        $('.list-content:eq(13)').click(function(){
	            $(".book-list:gt(13)").css("display","none");
	            $(".book-list:lt(13)").css("display","none");
	            $(".book-list:eq(13)").css("display","block");
	        });
	        $('.list-content:eq(14)').click(function(){
	            $(".book-list:gt(14)").css("display","none");
	            $(".book-list:lt(14)").css("display","none");
	            $(".book-list:eq(14)").css("display","block");
	        });
	        $('.list-content:eq(15)').click(function(){
	            $(".book-list:gt(15)").css("display","none");
	            $(".book-list:lt(15)").css("display","none");
	            $(".book-list:eq(15)").css("display","block");
	        });
	        $('.list-content:eq(16)').click(function(){
	            $(".book-list:gt(16)").css("display","none");
	            $(".book-list:lt(16)").css("display","none");
	            $(".book-list:eq(16)").css("display","block");
	        });
	        $('.list-content:eq(17)').click(function(){
	            $(".book-list:gt(17)").css("display","none");
	            $(".book-list:lt(17)").css("display","none");
	            $(".book-list:eq(17)").css("display","block");
	        });
	        $('.list-content:eq(18)').click(function(){
	            $(".book-list:gt(18)").css("display","none");
	            $(".book-list:lt(18)").css("display","none");
	            $(".book-list:eq(18)").css("display","block");
	        })
	        ;$('.list-content:eq(19)').click(function(){
	            $(".book-list:gt(19)").css("display","none");
	            $(".book-list:lt(19)").css("display","none");
	            $(".book-list:eq(19)").css("display","block");
	        });
	        $('.list-content:eq(20)').click(function(){
	            $(".book-list:gt(20)").css("display","none");
	            $(".book-list:lt(20)").css("display","none");
	            $(".book-list:eq(20)").css("display","block");
	        });
	        $('.list-content:eq(21)').click(function(){
	            $(".book-list:gt(21)").css("display","none");
	            $(".book-list:lt(21)").css("display","none");
	            $(".book-list:eq(21)").css("display","block");
	        });
	        $('.list-content:eq(22)').click(function(){
	            $(".book-list:gt(22)").css("display","none");
	            $(".book-list:lt(22)").css("display","none");
	            $(".book-list:eq(22)").css("display","block");
	        });
	        $('.list-content:eq(23)').click(function(){
	            $(".book-list:gt(23)").css("display","none");
	            $(".book-list:lt(23)").css("display","none");
	            $(".book-list:eq(23)").css("display","block");
	        });
	        
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
                            <input type="text" placeholder="搜索关键字" autofocus="autofocus" class="search-text" name="bookKeyWord">
                            <i></i>
                            <div class="hidden-xs"><input type="submit" value="搜索" class="search-submit"></div>
                        </div>
                    </div>
                </div>
            </form>
    </header>
    <div id="hidebg"></div>
    <form action="${pageContext.request.contextPath}/servlet/FontEndServlet?method=userLogin&url=FontBookRanking" method="POST" onsubmit="return verity()">
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

    <div class="component-container">
        <section class="container-library">
            <div class="library-title">
                <a href="${pageContext.request.contextPath}/servlet/FontEndServlet">首页</a>>图书借阅排行榜
            </div>
            <div class="library-row">
                <div class="billboard-wrap">
                    <nav><i></i>筛选>
                    </nav>
                    <div class="type-list">
                        <button class="list-content" id="list-first">总榜</button>
                        <button class="list-content">马列主义、毛泽东思想</button>
                        <button class="list-content">哲学</button>
                        <button class="list-content">社会科学总论</button>
                        <button class="list-content">政治、法律</button>
                        <button class="list-content">军事</button>
                        <button class="list-content">经济</button>
                        <button class="list-content">文化、科学、体育</button>
                        <button class="list-content">语言、文字</button>
                        <button class="list-content">文学</button>
                        <button class="list-content">艺术</button>
                        <button class="list-content">历史、地理</button>
                        <button class="list-content">自然科学总论</button>
                        <button class="list-content">数理科学和化学</button>
                        <button class="list-content">天文学、地球科学</button>
                        <button class="list-content">生物科学</button>
                        <button class="list-content">医药、卫生</button>
                        <button class="list-content">农业科学</button>
                        <button class="list-content">工业技术</button>
                        <button class="list-content">交通运输</button>
                        <button class="list-content">航空、航天</button>
                        <button class="list-content">环境科学</button>
                        <button class="list-content">综合性图书</button>
                        <button class="list-content">外文图书借阅风云榜</button>
                    </div>
                </div>
                <div class="book-list">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content">
                    	<div class="book-content-list">
                            <p>马列主义、毛泽东思想</p>
                            <a href="">
                                <img src="img/list1-1.jpg" alt="">
                                <span>胜因,毛泽东靠什么统一大陆？</span>
                            </a>
                            <a href="">
                                <img src="img/list1-2.jpg" alt="">
                                <span>毛泽东最后十年,专著,1966-1976毛泽东的真实记录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-3.jpg" alt="">
                                <span>毛泽东离京巡视纪实,1949-1976</span>
                            </a>
                    	</div>
                    	<div class="book-content-list">
                            <p>哲学</p>
                            <a href="">
                                <img src="img/list1-4.jpg" alt="">
                                <span>好好说话,专著,新鲜有趣的话术精进技巧</span>
                            </a>
                            <a href="">
                                <img src="img/list1-5.jpg" alt="">
                                <span>知行合一王阳明,专著,1472-1529</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-6.jpg" alt="" >
                                <span>好的孤独,专著</span>
                            </a>
                        </div>
                        <div class="book-content-list">
                            <p>社会科学总论</p>
                            <a href="">
                                <img src="img/list1-7.jpg" alt="">
                                <span>原则,专著,Principles</span>
                            </a>
                            <a href="">
                                <img src="img/list1-8.jpg" alt="">
                                <span>激荡,文化讲坛实录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-9.jpg" alt="" >
                                <span>极简主义,专著,Minimalism</span>
                            </a>
                        </div>
                        <div class="book-content-list">
                            <p>政治、法律</p>
                            <a href="">
                                <img src="img/list1-10.jpg" alt="">
                                <span>邓小平时代</span>
                            </a>
                            <a href="">
                                <img src="img/list1-11.jpg" alt="">
                                <span>朱镕基上海讲话实录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-12.jpg" alt="" >
                                <span>习近平讲故事,专著</span>
                            </a>
                        </div>
                        <div class="book-content-list">
                            <p>军事</p>
                            <a href="">
                                <img src="img/list1-13.jpg" alt="">
                                <span>决战朝鲜,专著,白金珍藏插图版</span>
                            </a>
                            <a href="">
                                <img src="img/list1-14.jpg" alt="">
                                <span>铁血军魂,专著,一八○师在朝鲜</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-15.jpg" alt="" >
                                <span>特殊战秘密档案</span>
                            </a>
                        </div>
                    </div>
                </div>

                <!--马列-->
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type">
                        <div class="book-content-list">
                            <p></p>
                            <a href="">
                                <img src="img/list1-1.jpg" alt="">
                                <span>胜因,毛泽东靠什么统一大陆？</span>
                            </a>
                            <a href="">
                                <img src="img/list1-2.jpg" alt="">
                                <span>毛泽东最后十年,专著,1966-1976毛泽东的真实记录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-3.jpg" alt="">
                                <span>毛泽东离京巡视纪实,1949-1976</span>
                            </a>
                            <a href="">
                                <img src="img/list2-4.jpg" alt="">
                                <span>毛泽东眼中的国民党高级将领,专著</span>
                            </a>
                            <a href="">
                                <img src="img/list2-5.jpg" alt="">
                                <span>邓小平人生纪实</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list2-6.jpg" alt="">
                                <span>毛泽东与林彪</span>
                            </a>
                        </div>
                        
                    </div>
                </div>

                <!--哲学-->                
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type">
                        <div class="book-content-list">
                            <p></p>
                            <a href="">
                                <img src="img/list1-4.jpg" alt="">
                                <span>好好说话,专著,新鲜有趣的话术精进技巧</span>
                            </a>
                            <a href="">
                                <img src="img/list1-5.jpg" alt="">
                                <span>知行合一王阳明,专著,1472-1529</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-6.jpg" alt="" >
                                <span>好的孤独,专著</span>
                            </a>
                            
                            <a href="">
                                <img src="img/list3-4.jpg" alt="">
                                <span>天才在左 疯子在右,专著,完整版</span>
                            </a>
                            <a href="">
                                <img src="img/list3-5.jpg" alt="">
                                <span>好看的皮囊千篇一律，有趣的灵魂万里挑一,专著</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list3-6.jpg" alt="" >
                                <span>蔡康永的情商课,专著,为你自己活一次</span>
                            </a>
                        </div>
                        
                    </div>
                </div>

                <!--社会科学-->
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type" >
                        <div class="book-content-list">
                            <p></p>
                            <a href="">
                                <img src="img/list1-7.jpg" alt="">
                                <span>原则,专著,Principles</span>
                            </a>
                            <a href="">
                                <img src="img/list1-8.jpg" alt="">
                                <span>激荡,文化讲坛实录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-9.jpg" alt="" >
                                <span>极简主义,专著,Minimalism</span>
                            </a>
                            
                            <a href="">
                                <img src="img/list4-4.jpg" alt="">
                                <span>吸引,专著,与人成功交流的科学,Captivate,the science of succeeding with people</span>
                            </a>
                            <a href="">
                                <img src="img/list4-5.jpg" alt="">
                                <span>非暴力沟通,专著,Nonviolent communication</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list4-6.jpg" alt="" >
                                <span>生活需要仪式感,专著</span>
                            </a>
                        </div>
                        
                    </div>
                </div>

                <!--政治-->
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type">
                        <div class="book-content-list">
                            <p></p>
                            <a href="">
                                <img src="img/list1-10.jpg" alt="">
                                <span>邓小平时代</span>
                            </a>
                            <a href="">
                                <img src="img/list1-11.jpg" alt="">
                                <span>朱镕基上海讲话实录</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-12.jpg" alt="" >
                                <span>习近平讲故事,专著</span>
                            </a>
                        </div>
                        
                    </div>
                </div>

                <!--军事-->
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type">
                        <div class="book-content-list">
                            <p><!--军事--></p>
                            <a href="">
                                <img src="img/list1-13.jpg" alt="">
                                <span>决战朝鲜,专著,白金珍藏插图版</span>
                            </a>
                            <a href="">
                                <img src="img/list1-14.jpg" alt="">
                                <span>铁血军魂,专著,一八○师在朝鲜</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-15.jpg" alt="" >
                                <span>特殊战秘密档案</span>
                            </a>
                        </div>
                        
                    </div>
                </div>


                <!--经济-->
                <div class="book-list" style="display: none">
                    <h1>2019年06月 月榜</h1>
                    <div class="book-content book-content-type">
                        <div class="book-content-list">
                            <p></p>
                            <a href="">
                                <img src="img/list1-16.jpg" alt="">
                                <span>激荡十年,水大鱼大,专著,中国企业2008-2018</span>
                            </a>
                            <a href="">
                                <img src="img/list1-17.jpg" alt="">
                                <span>见识,专著</span>
                            </a>
                            <a href="" style="margin-right: 0">
                                <img src="img/list1-18.jpg" alt="">
                                <span>激荡三十年,专著,中国企业1978-2008,十年典藏版</span>
                            </a>
                        </div>
                        
                    </div>
                </div>


                <!--经济-->
            </div>
            
        </section>
    </div>
    
    <div class="row">

    </div>
  </body>
</html>
