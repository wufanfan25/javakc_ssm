$(function()
{
	$('#menu').click(function()
	{
		$.get(root+'/cache/menu.do', function(data)
		{
			$('#showmessage').append('<div class="alert alert-success" role="alert">菜单缓存刷新成功</div>');
		}, 'json');
	});
	
	$('#dictionary').click(function()
	{
		$.get(root+'/cache/dictionary.do', function(data)
		{
			$('#showmessage').append('<div class="alert alert-success" role="alert">字典缓存刷新成功</div>');
		}, 'json');
	});
	
});