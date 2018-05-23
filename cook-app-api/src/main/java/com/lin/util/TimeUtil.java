package com.lin.util;

import java.text.SimpleDateFormat;

/**
 * Created by Administrator on 2018/5/18.
 */
public class TimeUtil {
	
	public static String getTime( Long time ) {
		//时间模板
		SimpleDateFormat df = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );//设置日期格式
		return df.format( time ).toString();
	}
}
