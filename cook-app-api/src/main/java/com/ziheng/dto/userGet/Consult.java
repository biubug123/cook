package com.ziheng.dto.userGet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

import java.util.List;

/**
 * @description: 发布的资讯实体类
 * @author: ziHeng
 * @create: 2018-05-16 18:08
 **/
@Data
public class Consult implements Comparable<Consult>{

    //资讯id
    private String consultId;

    //标题
    private String title;

    //发布者名称
    private String publisherName;

    //视频图片名
    private String videoImageName;

    //视频路径
    private String videoUrl;

    //播放次数
    private Integer playCount;

    //点赞次数
    private Integer admireCount;

    //发布日期
    private Long publishDate;

    @JsonIgnore
    private String imageNames;

    //咨询类型 (0:饮食文化,1:日常记录)
    private Short consultType;

    //文章类型 0:图文 1:视频
    private Short articleType;

    //图片名称集合
    private String[] imageName;



    @Override
    public int compareTo(Consult o) {
        return (int) (o.publishDate - this.publishDate);
    }
}
