<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>物资添加页面</title>
		<%@ include file="../../common/jsp/header.jsp"%>
		<link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/demo.css" type="text/css">
		<link rel="stylesheet" href="${ctx }/static/css/plugins/ztree/zTreeStyle/zTreeStyle.css" type="text/css">
		<link href="${path }/static/css/plugins/file-input/fileinput.min.css" rel="stylesheet">
<%--		<link href="${path }/static/css/plugins/file-input/bootstrap-fileinput.css" rel="stylesheet">--%>
	</head>
	<body>
		<div class="wrapper wrapper-content animated fadeInRight">
			<div>
				<div class="col-sm-4"><input type="button" value="返回上一页" class="btn btn-success" onclick="javascript:history.back();"/></div>
			</div>
			<div class="ibox float-e-margins">
				<form action="${path}/material/save.do" method="post" class="form-horizontal" role="form">
                    <fieldset>
                        <legend>物资基本信息</legend>
                       <div class="form-group">
						   <label class="col-sm-2 control-label">物资分类</label>
						   <div class="col-sm-4">
							   <input type="hidden" value="" id="selectnodeId" name="mtypeId">
							   <input class="form-control" id="menuBtn" type="text" name="mtypeIdName" readonly value="" onclick="showMenu(); return false;" placeholder="物资分类"/>
						   </div>

                          <label class="col-sm-2 control-label" >物资名称</label>
                          <div class="col-sm-4">
                             <input class="form-control" type="text" name="materialName" placeholder="物资名称"/>
                          </div>
                       </div>
                       <div class="form-group">
                          <label class="col-sm-2 control-label" >规格</label>
                          <div class="col-sm-4">
							  <input class="form-control" type="text" name="materialSpecs" placeholder="物资规格,例:10斤/箱"/>
                          </div>

						   <label class="col-sm-2 control-label" >物资简称</label>
						   <div class="col-sm-4">
							   <input class="form-control" type="text" name="materialAbbr" placeholder="物资简称"/>
						   </div>
                       </div>

						<div class="form-group">
							<label class="col-sm-2 control-label" >物资简述</label>
							<div class="col-sm-8">
								<input class="form-control" type="text" name="materialComment" />
							</div>
						</div>

						<%--图片...--%>

						<div class="form-group">
							<label class="col-sm-2 control-label" >物资图片</label>
							<div class="col-md-8">
								<div class="fileinput fileinput-new" data-provides="fileinput" id="uploadImageDiv">
<%--									<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">--%>
<%--										<img src="${companyInfo.image}" alt="" />--%>
<%--									</div>--%>
									<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>

						<div class="form-group">
                        <span class="btn default btn-file">
							<label class="col-md-4">
								<span class="fileinput-new">选择图片</span>
							</label>
<%--							<label class="col-md-4"><span class="fileinput-exists">更改</span></label>--%>
							<input type="file" name="materialPhoto" id="materialPhoto" />
						</span>

								<a href="#" class="btn-file" data-dismiss="fileinput">移除</a>
								<span>请选择1M以内图片</span>
								</div>

						</div>


						<div class="form-group">
							<label class="col-sm-2 control-label" >是否赋码</label>
							<div class="col-sm-2">
								<input type="radio" name="materialCoding" value="1">是　　
								<input type="radio" name="materialCoding" value="0">否
							</div>

							<label class="col-sm-2 control-label" >物资类型</label>
							<div class="col-sm-2">
								<select class="form-control" name="materialType">
									<option value="原料类">原料类</option>
									<option value="加工类">加工类</option>
								</select>
							</div>
							<label class="col-sm-2 control-label" >限制合同采购</label>
							<div class="col-sm-2">
								<input type="radio" name="materialContract" value="1">是　　
								<input type="radio" name="materialContract" value="0">否
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" >物资组</label>
							<div class="col-sm-4">
								<select class="form-control" name="materialGroup">
									<option value="组一">组一</option>
									<option value="组二">组二</option>
								</select>
							</div>

							<label class="col-sm-2 control-label" >保质期</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="materialExp" placeholder="单位:天"/>
							</div>

						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" >税率</label>
							<div class="col-sm-2">
								<input class="form-control" type="text" name="taxRate" placeholder="格式:0.xx,即xx%"/>
							</div>

							<label class="col-sm-2 control-label" >基本单位</label>
							<div class="col-sm-2">
								<select class="form-control" name="materialUnit">
									<option value="千克">千克</option>
									<option value="斤">斤</option>
								</select>
							</div>
							<label class="col-sm-2 control-label" >生产单位</label>
							<div class="col-sm-2">
								<select class="form-control" name="materialProu">
									<option value="千克">千克</option>
									<option value="斤">斤</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" >净重</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="materialSuttle" placeholder="输入数值即可"/>
							</div>

							<label class="col-sm-2 control-label" >毛重</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="materialGw" placeholder="输入数值即可"/>
							</div>

						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label" >体积</label>
							<div class="col-sm-4">
								<input class="form-control" type="text" name="materialVolume" placeholder="格式:长*宽*高"/>
							</div>

							<label class="col-sm-2 control-label" >单位</label>
							<div class="col-sm-4">
								<select class="form-control" name="volumeUnit">
									<option value="厘米">厘米</option>
									<option value="分米">分米</option>
								</select>
							</div>
						</div></div>
						</div>
                    </fieldset>
                    <fieldset>
                        <div class="form-group">
                        	<label class="col-sm-2 control-label"></label>
                           	<div class="col-sm-4">
                              	<input type="submit" value="提交" class="btn btn-primary"/>
                           	</div>
                           	<label class="col-sm-2 control-label" ></label>
                           	<div class="col-sm-4">
                              	<input type="reset" value="重置" class="btn btn-danger" id="resetForm"/>
                           	</div>
                        </div>
                    </fieldset>
                </form>
			</div>
		</div>

		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
			<ul id="tree" class="ztree" style="margin-top:0; width:220px;"></ul>
		</div>
	</body>


<%--	<script>--%>
<%--		var url = '';--%>
<%--		$("#uploadImage").fileupload({--%>
<%--			url :  ROOT+ "/security/company/uploadFile",--%>
<%--			dataType : 'json',--%>
<%--			autoUpload : false,--%>
<%--			acceptFileTypes : /(gif|jpe?g|png)$/i,--%>
<%--			maxFileSize : 1000000, // 1 MB--%>
<%--			imageMaxWidth : 100,--%>
<%--			imageMaxHeight : 100,--%>
<%--			messages : {--%>
<%--				acceptFileTypes : '文件类型不匹配',--%>
<%--				maxFileSize : '文件过大',--%>
<%--				minFileSize : '文件过小'--%>
<%--			}--%>
<%--		}).on("fileuploadadd", function(e, data) {--%>
<%--			// 当文件添加上去时候调用--%>
<%--			$("#titleImageError").html("");--%>
<%--			data.submit()--%>
<%--		}).on("fileuploaddone", function(e, data) {--%>
<%--			// 上传完成时调用--%>
<%--			if (data.result.returnState == "ERROR") {--%>
<%--				alert("上传失败")--%>
<%--				return;--%>
<%--			}--%>
<%--			url = data.result.returnData.url;--%>
<%--		});--%>

<%--		function updateMsg() {--%>
<%--			$.ajax({--%>
<%--				url : ROOT +"/security/company/updateInfo",--%>
<%--				data : {--%>
<%--					id : $("#companyId").val(),--%>
<%--					image : url,--%>
<%--					companyName : $("#companyName").val(),--%>
<%--					companySite : $("#companySite").val(),--%>
<%--					companyLinker : $("#companyLinker").val(),--%>
<%--					companyTel : $("#companyTel").val()--%>
<%--				},--%>
<%--				type : "post",--%>
<%--				success : function(data) {--%>
<%--					if (data.returnState == "OK") {--%>
<%--						layer.msg('操作成功', {--%>
<%--							icon : 6,--%>
<%--							shade : 0.01,--%>
<%--							offset : [ '57px', '1100px' ]--%>
<%--						});--%>
<%--						$table.bootstrapTable('refresh');--%>
<%--					} else {--%>
<%--						layer.msg('操作失败', {--%>
<%--							icon : 5,--%>
<%--							shade : 0.01,--%>
<%--							offset : [ '90px', '900px' ]--%>
<%--						});--%>
<%--					}--%>
<%--				}--%>
<%--			});--%>
<%--		}--%>
<%-- 	</script>--%>


	<script type="text/javascript" src="${path }/static/js/plugins/file-input/fileinput.min.js"></script>
<%--	<script type="text/javascript" src="${path }/static/js/plugins/file-input/bootstrap-fileinput.js"></script>--%>
<%--	<script type="text/javascript" src="./js/dictionary.js"></script>--%>
	<script type="text/javascript" src="./js/MaterialTypeSelect.js"></script>
	<script type="text/javascript" src="${ctx }/static/js/plugins/ztree/jquery.ztree.core-3.5.js"></script>
</html>