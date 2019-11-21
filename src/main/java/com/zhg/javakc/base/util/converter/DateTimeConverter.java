package com.zhg.javakc.base.util.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * 自定义SpringMvc日期转化器
 * @author zhou
 */
public class DateTimeConverter implements Converter<String, Date> {

	@Override    
	public Date convert(String source) 
	{
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    dateFormat.setLenient(false);
	    try 
	    {
	    	if(null != source && !"".equals(source)) {
	    		return dateFormat.parse(source);
	    	}
	    } 
	    catch (ParseException e) 
	    {
	        e.printStackTrace();
	    }
	    return null;
	}
	
}
