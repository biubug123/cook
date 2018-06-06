package com.ziheng.dto;

import lombok.Data;

/**
 * @description: 视频回调接受
 * @author: ziHeng
 * @create: 2018-06-04 15:11
 **/
@Data
public class VideoCallBackDto {

    private String Status;
    private String VideoId;
    private String EventType;
    private int Size;
    private String Definition;
    private String Fps;
    private double Duration;
    private String Bitrate;
    private boolean Encrypt;
    //播放地址
    private String FileUrl;
    private String Format;
    private String EventTime;
    //封面
    private String CoverUrl;
    private int Height;
    private int Width;


}
