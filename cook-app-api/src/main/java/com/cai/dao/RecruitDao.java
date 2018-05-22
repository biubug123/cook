package com.cai.dao;

import com.cai.dto.*;
import com.cook.entity.Welfare;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface RecruitDao {
    List<Recruit> listRecruit(@Param("publisherId")String publisherId);

    List<JobRecommend> listJobRecommend(@Param("jobName")String jobName);

    Publisher getPublisher(@Param("id")String id, @Param("type")int type);

//    int insertUserApply(@Param("id")String id, @Param("date")long date, @Param("userId")String userId
//            , @Param("recruitId")String recruitId, @Param("recruitType")String recruitType
//            , @Param("publisherId")String publisherId, @Param("publisherName")String publisherName
//            , @Param("foodTypeName")String foodTypeName, @Param("jobName")String jobName
//    );
    int insertUserApply(UserApply userApply);

    List<String> listWelfare(@Param("id")String id);

    List<Recruit2> listRecruit2(@Param("conditionType")String conditionType, @Param("conditionDetail")String conditionDetail);

    RecruitDetail getRecruitDetail(@Param("id")String id);
}
