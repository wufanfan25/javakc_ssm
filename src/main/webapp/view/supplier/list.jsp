<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>供应商列表页面</title>
  <%@ include file="../../common/jsp/header.jsp"%>
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="ibox float-e-margins">
    <form id="searchForm" action="">
      <div class="col-sm-12">
        <!-- ------------按钮组 start------------ -->
        <div class="alert alert-success" role="alert">测试模块详细信息</div>
        <div class="col-sm-8">
          <div class="btn-group hidden-xs" role="group">
            <button type="button" class="btn btn-primary" data-toggle="modal" id="create" name="supplier/create.jsp">
              <i class="glyphicon glyphicon-plus" aria-hidden="true"></i>添加
            </button>
            <button type="button" class="btn btn-success" data-toggle="modal" id="update" name="supplier/view.do">
              <i class="glyphicon glyphicon-pencil" aria-hidden="true"></i>修改
            </button>
            <button type="button" class="btn btn-danger" data-toggle="modal" id="delete" name="supplier/delete.do">
              <i class="glyphicon glyphicon-trash" aria-hidden="true"></i>删除
            </button>
          </div>
        </div>
        <div class="col-sm-4">
          <input class="form-control" id="search" name="testName" value="${testEntity.testName}" type="text" placeholder="查询内容 回车搜索"/>
        </div>
        <!-- ------------按钮组 end------------ -->
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <table class="table table-striped table-bordered table-hover table-condensed">
          <thead>
          <tr>
            <th><input type="checkbox" id="checkall"/></th>
            <th>供应商编码</th>
            <th>供应商名称</th>
            <th>供应商类型</th>
            <th>联系人</th>
            <th>联系电话</th>
            <th>必须合同</th>
            <th>是否启用门户</th>
            <th>操作</th>
            <th>账号管理</th>
          </tr>
          </thead>
          <tbody>
          <c:set var="vs"></c:set>
          <c:forEach var="e" items="${page.list}" varStatus="v">
            <tr>
              <td><input type="checkbox" name="ids" value="${e.supplierId }"/></td>

              <td>${e.supplierCode }</td>
              <td>${e.supplierName }</td>
              <td>${e.supplierClass }</td>
              <td>${e.supplierLinkman }</td>
              <td>${e.linkmanPhone }</td>
              <td>${e.necessaryContract==1?"是":"否"}</td>
              <td>${e.enablePortal==1?"是":"否"}</td>
              <td><button>账户管理</button></td>
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
