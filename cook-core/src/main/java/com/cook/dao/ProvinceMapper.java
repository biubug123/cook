package com.cook.dao;

import com.cook.entity.Province;
import org.springframework.stereotype.Repository;

@Repository
public interface ProvinceMapper {
    int deleteByPrimaryKey(String code);

    int insert(Province record);

    int insertSelective(Province record);

    Province selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(Province record);

    int updateByPrimaryKey(Province record);
}