package com.cook.dao;

import com.cook.entity.UserCollect;
import org.springframework.stereotype.Repository;

@Repository
public interface UserCollectMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserCollect record);

    int insertSelective(UserCollect record);

    UserCollect selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserCollect record);

    int updateByPrimaryKey(UserCollect record);
}