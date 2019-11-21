package com.zhg.javakc.modules.system.home.task;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

@Controller
public class HomeTask {
	
	@Scheduled(cron= "0/10 * * * * ?")
	public void flush()
	{
		@SuppressWarnings("unused")
		Date date = new Date();
		@SuppressWarnings("unused")
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//System.out.println("现在时间为："+format.format(date));
	}
	
	/**
	 * cron属性配置
	 * 
	 * cron * * * * * *
	 * 	秒（0~59）
	 *  分钟（0~59）
	 *  小时（0~23）
	 *  天（0~31，但是你需要考虑你月的天数）
	 *  月（0~11）
	 *  天（星期）（1~7 1=SUN，MON，TUE，WED，THU，FRI，SAT）
	 *  年份（1970－?）
	 *  
	 *  
	 *  例如：
	 *  		0 0 10,14,16 * * ? 	每天上午10点，下午2点，4点
	 *  		0 0/30 9-18 * * ?   朝九晚六工作时间内每半小时
	 *  
	 *  		0 0 12 * * ? 		每天中午12点
	 *  		0 0 12 * * ? 2018	2018年每天中午12点
	 *  		0 0 12 ? * WED 2018	2018年每个星期三中午12点
	 *  		
	 *  		0 10,44 14 ? 3 WED  每年三月的星期三的下午2:10和2:44触发
	 */
	
}
