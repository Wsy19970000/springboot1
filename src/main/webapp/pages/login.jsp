<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2020/6/7
  Time: 21:48
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

    <title></title>
    <style type="text/css">
        #box1{
            width: 600px;
            height:250px;
            background: #94EE94;
            padding-top: 100px;
        }
    </style>
</head>
<body>
<center>
    <div id="box1">
        <form action="javascript:void(0)" method="post">
            <table>
                <tr>
                    <td colspan="2" align="center">小型进销存系统</td>
                </tr>
                <tr>
                    <td>用户名</td>
                    <td><input type="text" name="username"></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input type="password" name="psw"></td>
                </tr>
                <tr>
                    <td><input type="reset" value="重置"></td>
                    <td><input type="submit" value="登陆"  id="btn1"></td>
                </tr>
            </table>
        </form>
    </div>
</center>
</body>
</html>
<script type="text/javascript">
    $(function(){
        $("#btn1").click(function(){
            //单击触发ajax
            $.ajax({
                url:"<%=basePath %>/admin/login",
                type:"POST",
                dataType:"JSON",
                data:{
                    "userName":$("input[name=username]").val(),
                    "password":$("input[name=psw]").val()
                },
                success:function(rs){
                    if(rs){//登录成功
                        window.location.href="<%=basePath %>/pages/index.jsp";
                    }else{//登陆失败
                        window.alert("登陆失败!用户名或者密码错误!");
                    }
                }
            });
        });
    });
</script>