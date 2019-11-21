<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>菜单展示列表页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
		<link href="<%=path%>static/css/plugins/treegrid/jquery.treegrid.css" rel="stylesheet">
		<link href="<%=path%>static/css/plugins/bootstrap-switch/bootstrap-switch.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form id="searchForm" action="">
					<div class="col-sm-12">
						<!-- ------------按钮组 start------------ -->
		                <div class="alert alert-success" role="alert">菜单详细信息</div>
		                <div class="col-sm-8">
		                	<div class="btn-group hidden-xs" role="group">
		                		<shiro:hasPermission name="menu:create">
				                	<button type="button" class="btn btn-primary" data-toggle="modal" id="create" name="system/menu/create.jsp">
			                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
			                        </button>
		                        </shiro:hasPermission>
		                        <shiro:hasPermission name="menu:update">
			                        <button type="button" class="btn btn-success" data-toggle="modal" id="update" name="menu/view.do">
			                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
			                        </button>
			                    </shiro:hasPermission>
		                        <shiro:hasPermission name="menu:delete">
			                        <button type="button" class="btn btn-danger" data-toggle="modal" id="delete" name="menu/delete.do">
			                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
			                        </button>
		                        </shiro:hasPermission>
			                 </div>
		                </div>
		                <div class="col-sm-4">
		                	<input class="form-control" id="search" name="userName" value="${entity.menuName }" type="text" placeholder="查询内容 回车搜索"/>
		                </div>
						<!-- ------------按钮组 end------------ -->
						<table class="tree table table-striped table-bordered table-hover table-condensed">
							<thead>
					            <tr>
					                <th><input type="checkbox" id="checkall"/></th>
					                <th>菜单名称</th>
					                <th>菜单级别</th>
					                <th>访问路径</th>
					                <th>访问权限</th>
					                <th>菜单状态</th>
					                <th>菜单权重</th>
					            </tr>
					        </thead>
					        <tbody>
								<c:forEach var="m" items="${page }" varStatus="v">
									<tr class="treegrid-${m.menuId } treegrid-parent-${m.menuPid } closed">
										<td><input type="checkbox" name="ids" value="${m.menuId }"/></td>
										<td>${m.menuName }</td>
										<td>
											<zhg:show value="${m.menuLevel }" codeTp="level"></zhg:show>
										</td>
										<td>${m.menuUri }</td>
										<td>${m.menuPermission }</td>
										<td>
											<div class="switch switch-mini" >
											    <input type="checkbox" name="menustate" ${m.menuState==0?"checked":"" } disabled 
											    	data-on-text="启用" data-off-text="禁用"
											    	data-on="primary" data-off="danger"/>
											</div>
										</td>
										<td>${m.menuWeight }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="<%=path%>static/js/plugins/treegrid/jquery.treegrid.min.js"></script>
		<script type="text/javascript" src="<%=path%>static/js/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
		<script type="text/javascript" src="<%=path%>static/js/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
		<script type="text/javascript" src="<%=path%>view/system/menu/js/menu.js"></script>
	</body>
</html>