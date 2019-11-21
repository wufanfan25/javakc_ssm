package com.zhg.javakc.base.util.tag;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class SelectTag extends TagSupport{
	
	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String value;
	private String codeTp;
	private String id;
	private String onChange;
	private boolean def;
	private String style;
	private String cls;
	
	@SuppressWarnings("unchecked")
	public int doStartTag() throws JspException {
		try{
			StringBuffer sb=new StringBuffer();
			sb.append("<select name=\"");
			sb.append(name);
			sb.append("\" ");
			if(id!=null && id.trim().length()>0){
				sb.append(" id=\"");
				sb.append(id);
				sb.append("\" ");
			}
			if(onChange!=null && onChange.trim().length()>0){
				sb.append(" onChange=\"");
				sb.append(onChange);
				sb.append("\" ");
			}
			
			if(style!=null && style.trim().length()>0){
				sb.append(" style=\"");
				sb.append(style);
				sb.append("\" ");
			}
			
			if(cls!=null && cls.trim().length()>0){
				sb.append(" class=\"");
				sb.append(cls);
				sb.append("\" ");
			}
			sb.append("> ");
			if(def){
				sb.append("<option value=\"0\">\u8BF7\u9009\u62E9</option> ");
			}
			
			Map<String, Object> map=(Map<String, Object>)this.pageContext.getServletContext().getAttribute("tagData");
			Object o=map.get(codeTp);
			if(o!=null){
				map=(Map<String, Object>)o;
				Set<String> set=map.keySet();
				Iterator<String> it=set.iterator();
				while(it.hasNext()){
					Object codeVal = it.next();
					Object codeDesc = map.get(codeVal);
					sb.append("<option value=\"");
					sb.append(codeVal);
					sb.append("\" ");
					if(codeVal.equals(value)){
						sb.append(" selected ");
					}
					sb.append(">");
					sb.append(codeDesc);
					sb.append("</option>");
				}
			}else{
				throw new RuntimeException("SelectTag:"+codeTp);
			}
			sb.append("</select>");
			pageContext.getOut().println(sb.toString());
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return super.doStartTag();
		
	}
	public void setCls(String cls) {
		this.cls = cls;
	}
	
	@SuppressWarnings("static-access")
	public int doEndTag() throws JspException {
		return this.EVAL_PAGE;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setOnChange(String onChange) {
		this.onChange = onChange;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public void setCodeTp(String codeTp) {
		this.codeTp = codeTp;
	}
	public void setDef(boolean def) {
		this.def = def;
	}
	public void setStyle(String style) {
		this.style = style;
	}
}
