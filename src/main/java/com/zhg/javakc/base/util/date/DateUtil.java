package com.zhg.javakc.base.util.date;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static void main(String[] args) {
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 6);
		
		Date date = calendar.getTime();
		
		System.out.println( date );
	}
	
}
