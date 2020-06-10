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
    <title></title>
</head>
<body>
<center>
    <table>
        <tr>
            <td colspan="2"><strong>添加销售</strong></td>
        </tr>
        <tr>
            <td>商品名称：</td>
            <td>
                <select name="productId">
                    <option value="0">--请选择商品--</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>销售单价：</td>
            <td><input type="text" pattern="[1-9]+(\.\d+)?" name="price" required></td>
        </tr>
        <tr>
            <td>销售数量：</td>
            <td><input type="text" pattern="[1-9]+" name="quantity" required></td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="saveSale" value="保存">
            </td>
        </tr>
    </table>
</center>
</body>
<script type="text/javascript">
   $(function(){
        /*动态获取所有的商品信息*/
        $.ajax({
            url:"<%=basePath %>/admin/getProducts",
            type:"POST",
            dataType:"JSON",
            success:function(rs){
                var content = "";
                for(var i in rs){
                    var pid = rs[i].id;//商品id
                    var productName = rs[i].productName;//商品名称
                    content+="<option value='"+pid+"'>"+productName+"</option>";
                }
                $("select[name=productId]").append(content);
            }
        });

        /*当单击保存时，触发ajax操作*/
        $("#saveSale").click(function(){
            $.ajax({
                url:"<%=basePath %>/admin/updateSale",
                type:"POST",
                dataType:"JSON",
                data:{
                    "pid":$("select[name=productId]>option:selected").val(),
                    "quantity":$("input[name=quantity]").val(),
                    "cost":$("input[name=price]").val()
                },
                success:function(rs){
                    if(rs){
                        alert("添加成功");
                    }else{
                        alert("添加失败");
                    }
                }
            });
        });
    });
</script>
</html>