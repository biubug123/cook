package com.cook.dao;

import com.cook.entity.Street;
import org.springframework.stereotype.Repository;

@Repository
public interface StreetMapper {
    int deleteByPrimaryKey(String code);

    int insert(Street record);

    int insertSelective(Street record);

    Street selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKey(Street record);
}