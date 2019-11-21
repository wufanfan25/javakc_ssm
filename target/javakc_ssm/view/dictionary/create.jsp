<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>数据字典添加页面</title>
		<%@ include file="../../common/jsp/header.jsp"%>
		<link href="${path }/static/css/plugins/file-input/fileinput.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
				<form action="${path }/dictionary/create.do" method="post" class="form-horizontal" role="form">
                    <fieldset>
                        <legend>数据字典基本信息</legend>
                       <div class="form-group">
                          <label class="col-sm-2 control-label" for="ds_host">数据名称</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text" name="dataName" placeholder="性别"/>
                          </div>
                          <label class="col-sm-2 control-label" for="ds_name">数据类型</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text" name="dataType" placeholder="sex"/>
                          </div>
                       </div>
                       <div class="form-group">
                          <label class="col-sm-2 control-label" for="ds_username">数据备注</label>
                          <div class="col-sm-8">
                             <input class="form-control" type="text"  name="dataCommon" placeholder="1：男  2：女"/>
                          </div>
                       </div>
                    </fieldset>     
                    <fieldset>
						<legend>编码信息</legend>
                        <div class="form-group">
                           <label for="disabledSelect" class="col-sm-2 control-label">数据编码</label>
                           <div class="col-sm-4">
                              <input type="text" name="code" class="form-control"/>
                           </div>
                           <div class="col-sm-4">
                              <input type="text" name="val" class="form-control"/>
                           </div>
                           <div class="col-sm-2">
                              <input type="button" id="createLine" value="添加" class="btn btn-primary"/>
                           </div>
                        </div>
                        <div class="form-group" id="addLine"></div>
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