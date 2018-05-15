package com.cook.dao;

import com.cook.entity.Proxy;
import org.springframework.stereotype.Repository;

@Repository
public interface ProxyMapper {
    int deleteByPrimaryKey(String id);

    int insert(Proxy record);

    int insertSelective(Proxy record);

    Proxy selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Proxy record);

    int updateByPrimaryKey(Proxy record);
}