package com.cai.dao;

import com.cai.dto.*;
import com.cook.entity.Welfare;
import org.apache.catalina.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.TreeSet;

@Mapper
@Repository
public interface RecruitDao {

    //获取招聘列表
    List<RecruitDto> listRecruitDtoByType(@Param("conditionType")Short conditionType, @Param("conditionDetail")String conditionDetail, @Param("recruitType") Short recruitType);

    //发布者获取招聘列表
    List<Recruit> listRecruit(@Param("publisherId")String publisherId);

    //职位推荐
    List<JobRecommend> listJobRecommend(@Param("jobName")String jobName,@Param("recruitType") Short recruitType);

    Publisher getPublisher(@Param("id")String id, @Param("type")int type);

    List<String> listWelfare(@Param("id")String id);

    RecruitDetail getRecruitDetail(@Param("recruitId")String recruitId,@Param("recruitType") Short recruitType);
}
