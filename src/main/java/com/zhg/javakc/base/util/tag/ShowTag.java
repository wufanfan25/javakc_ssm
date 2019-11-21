package com.zhg.javakc.base.util.tag;

import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class ShowTag extends TagSupport{
	private static final long serialVersionUID = 1L;
	private String value;
	private String codeTp;
	public void setValue(String value) {
		this.value = value;
	}
	public void setCodeTp(String codeTp) {
		this.codeTp = codeTp;
	}
	
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		try{
			Map<String, Object> map=(Map<String, Object>)this.pageContext.getServletContext().getAttribute("tagData");
			Object o=map.get(codeTp);
			if(o!=null){
				map=(Map<String, Object>)o;
				if(map.get(value)!=null){
					pageContext.getOut().println(map.get(value));
				}
				
			}else{
				throw new RuntimeException("ShowTag 获取失败:"+codeTp);
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

