package com.ziheng.service;

import com.cook.response.ApiResponse;
import com.ziheng.dto.userGet.Consult;
import com.ziheng.dto.userGet.Resume;

import java.util.List;
import java.util.TreeSet;

/**
 * @description: get用户业务层
 * @author: ziHeng
 * @create: 2018-05-16 17:00
 **/
public interface UserGetService {

    //用户的简历列表
    List<Resume> resumeList(String userId);

    //获取用户发布的资讯
    TreeSet<Consult> consultList(String userId);


    //根据类型获取收藏列表
    ApiResponse collectListByType(String userId, Short collectType);

    //根据类型获取浏览列表
    ApiResponse browseListByType(String userId, Short collectType);

}
