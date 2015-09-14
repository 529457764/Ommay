package com.ommay.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
	public static String getNowDate(){
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");//可以方便地修改日期格式
		return dateFormat.format(now); 
	}
	
	public static String getNowDateAndTime(){
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");//可以方便地修改日期格式
		return dateFormat.format(now); 
	}
}
