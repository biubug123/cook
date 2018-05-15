package com.cook.dao;

import com.cook.entity.SysUserInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface SysUserInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysUserInfo record);

    int insertSelective(SysUserInfo record);

    SysUserInfo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUserInfo record);

    int updateByPrimaryKey(SysUserInfo record);
}