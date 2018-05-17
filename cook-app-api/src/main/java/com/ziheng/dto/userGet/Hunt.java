package com.ziheng.dto.userGet;

import lombok.Data;

/**
 * @description: 用户的求职实体类
 * @author: ziHeng
 * @create: 2018-05-16 13:24
 **/
@Data
public class Hunt {

    //求职id
    private String huntId;

    //薪资区间
    private String salary;

    //岗位名称
    private String jobName;

    //发布日期
    private Long publishDate;

    //菜系名称
    private String foodTypeName;

    //菜系图片路径
    private String foodTypeIconName;

}
