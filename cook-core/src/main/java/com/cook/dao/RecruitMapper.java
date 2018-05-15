package com.cook.dao;

import com.cook.entity.Recruit;
import org.springframework.stereotype.Repository;

@Repository
public interface RecruitMapper {
    int deleteByPrimaryKey(String id);

    int insert(Recruit record);

    int insertSelective(Recruit record);

    Recruit selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Recruit record);

    int updateByPrimaryKey(Recruit record);
}