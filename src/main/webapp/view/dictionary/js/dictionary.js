$(function()
{
	//拼接动态增加行内容
	var html = '<div class="form-group">';
    html += '<label for="disabledSelect" class="col-sm-2 control-label">数据编码</label>';
    html += '<div class="col-sm-4">';
    html += '   <input type="text" name="code" class="form-control"/>';
    html += '</div>';
    html += '<div class="col-sm-4">';
    html += '   <input type="text" name="val" class="form-control"/>';
    html += '</div>';
    html += '<div class="col-sm-2">';
    html += '<input type="button" value="移除" name="removeLine" class="btn btn-danger"/>';
    html += '</div>';
    html += '</div>';
    
    //点击动态增加行实现添加
    $('#createLine').click(function()
	{
    	$('#addLine').before(html);
    	//动态增加行,启用验证
    	$('form:eq(0)').bootstrapValidator('addField', 'code', {  
            validators: {  
                notEmpty: {  
                    message: '数据编码真实值必填项,不能为空!'  
                }  
            }  
        });
    	$('form:eq(0)').bootstrapValidator('addField', 'val', {  
            validators: {  
                notEmpty: {  
                    message: '数据编码表现值必填项,不能为空!'  
                }  
            }  
        });
	});
    
    //移除动态添加的记录
    $(document).delegate('input[name=removeLine]', 'click', function()
	{
    	$(this).parent().parent().remove();
	});
    
    //对当前表单进行验证
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
        	dataName: {
                validators: {
                    notEmpty: {
                        message: '数组字典名称是必填项,不能为空!'
                    },
                    stringLength: {
                        min: 3,
                        max: 25,
                        message: '数组字典名称长度不能低于3不能高于12'
                    }
                }
            },
            dataType: {
            	validators: {
            		notEmpty: {
            			message: '数组字典类型是必填项,不能为空!'
            		},
            		stringLength: {
            			min: 3,
            			max: 25,
            			message: '数组字典类型长度不能低于3不能高于12'
            		}
            	}
            },
            dataCommon: {
            	validators: {
            		notEmpty: {
            			message: '数组字典备注是必填项,不能为空!'
            		},
            		stringLength: {
            			min: 3,
            			max: 25,
            			message: '数组字典备注长度不能低于3不能高于12'
            		}
            	}
            },
            code: {
            	validators: {
            		notEmpty: {
            			message: '数据编码真实值必填项,不能为空!'
            		}
            	}
            },
            val: {
            	validators: {
            		notEmpty: {
            			message: '数据编码表现值必填项,不能为空!'
            		}
            	}
            }
        }
    });
    
    //重置当前表单
    $('#resetForm').click(function()
	{
    	$("form:eq(0)").data('bootstrapValidator').resetForm();
	});
    
});