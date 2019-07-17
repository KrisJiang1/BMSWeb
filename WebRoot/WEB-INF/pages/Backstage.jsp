<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<frameset rows="100px,*">
    <frame src="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=backTop" frameborder="0">
    <frameset cols="300px,*">
        <frame src="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=backLeft" frameborder="0">
        <frame src="${pageContext.request.contextPath}/servlet/BackServlet?jspSkip=yes&oparetion=addBook" name="view_frame" frameborder="0">
    </frameset>
</frameset>