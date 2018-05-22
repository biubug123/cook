package com.cook.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class ImageText {

    private String id;

    //标题
    private String title;

    //图片名称
    @ApiModelProperty(value = "图片名称 用逗号(,)号连接")
    private String imageName;

    //内容
    private String content;

    //点赞数量
    private Integer admireCount;

    public ImageText() {
    }

    public ImageText(String id, String title, String imageName, String content, Integer admireCount) {
        this.id = id;
        this.title = title;
        this.imageName = imageName;
        this.content = content;
        this.admireCount = admireCount;
    }
}