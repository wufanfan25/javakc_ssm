<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib prefix="zhg" uri="www.javakc.com" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="shortcut icon" href="favicon.ico">
<link href="<%=path%>static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="<%=path%>static/css/bootstrapValidator.min.css?v=0.5.3" rel="stylesheet">
<link href="<%=path%>static/css/style.min.css?v=4.0.0" rel="stylesheet">
<link href="<%=path%>static/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<script type="text/javascript">
	var root = '<%=path%>';
</script>
<script type="text/javascript" src="<%=path%>static/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>static/js/bootstrap.min.js?v=3.3.5"></script>
<script type="text/javascript" src="<%=path%>static/js/bootstrapValidator.min.js?v=0.5.3"></script>
<script type="text/javascript" src="<%=path%>static/js/plugins/sweetalert/sweetalert.min.js"></script>
<script type="text/javascript" src="<%=path%>static/js/plugins/layer/layer.js"></script>
<script type="text/javascript" src="<%=path%>static/js/tool.js"></script>

