<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>菜单添加页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
		<link href="<%=path%>static/css/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
				<form action="${path }/menu/create.do" method="post" class="form-horizontal" role="form">
                    <fieldset>
						<legend>菜单基本信息</legend>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menuname">菜单名称</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menuname" name="menuName" type="text" placeholder="填写菜单名称  测试查询"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menupid">选择父类</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menupidValue" name="menuPid" type="hidden"/>
                            	<input class="form-control" id="menupid" type="text" readonly placeholder="点击选择父类"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menulevel">菜单级别</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menulevel" name="menuLevel" readonly type="text" placeholder="自动填充菜单级别"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menuuri">访问路径</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menuuri" name="menuUri" type="text" placeholder="填写访问路径: test/query.do "/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menupermission">访问权限</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menupermission" name="menuPermission" type="text" placeholder="填写访问权限 test:query"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="menuweight">菜单权重</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="menuweight" name="menuWeight" type="number" placeholder="填写菜单权重"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="roleremark">菜单状态</label>
                          	<div class="col-sm-10">
                          		<div class="switch switch-mini" >
                          			<input type="checkbox" name="menuState" checked value="0"
								    	data-on-text="启用" data-off-text="禁用"
								    	data-on="primary" data-off="danger"/>
								</div>
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
	<script type="text/javascript" src="${path }/static/js/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
	<script type="text/javascript" src="${path }/view/system/menu/js/menu-create.js"></script>
</html>