package com.ziheng.service;

public interface ConsultPostService {


    //用户发表图文资讯
    Integer releaseImageTextConsult(Short consultType,
                                    String userId,
                                    String publisherName,
                                    String title,
                                    String content,
                                    String imageName);

    //用户发表Video资讯
    Integer releaseVideoConsult(Short consultType,
                                String userId,
                                String publisherName,
                                String title,
                                String imageName,
                                String videoImgName,
                                String videoUrl,
                                String content
                                );


}
