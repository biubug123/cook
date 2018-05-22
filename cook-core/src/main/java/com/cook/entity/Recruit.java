package com.cook.entity;

import lombok.Data;

@Data
public class Recruit {

    private String id;

    //薪资区间
    private String salary;

    //招聘人数
    private Integer recruitPeopleNum;

    //招聘类型 0:代招 1:企业招聘
    private Short recruitType;

    //招聘描述
    private String description;

    //发布日期
    private Long publishDate;

    //申请该招聘的人数
    private Integer applyPeopleNum;

    //该招聘的浏览次数
    private Integer browseCount;

    //发布者id
    private String publisherId;

    //菜系id
    private String foodTypeId;

    //福利id集合 格式:[1,2,3,4]
    private String welfareIdList;

    //职位id
    private String jobId;

    //学历
    private String education;

    //经验要求
    private String experienceRequire;

    //要求的年龄
    private String ageRequire;

    public Recruit() {
    }

    public Recruit(String id, String salary, Integer recruitPeopleNum, Short recruitType, String description, Long publishDate, String publisherId, String foodTypeId, String welfareIdList, String jobId, String education, String experienceRequire, String ageRequire) {
        this.id = id;
        this.salary = salary;
        this.recruitPeopleNum = recruitPeopleNum;
        this.recruitType = recruitType;
        this.description = description;
        this.publishDate = publishDate;
        this.publisherId = publisherId;
        this.foodTypeId = foodTypeId;
        this.welfareIdList = welfareIdList;
        this.jobId = jobId;
        this.education = education;
        this.experienceRequire = experienceRequire;
        this.ageRequire = ageRequire;
    }

    public Recruit(String id, String salary, Integer recruitPeopleNum, Short recruitType, String description, Long publishDate, Integer applyPeopleNum, Integer browseCount, String publisherId, String foodTypeId, String welfareIdList, String jobId, String education, String experienceRequire, String ageRequire) {
        this.id = id;
        this.salary = salary;
        this.recruitPeopleNum = recruitPeopleNum;
        this.recruitType = recruitType;
        this.description = description;
        this.publishDate = publishDate;
        this.applyPeopleNum = applyPeopleNum;
        this.browseCount = browseCount;
        this.publisherId = publisherId;
        this.foodTypeId = foodTypeId;
        this.welfareIdList = welfareIdList;
        this.jobId = jobId;
        this.education = education;
        this.experienceRequire = experienceRequire;
        this.ageRequire = ageRequire;
    }
}