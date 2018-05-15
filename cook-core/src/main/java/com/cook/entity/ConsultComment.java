package com.cook.entity;

import lombok.Data;

@Data
public class ConsultComment {

    private String id;

    //内容
    private String content;

    //点赞数
    private Integer admireCount;

    //评论者id
    private String commentUserId;

    //资讯id
    private String consultId;

    //评论日期
    private Long commentDate;


}