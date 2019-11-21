<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <base target="_blank">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JAVAKC - 登录</title>
    <link rel="shortcut icon" href="<%=path %>/favicon.ico"> 
    <link href="<%=path %>/static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=path %>/static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/static/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/static/css/style.min.css?v=4.0.0" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">java</h1>
            </div>
            <h3>欢迎使用</h3>
            <form class="m-t" action="<%=path %>/login.do" method="post" target="_self">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" name="pass" class="form-control" placeholder="密码">
                </div>
<!--                 <div class="form-group"> -->
<!--                     <input type="text" name="code" class="form-control" placeholder="验证码"> -->
<!--                 </div> -->
                <button type="submit" class="btn btn-primary block full-width m-b">登 录</button>
                <p class="text-muted text-center"> 
                	<a href="login.jsp" target="_self"><small>忘记密码了？</small></a> | <a href="login.jsp">注册一个新账号</a>
                </p>
            </form>
        </div>
    </div>
    <script src="<%=path %>/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path %>/static/js/bootstrap.min.js?v=3.3.5"></script>
</body>
</html>