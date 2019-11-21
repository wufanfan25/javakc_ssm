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
        	userName: {
                validators: {
                    notEmpty: {
                        message: '用户名称是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '测试名称长度不能低于3不能高于12'
                    }
                }
            },
            loginName: {
            	validators: {
                    notEmpty: {
                        message: '登陆名称是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '登陆名称长度不能低于3不能高于12'
                    }
                }
            },
            loginPass: {
            	validators: {
                    notEmpty: {
                        message: '登陆密码是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '登陆密码长度不能低于6不能高于16'
                    },
                    different: {
                    	field: 'loginName',
                    	message: '不能和登陆名称一致!'
                    }
                }
	        },
	        retypepass: {
	        	validators: {
	        		notEmpty: {
                        message: '登陆密码是必填项,不能为空!'
                    },
	        		identical: {
	        			field: 'loginPass',
	        			message: '确认两次密码输入一致!'
	        		}
	        	}
	        },
	        userEmail: {
	        	validators: {
	        		notEmpty: {
                        message: '电子邮件是必填项,不能为空!'
                    },
                    emailAddress: {
	        			message: '请输入有效电子邮件!'
	        		}
	        	}
	        },
	        userPhone: {
	        	validators: {
	        		notEmpty: {
                        message: '手机号码是必填项,不能为空!'
                    },
                    regexp: {
                    	regexp: /^1[3|4|5|7|8|9]\d{9}$/,
	        			message: '请输入有效手机号码!'
	        		}
	        	}
	        }
            
        }
    });
	
	

});