<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>角色添加页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
		<link href="${path }/static/css/plugins/treegrid/jquery.treegrid.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
				<form action="${path }/role/create.do" method="post" enctype="multipart/form-data"
					class="form-horizontal" role="form">
                    <fieldset>
						<legend>角色基本信息</legend>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="rolename">角色名称</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="rolename" name="roleName" type="text" placeholder="填写角色名称"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="roleremark">角色备注</label>
                          	<div class="col-sm-10">
                            	<input class="form-control" id="roleremark" name="roleRemark" type="text" placeholder="填写角色备注"/>
                          	</div>
                       	</div>
                       	<div class="form-group">
                          	<label class="col-sm-2 control-label" for="roleremark">绑定菜单(权限)</label>
                          	<div class="col-sm-10">
                            	<table class="tree table table-striped table-bordered table-hover table-condensed">
									<thead>
							            <tr>
							                <th><input type="checkbox" id="checkall"/></th>
							                <th>菜单名称</th>
							                <th>菜单级别</th>
							            </tr>
							        </thead>
							        <tbody>
										<c:forEach var="m" items="${page }" varStatus="v">
											<tr class="treegrid-${m.menuId } treegrid-parent-${m.menuPid }">
												<td>
													<input type="checkbox" name="ids" value="${m.menuId }"/>
												</td>
												<td>${m.menuName }</td>
												<td>
													<zhg:show value="${m.menuLevel }" codeTp="level"></zhg:show>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
	<script type="text/javascript" src="${path }/static/js/plugins/treegrid/jquery.treegrid.min.js"></script>
	<script type="text/javascript" src="${path }/static/js/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
	<script type="text/javascript" src="${path }/view/system/role/js/role.js"></script>
</html>