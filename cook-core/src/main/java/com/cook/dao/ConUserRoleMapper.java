package com.cook.dao;

import com.cook.entity.ConUserRole;
import org.springframework.stereotype.Repository;

@Repository
public interface ConUserRoleMapper {
    int deleteByPrimaryKey(String id);

    int insert(ConUserRole record);

    int insertSelective(ConUserRole record);

    ConUserRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ConUserRole record);

    int updateByPrimaryKey(ConUserRole record);
}