<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>机构树展示列表页面</title>
		<%@ include file="../../../common/jsp/header.jsp"%>
		<link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/demo.css" type="text/css">
		<link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
		<style type="text/css">
			div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
			div#rMenu ul li{
				margin: 1px 0;
				padding: 0 5px;
				cursor: pointer;
				list-style: none outside none;
				background-color: #DFDFDF;
			}
		</style>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="ibox float-e-margins">
				<!-- 树型结构展示 -->
				<div class="zTreeDemoBackground left">
					<ul id="tree" class="ztree"></ul>
				</div>
				<!-- 右键菜单 -->
				<div id="rMenu">
					<ul>
						<li id="m_add" >增加节点</li>
						<li id="m_update" >修改节点</li>
						<li id="m_del" >删除节点</li>
					</ul>
				</div>
				<!-- 弹出窗口 -->
				<div id="modal-form" class="modal fade" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-body">
				                <div class="row">
				                    <div class="col-sm-12 b-r">
				                        <h3 class="m-t-none m-b">机构树</h3>
				                        <form role="form">
				                        	<input type="hidden" id="orgtreeId">
				                            <div class="form-group">
				                                <label>机构名称：</label>
				                                <input type="text" class="form-control" id="orgtreeName">
				                            </div>
				                            <div>
				                                <button class="btn btn-sm btn-primary pull-right m-t-n-xs"  id="orgtreeClick">
				                                    <strong>提交</strong>
				                                </button>
				                            </div>
				                        </form>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.exedit-3.5.js"></script>
		<script type="text/javascript" src="${ctx }/static/js//content.min.js?v=1.0.0"></script>
		<script type="text/javascript" src="./js/tree.js"></script>
	</body>
</html>