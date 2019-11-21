package com.zhg.javakc.base.util;

import java.util.UUID;

/**
 * 項目工具類
 * @author zhou
 * @version v0.1
 */
public class CommonUtil {
	
	/**
	 * 獲取32位uuid
	 * @return
	 */
	public static String uuid()
	{
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 驗證當前對象不為空
	 * 為空: 返回false
	 * 不為空: 返回true
	 * @param obj
	 * @return
	 */
	public static boolean isNotNull(Object obj)
	{
		if(null == obj || "".equals(obj))
		{
			return false;
		}
		return true;
	}
	
	/**
	 * 驗證字符串是否為空
	 * 為空: 返回false
	 * 不為空: 返回true
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str)
	{
		if(null != str && !"".equals(str))
		{
			return true;
		}
		return false;
	}
	
}
