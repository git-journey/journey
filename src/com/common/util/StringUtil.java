package com.common.util;

/**
 * 字符串相关操作工具类
 * @author Administrator
 *
 */
public class StringUtil 
{
	/**
	 * 判断字符串是否为空字符串
	 * @param 需要判断原字符串
	 * @return 返回boolean值，源字符串为空或者为'',则返回true,否则false
	 */
	public static boolean isNullString(String target)
	{
		if(target == null || "".equals(target.trim()))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
}
