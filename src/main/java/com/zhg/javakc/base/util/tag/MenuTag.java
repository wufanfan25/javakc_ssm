package com.zhg.javakc.base.util.tag;

import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class MenuTag extends TagSupport{
	
	private String role;
	private static final long serialVersionUID = 1L;
	
	public void setRole(String role) {
		this.role = role;
	}

	public int doStartTag() throws JspException {
		try{
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>)this.pageContext.getServletContext().getAttribute("menuData");
			String menu = (String)map.get(role);
			if(null != menu){
				pageContext.getOut().println( menu );
			}else{
				throw new RuntimeException("ShowTag 获取失败:"+role);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	@SuppressWarnings("static-access")
	public int doEndTag() throws JspException {
		return this.EVAL_PAGE;
	}
	
}

