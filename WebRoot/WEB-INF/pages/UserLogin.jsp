<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UserLogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

  </head>
  
  <body>
    <div class="main">
		<div class="login-form">
			<h1>Member Login</h1>
				<div class="head">
					<img src="img/user.png" alt="">
				</div>
				<form>
					<input type="text" class="text" value="USERNAME" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;USERNAME&#39;;}">
					<input type="password" value="Password" onfocus="this.value = &#39;&#39;;" onblur="if (this.value == &#39;&#39;) {this.value = &#39;Password&#39;;}">
					<div class="submit">
						<input type="submit" onclick="myFunction()" value="LOGIN">
					</div>	
					<p><a href="http://demo.sc.chinaz.com//Files/DownLoad/moban/201409/chahua3484/?#">Forgot Password ?</a></p>
				</form>
		</div>
	</div>
		 		
<div style="display:none"><script src="./stat(1).php" language="JavaScript" charset="gb2312"></script><script src="./core(1).php" charset="utf-8" type="text/javascript"></script><a href="https://www.cnzz.com/stat/website.php?web_id=155540" target="_blank" title="站长统计">站长统计</a></div>
  </body>
</html>
