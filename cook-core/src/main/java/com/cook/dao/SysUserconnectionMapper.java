package com.cook.dao;

import com.cook.entity.SysUserconnection;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SysUserconnectionMapper {

    List<SysUserconnection> selectByUserId(@Param("userId") String userId);

    int deleteByUserIdAndProviderId(@Param("userId") String userId,@Param("providerId") String providerId);

    int deleteByPrimaryKey(SysUserconnection key);

    int insert(SysUserconnection record);

    int insertSelective(SysUserconnection record);

    SysUserconnection selectByPrimaryKey(SysUserconnection key);

    int updateByPrimaryKeySelective(SysUserconnection record);

    int updateByPrimaryKey(SysUserconnection record);
}