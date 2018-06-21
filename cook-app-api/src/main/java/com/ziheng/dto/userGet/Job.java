package com.ziheng.dto.userGet;

import lombok.Data;

/**
 * @description: 职位收藏实体类
 * @author: ziHeng
 * @create: 2018-05-17 14:23
 **/
@Data
public class Job implements Comparable<Job>{



    //招聘表id 或 求职表id
    private String id;

    //id类型 0:招聘表 1:求职表
    private Short idType;

    //招聘类型 0:代招 1:求职
    private Short recruitType;

    private String iconName;

    private String jobName;

    private String salary;

    private String publisherName;

    private Long publishDate;


    @Override
    public int compareTo(Job o) {
        return (int) (o.publishDate - this.publishDate);
    }
}
