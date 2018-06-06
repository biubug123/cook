package com.cook.util;

import org.apache.commons.lang.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @description: 随机名
 * @author: ziHeng
 * @create: 2018-05-14 11:25
 **/
public class RandomUtil {

    /**
      * @Description: 原始图片名转随机图片名
      * @Author: ziHeng
      * @Date: 2018/6/2 上午11:05
      * @Param: [name:原始图片名]
      * @return: java.lang.String
      */
    public static String getImgName(String name){
        String extendName = StringUtils.substringAfterLast(name, ".");
        //时间模板
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式

        return df.format(new Date())+"."+extendName;

    }


    public static void main(String[] args) {

    }
}
