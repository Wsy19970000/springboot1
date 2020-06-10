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
	<title>查看库存</title>
    <script src="<%=basePath%>/static/js/bootstrap/jquery.min.js"></script>
</head>
<body>
	<div style="width: 800px;height: 400px;border: solid 3px blue">
        <strong>查看库存：</strong>
        <span>商品名称：
            <select name="pid">
                <option value="0">--请选择商品--</option>
                <c:forEach items="${productList}" var="map">
                    <option value="${map.id}">${map.productName}</option>
                </c:forEach>
            </select>
            <input type="submit" id="find" value="查询">
        </span>
        <span id="content"></span>
    </div>
</body>

<script type="text/javascript">
    $(function(){
        //单击查询按钮时，触发ajax
        $("#find").click(function(){
            var pid = $("select[name=pid]>option:selected").val();
            if(pid=='0'){//没有选中任何商品
                alert("请选择商品!");
            }else{
                $.ajax({
                    url:"<%=basePath %>/admin/getNumByPid",
                    type:"POST",
                    dataType:"JSON",
                    data:{
                        "pid":pid
                    },
                    success:function(rs){
                        $("#content").html("<br><strong>该商品的库存数量是："+rs+"</strong>");
                    }
                });
            }
        });
    });
</script>
</html>
