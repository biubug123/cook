package com.ziheng.service.serviceImpl;

import com.cook.dao.ConsultMapper;
import com.cook.dao.ImageTextMapper;
import com.cook.dao.VideoMapper;
import com.cook.entity.Consult;
import com.cook.entity.ImageText;
import com.cook.entity.Video;
import com.cook.response.ApiResponse;
import com.ziheng.service.ConsultPostService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * @description: 资讯实现类
 * @author: ziHeng
 * @create: 2018-05-19 15:01
 **/

@Service
public class ConsultServiceImpl implements ConsultPostService{

    private ImageTextMapper imageTextMapper;

    private VideoMapper videoMapper;

    private ConsultMapper consultMapper;

    public ConsultServiceImpl(ImageTextMapper imageTextMapper, VideoMapper videoMapper, ConsultMapper consultMapper) {
        this.imageTextMapper = imageTextMapper;
        this.videoMapper = videoMapper;
        this.consultMapper = consultMapper;
    }

    private static Logger logger= LoggerFactory.getLogger(ConsultServiceImpl.class);


    @Override
    @Transactional
    /**
      * @Description: 用户发布图文资讯
      * @Author: ziHeng
      * @Date: 2018/5/19 下午3:47
      * @Param: [consultType:咨询类型 (0:饮食文化,1:日常记录), userId, publisherName, title, content, imageName]
      * @return: java.lang.Integer
      */
    public Integer releaseImageTextConsult(Short consultType,
                                           String userId,
                                           String publisherName,
                                           String title,
                                           String content,
                                           String imageName) {
        //图文id
        String articleId = UUID.randomUUID().toString();
        //新增图文
        ImageText imageText =new ImageText(articleId,title,imageName,content,0);
        int imageResult = imageTextMapper.insert(imageText);
        //插入图文成功后插入资讯
        if(imageResult>0){
            Consult consult = new Consult(UUID.randomUUID().toString(),(short)0,consultType,
                    new Date().getTime()/1000,userId,articleId,publisherName);
            return consultMapper.insert(consult);
        }

        throw new RuntimeException("发表图文资讯失败");
    }

    @Override
    @Transactional
    /**
      * @Description: 用户发布视频资讯
      * @Author: ziHeng
      * @Date: 2018/5/19 下午3:48
      * @Param: [consultType:咨询类型 (0:饮食文化,1:日常记录), userId, publisherName, title, imageName, videoImgName, content]
      * @return: java.lang.Integer
      */
    public Integer releaseVideoConsult(Short consultType,
                                       String userId,
                                       String publisherName,
                                       String title,
                                       String imageName,
                                       String videoImgName,
                                       String videoUrl,
                                       String content) {

        String articleId = UUID.randomUUID().toString();
        //上传视频到第三方
        String randomName = RandomStringUtils.randomAlphabetic(6);
        //上传后的视频地址

        Video video = new Video(articleId,title,randomName,0,0,imageName,videoUrl,videoImgName,content);
        //新增视频地址
        int videoResult = videoMapper.insert(video);
        if(videoResult > 0){
            Consult consult = new Consult(UUID.randomUUID().toString(),(short)1,consultType,
                    new Date().getTime()/1000,userId,articleId,publisherName);
            return consultMapper.insert(consult);
        }
        throw new RuntimeException("发表视频资讯失败");
    }
}
