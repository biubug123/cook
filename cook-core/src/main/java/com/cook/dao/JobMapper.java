package com.cook.dao;

import com.cook.entity.Job;
import org.springframework.stereotype.Repository;

@Repository
public interface JobMapper {
    int deleteByPrimaryKey(String id);

    int insert(Job record);

    int insertSelective(Job record);

    Job selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Job record);

    int updateByPrimaryKey(Job record);
}