package com.cook.dao;

import com.cook.entity.WorkExperience;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkExperienceMapper {
    int deleteByPrimaryKey(String id);

    int insert(WorkExperience record);

    int insertSelective(WorkExperience record);

    WorkExperience selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(WorkExperience record);

    int updateByPrimaryKey(WorkExperience record);
}