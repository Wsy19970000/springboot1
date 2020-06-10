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
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
</head>
<body>
<span>欢迎,${sessionScope.realName==null?'XXX':sessionScope.realName}</span>
<a href="javascript:void(0)" id="loginOut">退出</a>
</body>
<script type="text/javascript">
    $("#loginOut").click(function () {
        var flag = confirm("您确定要推出吗?")
        if(flag){
            window.top.location.href="<%=basePath %>admin/logout.do";
        }
    })
</script>
</html>