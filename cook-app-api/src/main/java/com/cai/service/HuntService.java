package com.cai.service;

import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HuntService {
    List<Hunt> listHunt(Short conditionType, String conditionDetail);

    HuntDetail getHuntDetailByResumeId(String resumeId);

    List<HuntDetail> listHuntDetailByKeyword(@Param("jobRecommend")String jobRecommend);


}
