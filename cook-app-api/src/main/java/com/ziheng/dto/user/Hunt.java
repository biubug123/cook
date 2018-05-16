package com.ziheng.dto.user;

import lombok.Data;

import java.math.BigInteger;

/**
 * @description: 用户的求职实体类
 * @author: ziHeng
 * @create: 2018-05-16 13:24
 **/
@Data
public class Hunt {

    private String huntId;

    private String salary;

    private String jobName;

    private Long publishDate;

    private String foodTypeName;

    private String foodTypeIconName;

}
