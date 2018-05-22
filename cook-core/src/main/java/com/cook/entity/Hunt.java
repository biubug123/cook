package com.cook.entity;

import lombok.Data;

@Data
public class Hunt {

    private String id;

    //工资区间
    private String salary;

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

    //工作地区
    private String workArea;

    public Hunt() {
    }

    public Hunt(String id, String salary, Integer browseCount, String resumeId, String jobId, String foodTypeId, Long huntDate, String workArea) {
        this.id = id;
        this.salary = salary;
        this.browseCount = browseCount;
        this.resumeId = resumeId;
        this.jobId = jobId;
        this.foodTypeId = foodTypeId;
        this.huntDate = huntDate;
        this.workArea = workArea;
    }
}