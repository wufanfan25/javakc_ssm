<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>机构树展示列表页面</title>
    <%@ include file="../../../common/jsp/header.jsp" %>
    <link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/demo.css" type="text/css">
    <link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="gray-bg">

<div class="row" style="margin-top: 30px">
    <div class="col-md-1"></div>
    <div class="col-md-3">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
            <button type="button" class="btn btn-success"  style="margin-left: 200px" id="t_add">新增</button>
            </div>
            <div class="ibox-content">
                <!-- 树型结构展示 -->
                <div class="zTreeDemoBackground ">
                    <ul id="tree" class="ztree"></ul>
                </div>
            </div>
        </div>

    </div>
    <div class="col-md-1"></div>
    <div class="col-md-3 ">

        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <form id="form-inline" class="form-inline" action="">
                    <input type="hidden" id="mtypeId" name="mtypeId" />
                    <input type="hidden" id="mtypePid" name="mtypePid" />

                    <div class="form-group " style="margin-top: 30px">
                        <label for="mtypeCode"><b>分类编号</b></label>
                        <input type="text" class="form-control" id="mtypeCode" name="mtypeCode" disabled>
                    </div>
                    <div class="form-group " style="margin-top: 30px">
                        <label for="mtypeName"><b>分类名称</b></label>
                        <input type="text" class="form-control" id="mtypeName" name="mtypeName">
                    </div>
                    <div class="form-group" style="margin-top: 30px">
                        <label for="mtypeAbbr"><b>分类简写</b></label>
                        <input type="text" class="form-control" id="mtypeAbbr" name="mtypeAbbr">
                    </div>
                    <div style="margin-top: 30px">
                    <button type="button" class="btn btn-success" id="t_update" name="t_update">保存分类</button>
                    <button type="button" class="btn btn-warning" id="t_delete" name="t_delete" style="margin-left: 30px">删除分类</button>
                    </div>
                </form>
            </div>
        </div>

        <script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.core-3.5.js"></script>
        <%--		<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.excheck-3.5.js"></script>--%>
        <%--		<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.exedit-3.5.js"></script>--%>
        <script type="text/javascript" src="${ctx }/static/js//content.min.js?v=1.0.0"></script>
        <script type="text/javascript" src="./js/type.js"></script>
</body>
</html>