package com.cook.dao;

import com.cook.entity.Enterprise;
import org.springframework.stereotype.Repository;

@Repository
public interface EnterpriseMapper {
    int deleteByPrimaryKey(String id);

    int insert(Enterprise record);

    int insertSelective(Enterprise record);

    Enterprise selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Enterprise record);

    int updateByPrimaryKey(Enterprise record);
}