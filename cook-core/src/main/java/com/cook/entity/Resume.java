package com.cook.entity;

import lombok.Data;

@Data
public class Resume {

    private String id;

    //工作年限
    private Short workYear;

    //工作经验表Id
    private String workExperienceId;

    //学历
    private String education;

    //用户id
    private String userId;

    //简历标题
    private String title;

}