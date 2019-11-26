<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>测试模块列表页面</title>
		<%@ include file="../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form id="searchForm" action="">

					<!-- ------------按钮组 start------------ -->
                    <div style="margin-bottom: 30px">
                        <p> <b>价格组名称：</b> <input type="text" style="width: 300px" id="search" name="groupName" value="${priceEntity.groupName}" placeholder="查询内容 回车搜索">    </p>
                    </div>
                    <div class="col-sm-12">
	                	<div class="btn-group hidden-xs col-sm-2 col-md-offset-4"  role="group" style="margin-bottom: 20px">
                			<button type="button" class="btn btn-success" data-toggle="modal" id="search2">查询
	                        </button>
                        </div>
                        <div class="col-sm-2">
	                        <button type="button" class="btn btn-success"  id="create" name="pricegroup/create.jsp" >新增
	                        </button>
		                 </div>


	                 <!-- ------------按钮组 end-------------->
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		                 <table class="table table-striped table-bordered table-hover table-condensed">
					        <thead>
					            <tr>
					                <th>价格组编码</th>
					                <th>价格组名称</th>
					                <th>包含组织数</th>
									<th>创建人</th>
									<th>操作</th>
					            </tr>
					        </thead>
					        <tbody>
					        	<c:set var="vs"></c:set>
					        	<c:forEach var="e" items="${page.list}" varStatus="v">
						            <tr>
										<td>${e.groupCode }</td>
						                <td>${e.groupName }</td>
										<td>${e.groupName }</td>
										<td>${e.groupCreater }</td>
										<td><a href="" name="ids" value="${e.priceGroupId}">编辑</a></td>
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