package com.zhg.javakc.base.util.tag;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class DateTag extends TagSupport{
	private static final long serialVersionUID = 817954369581718009L;
	private String times;
	private String type;
	private String format;
	
	public void setTimes(String times) {
		this.times = times;
	}
	public void setType(String type) {
		this.type = type;
	}
	public void setFormat(String format) {
		this.format = format;
	}
	
	@SuppressWarnings("deprecation")
	public int doStartTag() throws JspException {
		
		Date d=null;
		String s2="";
		if (times!=null && times.trim().length()>0)
		{
			try
			{
				d=new Date(times);
			}
			catch(Exception e)
			{
				if(times.indexOf(".")>0){
					String s=times.substring(0,times.indexOf(".") );
					SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
					try {
						d=sf.parse(s);
					} catch (ParseException e1) {
						throw new RuntimeException("Date解析异常:"+times);
					}
				}else{
					throw new RuntimeException("Date解析异常:"+times);
				}
			}
		}
		else
		{
			d = new Date();
		}
			if(!(format!=null && format.trim().length()>0))
			{
				if("time".equals(type))
				{
					format="hh:mm:ss";
				}
				else if("daytime".equals(type))
				{
					format="yyyy-MM-dd hh:mm:ss";
				}
				else 
				{
					format="yyyy-MM-dd";
				}
			}
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		s2=sdf.format(d);
		try
		{
			pageContext.getOut().println(s2);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return super.doStartTag();
	}
	
	@SuppressWarnings("static-access")
	public int doEndTag() throws JspException {
		return this.EVAL_PAGE;
	}
	
}
