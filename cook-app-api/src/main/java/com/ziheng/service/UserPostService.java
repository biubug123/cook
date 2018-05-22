package com.ziheng.service;

import com.cook.entity.UserBrowse;
import com.cook.entity.UserCollect;

/**
 * @description: post用户业务层
 * @author: ziHeng
 * @create: 2018-05-17 11:48
 **/
public interface UserPostService {

    //新增招聘、求职、资讯收藏
    Integer insertUserCollect(String userId,
                              Short collectType,
                              String contentId);

    //新增招聘、求职、资讯浏览
    Integer insertUserBrowse(String userId,
                            Short collectType,
                            String contentId);


    //新用户
    Integer insertUser(String phone,
                       String password,
                       String sex,
                       String accountNum);

    //用户更新信息
    Integer updateUserBySelective(String userId,
                                  String userName,
                                  String sex,
                                  String headImgName,
                                  String signature,
                                  String address,
                                  Long birthDate);
}
