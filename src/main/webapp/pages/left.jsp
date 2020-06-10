<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/7
  Time: 22:09
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
    <title>new jsp</title>
</head>
<body>
<p><a href="<%=basePath %>/pages/addSale.jsp" target="main">销售</a></p>
<p><a href="<%=basePath %>/admin/toSaleList" target="main">销售信息查询</a></p>
<p><a href="<%=basePath %>/admin/toShowNum" target="main">查看库存</a></p>

</body>
</html>