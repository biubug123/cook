package com.cai.service;

import com.cai.dto.*;

import java.util.List;

public interface RecruitService {

    List<Recruit> listRecruit(String publisherId);

    List<JobRecommend> listJobRecommend(String jobName);

    int insertUserApply(UserApply userApply);

    List<Recruit2> listRecruit2(String conditionType, String conditionDetail);

    RecruitDetail getRecruitDetail(String id);

}
