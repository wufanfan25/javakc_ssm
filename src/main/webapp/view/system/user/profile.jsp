<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>用户信息页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form  class="form-horizontal" role="form">
                    <fieldset>
						<legend>用户基本信息 </legend>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="username">用户名</label>
                          	<div class="col-sm-10">
                            	${user.userName }
                          	</div>
                       	</div>
                       	<div class="form-group">
                           <label for="disabledSelect" class="col-sm-2 control-label">用户性别</label>
                           <div class="col-sm-10">
                              <zhg:show value="${user.userSex }" codeTp="sex"></zhg:show>
                           </div>
                        </div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="loginname">登陆名称</label>
                          	<div class="col-sm-10">
                            	${user.loginName }
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="email">电子邮件</label>
                          	<div class="col-sm-10">
                            	${user.userEmail }
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="phone">手机号码</label>
                          	<div class="col-sm-10">
                            	${user.userPhone }
                          	</div>
                       	</div>
                    </fieldset>     
                </form>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${path }/view/system/user/js/user.js"></script>
</html>