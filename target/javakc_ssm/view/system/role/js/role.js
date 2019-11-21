$(function()
{
	$('form:eq(0)').bootstrapValidator({
    	message: '这个值是无效的',
    	//校验是显示图标
    	feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        //需要校验的name名称
        fields: {
        	roleName: {
                validators: {
                    notEmpty: {
                        message: '角色名称是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '角色名称长度不能低于3不能高于12'
                    }
                }
            },
            roleRemark: {
            	validators: {
                    notEmpty: {
                        message: '角色备注是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '角色备注长度不能低于3不能高于12'
                    }
                }
            }
        }
    });
	
	$('.tree').treegrid(
	{
		treeColumn: 1
	});
	
	$('[type="hidden"][name="checkIds"]').each(function(index, obj)
	{
		var menuId = $(obj).val();
		$('#'+menuId).attr('checked', true);
	});
	
});