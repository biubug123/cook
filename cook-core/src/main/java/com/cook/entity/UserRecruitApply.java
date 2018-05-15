package com.cook.entity;

import lombok.Data;

@Data
public class UserRecruitApply {

    private String id;

    //申请日期
    private Long applyDate;

    private String userId;

    //招聘表id
    private String recruitId;

    //是否已查看
    private Short isChecked;

    //招聘方式
    private Short recruitType;

    //发布者id
    private String publisherId;

    //发布者名称
    private String publisherName;

    //菜系名称
    private String foodTypeName;

    //岗位名称
    private String jobName;

}