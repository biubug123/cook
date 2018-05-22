package com.cook.entity;

import lombok.Data;

@Data
public class UserCollect {

    private String id;

    //0:招聘的职位 1:求职的职位 2:咨询的收藏
    private Short collectType;

    //收藏日期
    private Long collectDate;

    private String userId;

    //内容id
    private String contentId;

    public UserCollect() {
    }

    public UserCollect(String id, Short collectType, Long collectDate, String userId, String contentId) {
        this.id = id;
        this.collectType = collectType;
        this.collectDate = collectDate;
        this.userId = userId;
        this.contentId = contentId;
    }
}