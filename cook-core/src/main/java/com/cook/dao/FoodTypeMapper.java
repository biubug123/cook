package com.cook.dao;

import com.cook.entity.FoodType;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodTypeMapper {
    int deleteByPrimaryKey(String id);

    int insert(FoodType record);

    int insertSelective(FoodType record);

    FoodType selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(FoodType record);

    int updateByPrimaryKey(FoodType record);
}