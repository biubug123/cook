package com.cai.service;

import com.cai.dto.*;

import java.util.List;

public interface RecruitService {

    List<Recruit> listRecruit(String publisherId);

    List<JobRecommend> listJobRecommend(String jobName);

    int insertUserApply(UserApply userApply);

    List<Recruit2> listRecruit2(String conditionType, String conditionDetail);

    RecruitDetail getRecruitDetail(String id);

    //代理发起招聘
    Integer insertRecruitByProxy(String name,
                                 String contactWay,
                                 String workArea,
                                 String address,
                                 String userId,
                                 String salary,
                                 Integer recruitPeopleNum,
                                 String description,
                                 String foodTypeId,
                                 String welfareList,
                                 String jobId,
                                 String education,
                                 String experienceRequire,
                                 String ageRequire);

    //企业发起招聘
    Integer insertRecruitByEnterprise(String enterpriseId,
                                      String salary,
                                      Integer recruitPeopleNum,
                                      String description,
                                      String foodTypeId,
                                      String welfareList,
                                      String jobId,
                                      String education,
                                      String experienceRequire,
                                      String ageRequire);
}
