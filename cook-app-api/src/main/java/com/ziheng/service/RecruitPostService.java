package com.ziheng.service;

/**
 * @description: 招聘Post
 * @author: ziHeng
 * @create: 2018-05-18 11:05
 **/
public interface RecruitPostService {

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
