package com.cook.dao;

import com.cook.entity.ConPermissionRole;
import com.cook.entity.SysPermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ConPermissionRoleMapper {

    int deleteByPrimaryKey(String id);

    int insert(ConPermissionRole record);

    int insertSelective(ConPermissionRole record);

    ConPermissionRole selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ConPermissionRole record);

    int updateByPrimaryKey(ConPermissionRole record);
}