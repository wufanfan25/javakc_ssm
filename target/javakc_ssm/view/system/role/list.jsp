<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>角色展示列表页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form id="searchForm" action="">
				<div class="col-sm-12">
					<!-- ------------按钮组 start------------ -->
	                <div class="alert alert-success" role="alert">角色详细信息</div>
	                <div class="col-sm-8">
	                	<div class="btn-group hidden-xs" role="group">
	                		<shiro:hasPermission name="role:create">
			                	<button type="button" class="btn btn-primary" data-toggle="modal" id="add" name="role/add.do">
		                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
		                        </button>
	                        </shiro:hasPermission>
	                        <shiro:hasPermission name="role:update">
		                        <button type="button" class="btn btn-success" data-toggle="modal" id="update" name="role/view.do">
		                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
		                        </button>
	                        </shiro:hasPermission>
	                        <shiro:hasPermission name="role:delete">
		                        <button type="button" class="btn btn-danger" data-toggle="modal" id="delete" name="role/delete.do">
		                            <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
		                        </button>
	                        </shiro:hasPermission>
		                 </div>
	                </div>
	                <div class="col-sm-4">
	                	<input class="form-control" id="search" name="userName" value="${entity.roleName }" type="text" placeholder="查询内容 回车搜索"/>
	                </div>
					<!-- ------------按钮组 end------------ -->
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		                <table class="table table-striped table-bordered table-hover table-condensed">
					        <thead>
					            <tr>
					                <th><input type="checkbox" id="checkall"/></th>
					                <th>序号</th>
					                <th>角色名称</th>
					                <th>角色备注</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:forEach var="e" items="${page.list }" varStatus="v">
						            <tr>
						                <td><input type="checkbox" name="ids" value="${e.roleId }"/></td>
						                <td>${v.count+(page.pageNo-1)*page.pageSize }</td>
						                <td>${e.roleName }</td>
						                <td>${e.roleRemark }</td>
						            </tr>
					            </c:forEach>
					        </tbody>
					    </table>
					    <div class="page">${page}</div>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>