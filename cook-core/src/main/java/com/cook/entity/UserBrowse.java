package com.cook.entity;

import lombok.Data;

@Data
public class UserBrowse {

    private String id;

    //0:招聘 1:求职 2:资讯
    private Short browseType;

    //最后浏览日期
    private Long lastBrowseDate;

    private String userId;

    //内容id
    private String contentId;

    public UserBrowse() {
    }

    public UserBrowse(String id, Short browseType, Long lastBrowseDate, String userId, String contentId) {
        this.id = id;
        this.browseType = browseType;
        this.lastBrowseDate = lastBrowseDate;
        this.userId = userId;
        this.contentId = contentId;
    }
}