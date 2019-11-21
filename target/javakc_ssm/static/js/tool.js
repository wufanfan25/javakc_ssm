/**
 *	js工具类
 */
function page(n,s,a){
	if(n) $("#pageNo").val(n);
	if(s) $("#pageSize").val(s);
	$("#searchForm").submit();
	return false;
}

$(function()
{
	//搜索完毕,回车触发事件
	$('#search').keydown(function(e){
		if(e.keyCode==13){
		   $('#searchForm').submit();
		}
	});
	
	//点击展示页面添加按钮触发事件
	$('#create').click(function()
	{
		var url = $(this).attr('name');
		document.location.href=root+'view/'+url;
	});
	
	//点击展示页面添加按钮触发事件
	$('#add').click(function()
	{
		var url = $(this).attr('name');
		document.location.href=root+url;
	});
	
	//修改选中的节点数据
 	$('#update').click(function()
 	{
 		if($.selectedCount('update'))
		{
 			var url = root+$(this).attr('name');
 			$("#searchForm").attr('action', url).submit();
		}
 	});
 	
 	//删除选中的节点数据
	$('#delete').click(function()
	{
		var url = root+$(this).attr('name');
		$.isconfirm(url);
	});
 	
 	//删除选中的节点数据
 	$('#export').click(function()
	{
		var url = root+$(this).attr('name');
		window.open(url);
	});
 	
	//点击页面实现全选,反选功能
	$('#checkall').click(function()
	{
		$('input[name=ids]').prop('checked', $(this).prop('checked'));
	});
	
	//实现全选反选功能
	$('input[name=ids]').click(function()
	{
		if($('input[name=ids]').length == $('input[name=ids]:checked').length)
		{
			$('#checkall').prop('checked', true);
		}
		else
		{
			$('#checkall').prop('checked', false);
		}
	});
	
	/**
     * 自定义(删除提示)函数
     * url: 调用删除的路径定制
     * 返回true则直接执行删除
     * false则不是删除当前记录
     */
	$.extend({'isconfirm':function(url){
		swal({   
			title: "确定要删除吗?",   
			text: "删除后将无法恢复当前记录!",   
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
				if($.selectedCount('delete'))
				{
		 			$("#searchForm").attr('action', url).submit();
				}
			} else {     
				swal("取消", "吓死了,幸亏没删了!", "error");
			}
		});
	}});
	
	/**
	 * 自定义(选中条数)函数
	 * type: 来判断是 修改还是删除
	 * 修改判断只能选中一条记录
	 * 删除判断至少选中一条记录
	 * 返回true则可以继续执行, false则反之
	 */
	$.extend({'selectedCount':function(type){
		var selected = $('input[name=ids]:checked').length;
		if(type == 'update')
		{
			if(selected != 1)
			{
				swal({title:"温馨提示",text:"修改信息时,您只能选择一条记录修改?"});
				return false;
			}
		}
		else if(type == 'delete')
		{
			if(selected == 0)
			{
				swal({title:"温馨提示",text:"删除信息时,您至少选择一条记录删除?"});
				return false;
			}
		}
		return true;
	}});
});