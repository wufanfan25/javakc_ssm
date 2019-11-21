$(function()
{
	//设置 菜单状态 选择开关
	$("[name='menuState']").bootstrapSwitch();
	
	//选择父类触发事件
	$('#menupid').click(function()
	{
		layer.open({
		  type: 2,
		  title: '选择菜单父类',
		  shadeClose: true,
		  shade: 0.8,
		  area: ['65%', '65%'],
		  content: root+'/menu/createParent.do'
		}); 
	});
	
	$('form:eq(0)').bootstrapValidator({
		excluded:[":disabled"],
		trigger:"change",
    	feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	menuName: {
                validators: {
                    notEmpty: {
                        message: '菜单名称是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 2,
                        max: 25,
                        message: '菜单名称长度不能低于3不能高于12'
                    }
                }
            },
            menuUri: {
            	validators: {
                    notEmpty: {
                        message: '访问路径是必填项,不能为空!'
                    }
                }
            },
            menuPermission: {
            	validators: {
                    notEmpty: {
                        message: '访问权限是必填项,不能为空!'
                    }
                }
            },
            menuWeight: {
            	validators: {
                    notEmpty: {
                        message: '菜单排序是必填项,不能为空!'
                    }
                }
            }
        }
    });
	
});