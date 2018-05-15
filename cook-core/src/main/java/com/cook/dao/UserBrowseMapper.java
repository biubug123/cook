package com.cook.dao;

import com.cook.entity.UserBrowse;
import org.springframework.stereotype.Repository;

@Repository
public interface UserBrowseMapper {
    int deleteByPrimaryKey(String id);

    int insert(UserBrowse record);

    int insertSelective(UserBrowse record);

    UserBrowse selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(UserBrowse record);

    int updateByPrimaryKey(UserBrowse record);
}