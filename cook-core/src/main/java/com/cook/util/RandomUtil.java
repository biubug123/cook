package com.cook.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @description: UUID和随机名
 * @author: ziHeng
 * @create: 2018-05-14 11:25
 **/
public class RandomUtil {

    public static String getImgName(){

        //时间模板
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式

        return df.format(new Date());

    }


    public static void main(String[] args) {
        System.out.println(RandomUtil.getImgName());
    }
}
