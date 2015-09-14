package com.ommay.utils;

import java.util.Arrays;
import java.util.Random;

/**
 * 
 * @author hs 2015/8/31
 *
 */
public class RandomUtils {

	public RandomUtils(){
	}
	
	public String  getRandoms(){
			String value = null;
			Random r = new Random();
			int t1,t2;
			int num[] = {0,1,2,3,4,5,6};  
			int len = num.length;  
			int returnValue[] = new int[7];  
			for(int i=0;i<7;i++)  
			{  
				t1 = Math.abs(r.nextInt())% len;  
				returnValue[i] = num[t1];  
				t2 = num[t1];  
				num[1] = num[len-1];  
				num[len-1] = t2;  
				len--;  
			}  
			value = String.valueOf(returnValue[0]);
			for (int i = 1; i < returnValue.length; i++) {
				value += String.valueOf(returnValue[i]);
			}
			System.out.println("value == "+value);
			return value;  
	}
}
