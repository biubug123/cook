package com.cook.dao;

import com.cook.entity.City;
import org.springframework.stereotype.Repository;

@Repository
public interface CityMapper {
    int deleteByPrimaryKey(String code);

    int insert(City record);

    int insertSelective(City record);

    City selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(City record);

    int updateByPrimaryKey(City record);
}