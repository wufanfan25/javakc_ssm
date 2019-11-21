<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>缓存管理</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<form id="searchForm" action="">
					<div class="col-sm-12">
						<!-- ------------按钮组 start------------ -->
		                <div class="alert alert-success" role="alert">缓存详细信息</div>
		                <div class="col-sm-8">
		                	<div class="btn-group hidden-xs" role="group">
			                	<button type="button" class="btn btn-primary" data-toggle="modal" id="dictionary">
		                            <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>刷新字典
		                        </button>
		                        <button type="button" class="btn btn-success" data-toggle="modal" id="menu">
		                            <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>刷新菜单
		                        </button>
			                 </div>
		                </div>
						<!-- ------------按钮组 end------------ -->
						<!-- 数据显示区域  start-->
						<div id="showmessage" class="col-sm-12">
							
						</div>
						<!-- 数据显示区域  end-->
					</div>
				</form>
			</div>
		</div>
		<script type="text/javascript" src="${path }/view/system/cache/js/cache.js"></script>
	</body>
</html>