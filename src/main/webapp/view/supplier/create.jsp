<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>测试模块添加页面</title>
		<%@ include file="../../common/jsp/header.jsp"%>
		<link href="${path }/static/css/plugins/file-input/fileinput.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
				<form action="${path }/supplier/save.do" method="post" class="form-horizontal" role="form">
                    <fieldset>
                        <legend>供应商新增</legend>
                       <div class="form-group">
                      <label class="col-sm-2 control-label" for="ds_host">供应商类型</label>
                      <div class="col-sm-4">
                        <select name="supplierType" id="supplierType">
                          <option value="0">内部供应商</option>
                          <option value="1">外部供应商</option>
                        </select>
<%--                        <zhg:select codeTp="class" name="supplierType" cls="form-control" def="true"></zhg:select>--%>
                      </div>
                    </div>

                       <div class="form-group">
                          <label class="col-sm-2 control-label" for="ds_username">供应商名称</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text"  name="supplierName"/>
                          </div>
                         <label class="col-sm-2 control-label" for="ds_host">供应商分类</label>
                         <div class="col-sm-4">
                           <select name="supplierClass" id="supplierClass">
                             <option value="0"></option>
                             <option value="1">一类</option>
                             <option value="2">二类</option>
                             <option value="3">三类</option>
                           </select>
                         </div>
                       </div>
                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_username">供应商简称：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="supplierAbbr"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">法人：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="legalPerson"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">法人电话：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="legalperPhone"/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_username">供应商地址：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="supplierAddress"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">社会统一信任代码：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="socialCode"/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_username">联系人：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="supplierLinkman"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">联系电话：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="linkmanPhone"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">联系人邮箱：</label>
                        <div class="col-sm-2">
                          <input class="form-control" type="text"  name="linkmanEmail"/>
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="col-sm-2 control-label" for="ds_username">启用门户：</label>
                        <div class="col-sm-1">
                          <input type="checkbox"  name="enablePortal"/>
                        </div>
                        <label class="col-sm-2 control-label" for="ds_username">必须合同：</label>
                        <div class="col-sm-1">
                          <input type="checkbox"  name="necessaryContract"/>
                        </div>
                      </div>

                    </fieldset>
                    <fieldset>
                        <div class="form-group">
                        	<label class="col-sm-2 control-label" for="ds_host"></label>
                           	<div class="col-sm-4">
                              	<input type="submit" value="提交" class="btn btn-primary"/>
                           	</div>
                           	<label class="col-sm-2 control-label" for="ds_host"></label>
                           	<div class="col-sm-4">
                              	<input type="reset" value="重置" class="btn btn-danger" id="resetForm"/>
                           	</div>
                        </div>

                    </fieldset>
                </form>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="${path }/static/js/plugins/file-input/fileinput.min.js"></script>
	<script type="text/javascript" src="./js/dictionary.js"></script>
</html>
