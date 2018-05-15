package com.cook.dao;

import com.cook.entity.Hunt;
import org.springframework.stereotype.Repository;

@Repository
public interface HuntMapper {
    int deleteByPrimaryKey(String id);

    int insert(Hunt record);

    int insertSelective(Hunt record);

    Hunt selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Hunt record);

    int updateByPrimaryKey(Hunt record);
}