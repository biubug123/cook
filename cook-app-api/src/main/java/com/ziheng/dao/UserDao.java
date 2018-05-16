package com.ziheng.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.ziheng.dto.user.Hunt;
import com.ziheng.dto.user.Resume;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description: 用户相关dao
 * @author: ziHeng
 * @create: 2018-05-16 13:49
 **/
@Repository
public interface UserDao {

    //用户求职列表
    List<Hunt> huntList(@Param("userId") String userId);

    //用户的简历列表
    List<Resume> resumeList(@Param("userId") String userId);

    //新增招聘、求职、资讯收藏

    //新增招聘、求职、资讯浏览记录

    //删除用户简历

    //获取用户个人信息

    //获取用户发布的资讯

    //获取用户的投递申请

    //根据类型获取收藏列表

    //根据类型获取浏览历史列表
}
