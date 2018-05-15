package com.cook.entity;


import lombok.Data;

@Data
public class CommentUserAdmire {

    private String id;

    //点赞评论的id
    private String commentId;

    private String userId;

    //点赞日期
    private Long admireDate;

}