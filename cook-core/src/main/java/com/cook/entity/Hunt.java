package com.cook.entity;

import lombok.Data;

@Data
public class Hunt {

    private String id;

    //工资区间
    private Double salary;

    //浏览次数
    private Integer browseCount;

    //简历id
    private String resumeId;

    //岗位id
    private String jobId;

    //菜系id
    private String foodTypeId;

    //求职日期
    private Long huntDate;

}