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
    List<Consult> consultList(@Param("userId") String userId,@Param("articleType") Short articleType);

    //获取用户的投递申请
    UserApply getUserApply(@Param("userId") String userId);

    //获取用户的代招管理列表
    List<Job> listProxy(@Param("userId") String userId);

    //type: "collect:收藏,browse:浏览"
    //咨询收藏和浏览
    List<Consult> consultCollectOrBrowseList(@Param("userId") String userId,@Param("articleType") Short articleType,@Param("type") String type);

    //职位收藏和浏览 jobType: 0 - 招聘的职位: 1 - 求职的职位  recruitType: 0 - 代招 1-企业
    List<Job> jobCollectOrBroseList(@Param("userId") String userId, @Param("jobType") Short jobType,@Param("recruitType") Short recruitType,@Param("type") String type);




}
