package com.cook.entity;

import lombok.Data;

@Data
public class Video {

    private String id;

    //标题
    private String title;

    //视频随机名 用于删除
    private String randomName;

    //播放次数
    private Integer playCount;

    //点赞数量
    private Integer admireCount;

    //图片名
    private String imgName;

    //视频路径
    private String videoUrl;

    //视频的图片名
    private String videoImgName;

    //视频内容描述
    private String content;

}