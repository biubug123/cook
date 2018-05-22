package com.cai.service.Impl;

import com.cai.dao.RecruitDao;
import com.cai.dto.*;
import com.cai.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class RecruitServiceImpl implements RecruitService {

    @Autowired
    private RecruitDao recruitDao;

    @Override
    public List<Recruit> listRecruit(String publisherId) {
        return recruitDao.listRecruit(publisherId);
    }

    /**
     * 模糊查询职位
     * @param jobName
     * @return
     */
    @Override
    public List<JobRecommend> listJobRecommend(String jobName) {
        List<JobRecommend> recommendList = recruitDao.listJobRecommend(jobName);
        for(JobRecommend jobRecommend : recommendList) {
            // 根据同个id出现次数判断是否为多个岗位招聘。
            if(recruitDao.listRecruit(jobRecommend.getRecruitId()).size() > 1) {
                jobRecommend.setIsMoreJob(1);
            } else {
                jobRecommend.setIsMoreJob(0);
            }
            // 招聘类型分为企业和代招，据此到不同表查询名字。
            Publisher publisher = recruitDao.getPublisher(jobRecommend.getPublisherId(), jobRecommend.getRecruitType());
            jobRecommend.setPublisherName(publisher.getName());
        }
        return  recommendList;
    }

    /**
     * 插入用户求职申请
     * @param userApply
     * @return
     */
    @Override
    public int insertUserApply(UserApply userApply) {
        String id = UUID.randomUUID().toString();

        long applyDate = new Date().getTime() * 1000;

        userApply.setId(id);

        userApply.setApplyDate(applyDate);

        return recruitDao.insertUserApply(userApply);
    }

    /**
     * 招聘列表分页
     * @param conditionType 查询条件
     * @param conditionDetail 条件的具体内容
     * @return
     */
    @Override
    public List<Recruit2> listRecruit2(String conditionType, String conditionDetail) {
        List<Recruit2> list = recruitDao.listRecruit2(conditionType, conditionDetail);

        // 根据同id获取招聘数量是否大于1决定是否为多岗位
        for(Recruit2 recruit2 : list) {
            if(recruitDao.listRecruit(recruit2.getRecruitId()).size() > 1) {
                recruit2.setIsMoreJob(1);
            } else {
                recruit2.setIsMoreJob(0);
            }
            // 根据招聘类型获取相对应发布者名称和工作区域
            Publisher publisher = recruitDao.getPublisher(recruit2.getPublisherId(),recruit2.getRecruitType());
            recruit2.setPublisherName(publisher.getName());
            recruit2.setPublisherWorkArea(publisher.getWorkArea());
            // 默认为List<String>的数据, 获取福利名称
            for(String id : recruit2.getWelfareList()) {
                List<String> nameList = recruitDao.listWelfare(id);
                recruit2.setWelfareList(nameList);
            }
        }
        return list;
    }

    /**
     *  通过id查询招聘详情
     * @param id
     * @return
     */
    @Override
    public RecruitDetail getRecruitDetail(String id) {
        RecruitDetail recruitDetail = recruitDao.getRecruitDetail(id);
        if(recruitDetail != null) {
            // 通过招聘详情中的id和type查询出发布人信息
            Publisher publisher = recruitDao.getPublisher(recruitDetail.getPublisherId(), recruitDetail.getRecruitType());

            // 将发布人信息绑定到详情中
            recruitDetail.setPublisherName(publisher.getName());
            recruitDetail.setAddress(publisher.getAddress());
            recruitDetail.setContactWay(publisher.getContactWay());
            recruitDetail.setWorkArea(publisher.getWorkArea());

            // 通过详情中的福利id查询出福利的名称信息存入详情中
            for(String welfareId: recruitDetail.getWelfareIdList()) {
                List<String> nameList = recruitDao.listWelfare(welfareId);
                recruitDetail.setWelfareIdList(nameList);
            }
        }
        return recruitDetail;
    }
}
