package com.cook.entity;

import lombok.Data;

@Data
public class ImageText {

    private String id;

    //标题
    private String title;

    //图片名称
    private String imageName;

    //内容
    private String content;

    //点赞数量
    private Integer admireCount;

}