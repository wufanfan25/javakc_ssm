<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>用户修改密码</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form action="${path }/user/?.do" method="post" class="form-horizontal" role="form">
                    <fieldset>
						<legend>用户密码信息</legend>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="loginname">现有密码</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" type="password" placeholder="填写现有密码"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="loginpass">全新密码</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" type="password" placeholder="填写全新密码"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="retypepass">确认密码</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" type="password" placeholder="请确认密码"/>
                          	</div>
                       	</div>
                    </fieldset>     
                    <fieldset>
                        <div class="form-group">
                        	<label class="col-sm-2 control-label"></label>
                           <div class="col-sm-4">
                              <input type="submit" value="提交" class="btn btn-primary"/>
                           </div>
                           <label class="col-sm-2 control-label"></label>
                           <div class="col-sm-4">
                              <input type="reset" value="重置" class="btn btn-danger"/>
                           </div>
                        </div>
                    </fieldset>
                </form>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${path }/view/system/user/js/user.js"></script>
</html>