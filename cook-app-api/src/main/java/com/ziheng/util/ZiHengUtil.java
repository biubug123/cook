package com.ziheng.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @description: 工具类
 * @author: ziHeng
 * @create: 2018-05-16 17:15
 **/
public class ZiHengUtil {

    public static int getAgeByBirth(Long time) {
        int age = 0;
        String val = String.valueOf(time);
        //十位数转13位数
        if(val.length()<=10){
            time = time * 1000;
        }
        try {
            Date birthday = new Date(time);
            Calendar now = Calendar.getInstance();
            now.setTime(new Date());// 当前时间

            Calendar birth = Calendar.getInstance();
            birth.setTime(birthday);

            if (!birth.after(now)) {//如果传入的时间，不在当前时间后面
                age = now.get(Calendar.YEAR) - birth.get(Calendar.YEAR);
                if (now.get(Calendar.DAY_OF_YEAR) > birth.get(Calendar.DAY_OF_YEAR)) {
                    age += 1;
                }
            }
            return age;
        } catch (Exception e) {//兼容性更强,异常后返回数据
            return 0;
        }
    }

    public static void main(String[] args) {

        int age = getAgeByBirth(904579200000l);
        System.out.println(age);
    }
}
