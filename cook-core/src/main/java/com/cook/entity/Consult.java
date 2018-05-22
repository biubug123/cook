package com.cook.entity;

import lombok.Data;

@Data
public class Consult {

    private String id;

    //文章类型 0:图文 1:视频
    private Short articleType;

    //咨询类型 (0:饮食文化,1:日常记录)
    private Short consultType;

    //发布日期
    private Long publishDate;

    private String userId;

    private String articleId;

    //发布者名称
    private String publisherName;

    public Consult() {
    }

    public Consult(String id, Short articleType, Short consultType, Long publishDate, String userId, String articleId, String publisherName) {
        this.id = id;
        this.articleType = articleType;
        this.consultType = consultType;
        this.publishDate = publishDate;
        this.userId = userId;
        this.articleId = articleId;
        this.publisherName = publisherName;
    }
}