var zTree;
var rMenu;
var parentNode;

var setting = {
	data : {
		simpleData : {
			enable : true
		}
	},
	view : {
		dblClickExpand : false
	},
	callback : {
		onRightClick : OnRightClick
	}
};

function OnRightClick(event, treeId, treeNode) {
	if (!treeNode && event.target.tagName.toLowerCase() != "button"
			&& $(event.target).parents("a").length == 0) {
		zTree.cancelSelectedNode();
		showRMenu("root", event.clientX, event.clientY);
	} else if (treeNode && !treeNode.noR) {
		zTree.selectNode(treeNode);
		showRMenu("node", event.clientX, event.clientY);
	}
}

function showRMenu(type, x, y) {
	$("#rMenu ul").show();
	if (type == "root") {
		$("#m_del").hide();
		$("#m_check").hide();
		$("#m_unCheck").hide();
	} else {
		$("#m_del").show();
		$("#m_check").show();
		$("#m_unCheck").show();
	}
	rMenu.css({
		"top" : y + "px",
		"left" : x + "px",
		"visibility" : "visible"
	});

	$("body").bind("mousedown", onBodyMouseDown);
}

function hideRMenu() {
	if (rMenu)
		rMenu.css({
			"visibility" : "hidden"
		});
	$("body").unbind("mousedown", onBodyMouseDown);
}

function onBodyMouseDown(event) {
	if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
		rMenu.css({
			"visibility" : "hidden"
		});
	}
}

$(document).ready(function() {
	$.get(root + '/orgtree/query.do', function(data) {
		zTree = $.fn.zTree.init($("#tree"), setting, data);
		rMenu = $("#rMenu");
	}, 'json');

	//添加新的机构
	$('#m_add').click(function() {
		//隐藏右键菜单
		hideRMenu();
		//获取当前选中节点
		parentNode = zTree.getSelectedNodes()[0];
		//清空表单
		$('#orgtreeId').val('');
		$('form')[0].reset();
		//打开添加窗口
		$('#modal-form').modal('show');
	});
	
	$('#m_update').click(function()
	{
		hideRMenu();
		parentNode = zTree.getSelectedNodes()[0];
		$('form')[0].reset();
		$('#orgtreeId').val(parentNode.id);
		$('#orgtreeName').val(parentNode.name);
		$('#modal-form').modal('show');
	});
	
	$('#orgtreeClick').click(function()
	{
		var param = {
			id: $('#orgtreeId').val(),
			name : $('#orgtreeName').val(),
			pid : parentNode.id,
			level : parentNode.lev + 1
		};
		$.post(root + '/orgtree/add.do', param, function(data) {
			swal({
				title : "温馨提示",
				text : data.message
			});
		}, 'json');
		
		$('#modal-form').modal('hide');
	});

	//删除机构
	$('#m_del').click(function() {
		hideRMenu();
		var parentNode = zTree.getSelectedNodes()[0];
		var id = parentNode.id;

		$.post(root + '/orgtree/delete.do', {
			id : id
		}, function(data) {
			swal({
				title : "温馨提示",
				text : data.message
			});
			if(data.success)
			{
				zTree.removeNode( parentNode );
			}
		}, 'json');
		
		
	});
});