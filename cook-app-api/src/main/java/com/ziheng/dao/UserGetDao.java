package com.ziheng.dao;

import com.ziheng.dto.userGet.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description: 用户相关dao
 * @author: ziHeng
 * @create: 2018-05-16 13:49
 **/
@Repository
public interface UserGetDao {

    //用户求职列表
    List<Hunt> huntList(@Param("userId") String userId);

    //用户的简历列表
    List<Resume> resumeList(@Param("userId") String userId);

    //获取用户个人信息
    User getUser(@Param("userId") String userId);

    //获取用户发布的资讯
    List<Consult> consultList(@Param("userId") String userId,@Param("consultType") Short consultType);

    //获取用户的投递申请
    UserApply getUserApply(@Param("userId") String userId);


    //根据类型获取收藏列表
    //咨询收藏
    List<Consult> consultCollectList(@Param("userId") String userId,@Param("consultType") Short consultType);
    //职位收藏
    List<Job> jobCollectList(@Param("userId") String userId, @Param("jobType") Short jobType);

    //根据类型获取浏览历史列表
    //资讯浏览
    List<Consult> consultBrowseList(@Param("userId") String userId,@Param("consultType") Short consultType);
    //职位浏览
    List<Job> jobBrowseList(@Param("userId") String userId, @Param("jobType") Short jobType);


}
