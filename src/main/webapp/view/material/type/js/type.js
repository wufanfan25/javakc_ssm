var zTree;
var rMenu;
var parentNode;

var setting = {
	data : {
		simpleData : {
			enable : true
		}
	},
	callback: {
        onClick: onClick
    }
};

function onClick(event, treeId, treeNode, clickFlag) {
    console.log(treeNode.id);
	showForm(treeNode.id,treeNode.code,treeNode.name,treeNode.abbr)
}

$(document).ready(function() {

	   $.get(root + '/materialtype/query.do', function (data) {
		   zTree = $.fn.zTree.init($("#tree"), setting, data);
		   showForm(data[0].id, data[0].code, data[0].name, data[0].abbr)
	   }, 'json');

	$('#t_update').click(function()
	{
		var param = {
			mtypeId: $('#mtypeId').val(),
			mtypePid: $('#mtypePid').val(),
			mtypeName : $('#mtypeName').val(),
			mtypeCode : $('#mtypeCode').val(),
			mtypeAbbr : $('#mtypeAbbr').val(),
			mtypeLevel : zTree.getSelectedNodes()[0].lev

		};
		$.post(root + '/materialtype/update.do', param, function(data) {
			swal({
				title : "温馨提示",
				text : data.message
			},function () {
				window.location.reload();
			});
		}, 'json');
	});


	$('#t_add').click(function(){
		//获取当前选中节点
		parentNode = zTree.getSelectedNodes()[0];
		//清空表单(其中隐藏域的值需要置空)
		$('#mtypeId').val('');
		$('form')[0].reset();
		//赋值pid
		$("#mtypePid").val(parentNode.id);
		//发送异步请求动态获取编码
		$.post(root +"/materialtype/findTypeCode.do",
			     { mtypeLevel : parentNode.lev},function (data) {
			console.log(data.mtypeCode);
			$("#mtypeCode").val(data.mtypeCode);
		})

	});

	//监听删除按钮
	$('#t_delete').click(function(){

		//获取隐藏域中当前选择节点的ID
		var mtype_Id = $("#mtypeId").val();
		console.log(mtype_Id);
		if(mtype_Id = null || mtype_Id == ""){
			//alert("添加状态不可删除！");
			swal("新增状态不可删除！", "", "error");
			return false;
		}else {
            var url = root + '/materialtype/delete.do';
			var mtype_Id = $("#mtypeId").val();
			swal({
				title: "确定要删除吗?",
				text: "删除后将删除本节点以及其所有子节点!",
				type: "warning",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "是的, 不后悔!",
				cancelButtonText: "算了, 再想想!",
				closeOnConfirm: false,
				closeOnCancel: false
			}, function(isConfirm){
				if (isConfirm) {
					swal("成功!", "删除成功,再也找不回来了.", "success");
					$("#form-inline").attr('action', url).submit();
				} else {
					swal("取消", "吓死了,幸亏没删了!", "error");
				}
			});
		}
	})

});

function showForm(mtypeId,mtypeCode,mtypeName,mtypeAbbr) {
	$("#mtypeId").val(mtypeId);
	$("#mtypeCode").val(mtypeCode);
	$("#mtypeName").val(mtypeName);
	$("#mtypeAbbr").val(mtypeAbbr);
}
