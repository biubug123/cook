package com.ziheng.service.serviceImpl;

import com.cook.dao.HuntMapper;
import com.cook.dao.ResumeMapper;
import com.cook.entity.Hunt;
import com.cook.entity.Resume;
import com.ziheng.service.HuntPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

/**
 * @description: 求职
 * @author: ziHeng
 * @create: 2018-05-18 17:06
 **/
@Service
public class HuntServiceImpl implements HuntPostService{

    private ResumeMapper resumeMapper;

    private HuntMapper huntMapper;

    public HuntServiceImpl(ResumeMapper resumeMapper, HuntMapper huntMapper) {
        this.resumeMapper = resumeMapper;
        this.huntMapper = huntMapper;
    }


    /**
      * @Description: 用户新简历
      * @Author: ziHeng
      * @Date: 2018/5/18 下午9:36
      * @Param: [workYear, workExperienceId, education, userId, title]
      * @return: java.lang.Integer
      */
    @Override
    public Integer insertResume(Short workYear,
                                String workExperienceId,
                                String education,
                                String userId,
                                String title) {

        String id = UUID.randomUUID().toString();
        Resume resume = new Resume(id,workYear,workExperienceId,education,userId,title);
        return resumeMapper.insert(resume);
    }

    /**
      * @Description: 用户发起求职
      * @Author: ziHeng
      * @Date: 2018/5/18 下午9:37
      * @Param: [salary, resumeId, jobId, foodTypeId, workArea]
      * @return: java.lang.Integer
      */
    @Override
    public Integer insertHunt(String salary,
                              String resumeId,
                              String jobId,
                              String foodTypeId,
                              String workArea) {
        String id = UUID.randomUUID().toString();
        Long huntDate = new Date().getTime()/1000;
        Hunt hunt = new Hunt(id,salary,0,resumeId,jobId,foodTypeId,huntDate,workArea);
        return huntMapper.insert(hunt);
    }
}
