package com.cook.dao;

import com.cook.entity.UserRecruitApply;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRecruitApplyMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserRecruitApply record);

    int insertSelective(UserRecruitApply record);

    UserRecruitApply selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserRecruitApply record);

    int updateByPrimaryKey(UserRecruitApply record);
}