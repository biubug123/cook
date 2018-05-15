package com.cook.entity;

import lombok.Data;

@Data
public class WorkExperience {

    private String id;

    //岗位名称
    private String jobName;

    //公司
    private String company;

    //入职日期
    private Long entryDate;

    //离职日期
    private Long dimissionDate;

    //工作内容
    private String jobContent;

}