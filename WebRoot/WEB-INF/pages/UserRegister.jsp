<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 	<title>注册页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="css/Userregister.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
  </head>
  
  <body>
     <div class="wrapper">
        <article>
            <div class="main">
                <form>
                    <div class="tel">
                        <input type="tel" name="userName" placeholder="手机号"><em>由11个字符组成！</em>
                    </div>
                    <div class="userName">
                        <input type="text" name="userName" placeholder="用户名"><em>由5-8个字符组成！</em>
                    </div>
                    <div class="password">
                        <input type="password" name="pwd" placeholder="密码"><em>使用字母、数字、符号两种及以上的组合，8-12个字符</em>
                    </div>
                    <div class="againpwd">
                        <input type="password" name="pwd" placeholder="再次输入密码"><em>两次密码不一致</em>
                    </div>
                    <button>注册</button>
                </form>
            </div>
        </article>
        <footer>
            <ul>
                <li><a href="#">联系我们</a></li>
                <li><a href="#">关于我们</a></li>
                <li><a href="#">人才招聘</a></li>
                <li><a href="#">友情链接</a></li>
                <li><a href="#">公司地址</a></li>
                <li><a href="#">关注我们</a></li>
            </ul>
        </footer>
    </div>
  </body>
</html>
