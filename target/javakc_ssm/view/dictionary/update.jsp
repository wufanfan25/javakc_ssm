<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>数据字典修改页面</title>
		<%@ include file="../../common/jsp/header.jsp"%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
                <form action="<%=path %>/dictionary/update.do" method="post" class="form-horizontal" role="form">
                	<input type="hidden" name="dataId" value="${entity.dataId }"/>
                    <fieldset>
                        <legend>数据字典基本信息</legend>
                       <div class="form-group">
                          <label class="col-sm-2 control-label" for="ds_host">数据名称</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text" name="dataName" value="${entity.dataName }" placeholder="性别"/>
                          </div>
                          <label class="col-sm-2 control-label" for="ds_name">数据类型</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text" name="dataType" value="${entity.dataType }" placeholder="sex"/>
                          </div>
                       </div>
                       <div class="form-group">
                          <label class="col-sm-2 control-label" for="ds_username">数据备注</label>
                          <div class="col-sm-8">
                             <input class="form-control" type="text"  name="dataCommon" value="${entity.dataCommon }" placeholder="1：男  2：女"/>
                          </div>
                       </div>
                    </fieldset>     
                    <fieldset>
						<legend>编码信息</legend>
                        <div class="form-group">
                           <label for="disabledSelect" class="col-sm-2 control-label">数据编码</label>
                           <div class="col-sm-5">
                              <input type="text" name="dataCode" value="${entity.dataCode }" class="form-control"/>
                           </div>
                           <div class="col-sm-5">
                              <input type="text" name="dataVal" value="${entity.dataVal }" class="form-control"/>
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
                              	<input type="reset" value="重置" class="btn btn-danger"/>
                           	</div>
                        </div>
                    </fieldset>
                </form>
			</div>
		</div>
	</body>
</html>