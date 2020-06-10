<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>销售信息展示</title>
    <style type="text/css">
        tbody>tr:nth-child(even){
            background: palegreen;
        }
    </style>
    <!-- 引入bootstrap分页 -->
    <link rel="stylesheet" href="<%=basePath%>/static/js/bootstrap/bootstrap.css" />
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap.min.js"></script>
    <script src="<%=basePath%>/static/js/bootstrap/bootstrap-paginator.js"></script>
    <script>
        $(function() {
            $('#pagination').bootstrapPaginator({
                bootstrapMajorVersion: 3,
                currentPage: ${requestScope.pageInfo.pageNum },
                totalPages: ${requestScope.pageInfo.pages },
                pageUrl: function(type, page, current) {
                    return 'admin/toSaleList?pageNum=' + page+"&flag=${flag}";
                },
                itemTexts: function(type, page, current) {
                    switch(type) {
                        case "first":
                            return "首页";
                        case "prev":
                            return "上一页";
                        case "next":
                            return "下一页";
                        case "last":
                            return "末页";
                        case "page":
                            return page;
                    }
                }
            });
        });
    </script>
</head>
<body>
<center>
    <p>
        <strong>销售信息查询：</strong>
        <span>排序方式：
            <form action="<%=basePath %>/admin/toSaleList" method="POST">
                <select name="flag">
                    <c:choose>
                        <c:when test="${flag=='1'}">
                            <option value="1" selected>销售日期</option>
                            <option value="2">销售总价</option>
                        </c:when>
                        <c:otherwise>
                            <option value="1">销售日期</option>
                            <option value="2" selected>销售总价</option>
                        </c:otherwise>
                    </c:choose>

                </select>
                <input type="submit" value="提交">
            </form>
        </span>
    </p>
    <table width="800px" border="1px" cellspacing="0px">
        <thead>
            <tr>
                <th>ID</th>
                <th>商品</th>
                <th>单价</th>
                <th>数量</th>
                <th>总价</th>
                <th>销售日期</th>
                <th>销售员</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageInfo.list}" var="map">
                <tr>
                    <td>${map.id}</td>
                    <td>${map.productName}</td>
                    <td>${map.price}</td>
                    <td>${map.quantity}</td>
                    <td>${map.totalPrice}</td>
                    <td>${map.saleDate}</td>
                    <td>${map.realName}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <!-- 把分页搞出来 -->
    <ul id="pagination"></ul>
</center>
</body>
</html>