package com.cook.dao;

import com.cook.entity.Region;
import org.springframework.stereotype.Repository;

@Repository
public interface RegionMapper {
    int deleteByPrimaryKey(String code);

    int insert(Region record);

    int insertSelective(Region record);

    Region selectByPrimaryKey(String code);

    int updateByPrimaryKeySelective(Region record);

    int updateByPrimaryKey(Region record);
}