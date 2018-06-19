package com.ziheng.util;

import javax.xml.bind.ValidationException;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description: 工具类
 * @author: ziHeng
 * @create: 2018-05-16 17:15
 **/
public class ZiHengUtil {

    //年龄换算成生日
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

    /**
     * 城市首字母 是否大小写
     */
    public static String getPYIndexStr(String strChinese, boolean bUpCase) {
        try {
            StringBuffer buffer = new StringBuffer();
            byte b[] = strChinese.getBytes("GBK");// 把中文转化成byte数组
            //中文占两个字节 循环二次即第一个中文
            for (int i = 0; i < 2; i++) {
                if ((b[i] & 255) > 128) {
                    int char1 = b[i++] & 255;
                    char1 <<= 8;// 左移运算符用“<<”表示，是将运算符左边的对象，向左移动运算符右边指定的位数，并且在低位补零。其实，向左移n位，就相当于乘上2的n次方
                    int chart = char1 + (b[i] & 255);
                    buffer.append(getPYIndexChar((char) chart, bUpCase));
                }
            }
            return buffer.toString();
        } catch (Exception e) {
            System.out.println((new StringBuilder()).append("\u53D6\u4E2D\u6587\u62FC\u97F3\u6709\u9519")
                    .append(e.getMessage()).toString());
        }
        return null;
    }

    /**
     * 得到首字母
     */
    private static char getPYIndexChar(char strChinese, boolean bUpCase) {

        int charGBK = strChinese;

        char result;

        if (charGBK >= 45217 && charGBK <= 45252)

            result = 'A';

        else

        if (charGBK >= 45253 && charGBK <= 45760)

            result = 'B';

        else

        if (charGBK >= 45761 && charGBK <= 46317)

            result = 'C';

        else

        if (charGBK >= 46318 && charGBK <= 46825)

            result = 'D';

        else

        if (charGBK >= 46826 && charGBK <= 47009)

            result = 'E';

        else

        if (charGBK >= 47010 && charGBK <= 47296)

            result = 'F';

        else

        if (charGBK >= 47297 && charGBK <= 47613)

            result = 'G';

        else

        if (charGBK >= 47614 && charGBK <= 48118)

            result = 'H';

        else

        if (charGBK >= 48119 && charGBK <= 49061)

            result = 'J';

        else

        if (charGBK >= 49062 && charGBK <= 49323)

            result = 'K';

        else

        if (charGBK >= 49324 && charGBK <= 49895)

            result = 'L';

        else

        if (charGBK >= 49896 && charGBK <= 50370)

            result = 'M';

        else

        if (charGBK >= 50371 && charGBK <= 50613)

            result = 'N';

        else

        if (charGBK >= 50614 && charGBK <= 50621)

            result = 'O';

        else

        if (charGBK >= 50622 && charGBK <= 50905)

            result = 'P';

        else

        if (charGBK >= 50906 && charGBK <= 51386)

            result = 'Q';

        else

        if (charGBK >= 51387 && charGBK <= 51445)

            result = 'R';

        else

        if (charGBK >= 51446 && charGBK <= 52217)

            result = 'S';

        else

        if (charGBK >= 52218 && charGBK <= 52697)

            result = 'T';

        else

        if (charGBK >= 52698 && charGBK <= 52979)

            result = 'W';

        else

        if (charGBK >= 52980 && charGBK <= 53688)

            result = 'X';

        else

        if (charGBK >= 53689 && charGBK <= 54480)

            result = 'Y';

        else

        if (charGBK >= 54481 && charGBK <= 55289)

            result = 'Z';

        else

            result = (char) (65 + (new Random()).nextInt(25));

        if (!bUpCase)

            result = Character.toLowerCase(result);

        return result;

    }


    public static void main(String[] args) {

        int age = getAgeByBirth(904579200000l);
        System.out.println(age);
    }
}
