package com.cook.dao;

import com.cook.entity.Welfare;
import org.springframework.stereotype.Repository;

@Repository
public interface WelfareMapper {
    int deleteByPrimaryKey(String id);

    int insert(Welfare record);

    int insertSelective(Welfare record);

    Welfare selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Welfare record);

    int updateByPrimaryKey(Welfare record);
}