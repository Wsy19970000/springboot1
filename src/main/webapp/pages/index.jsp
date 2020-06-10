<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/7
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="<%=basePath %>static/js/jquery-1.8.2.min.js"></script>
    <title>欢迎使用小型进销存系统</title>
</head>
<frameset rows="10%,*">
    <frame src="<%=basePath %>/pages/top.jsp"></frame>
    <frameset cols="10%,*">
        <frame src="<%=basePath %>/pages/left.jsp"></frame>
        <frame name="main"></frame>
    </frameset>
</frameset>

</html>