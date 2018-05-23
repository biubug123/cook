package com.ziheng.util;

import javax.xml.bind.ValidationException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description: 工具类
 * @author: ziHeng
 * @create: 2018-05-16 17:15
 **/
public class ZiHengUtil {

    public static int getAgeByBirth(Long time) {
        int age = 0;
        if(time == null){
            return age;
        }
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

    //验证是否为十位数
    public static Boolean isDecadeNum(Long num) throws Exception {
        String regex = "^\\d{10}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(String.valueOf(num));
        if(matcher.matches()){
            return true;
        }
        throw new ValidationException("日期不是十位数");
    }

    public static void main(String[] args) {

        int age = getAgeByBirth(904579200000l);
        System.out.println(age);
    }
}
