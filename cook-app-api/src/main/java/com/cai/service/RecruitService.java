package com.cai.service;

import com.cai.dto.*;

import java.util.List;
import java.util.TreeSet;

public interface RecruitService {

    //招聘列表
    TreeSet<RecruitDto> recruitList(Short conditionType, String conditionDetail);

    List<Recruit> listRecruit(String publisherId);

    //职位推荐
    TreeSet<JobRecommend> listJobRecommend(String jobName);

    int insertUserApply(UserApply userApply);

    RecruitDetail getRecruitDetail(String recruitId,Short recruitType);

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
