package com.cook.dao;

import com.cook.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SysUserMapper {

    //手机号查询用户名和密码
    SysUser userByPhone(@Param("phone") String phone);

    //账号查询用户名和密码
    SysUser userByAccountNum(@Param("accountNum") String AccountNum);

    int deleteByPrimaryKey(String id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);
}