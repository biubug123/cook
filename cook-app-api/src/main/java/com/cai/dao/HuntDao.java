package com.cai.dao;

import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HuntDao {
    List<Hunt> listHunt(@Param("conditionType")String conditionType, @Param("conditionDetail")String conditionDetail);

    HuntDetail getHuntDetailByResumeId(@Param("resumeId")String resumeId);

    List<HuntDetail> listHuntDetailByKeyword(@Param("jobRecommend")String jobRecommend);
}
