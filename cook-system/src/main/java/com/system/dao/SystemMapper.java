package com.system.dao;

import com.cook.entity.ConPermissionRole;
import com.cook.entity.SysPermission;
import com.cook.entity.SysRole;
import com.system.dto.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description: 系统dao
 * @author: ziHeng
 * @create: 2018-06-12 16:29
 **/
@Repository
public interface SystemMapper {

    //菜系列表
    List<FoodTypeDto> foodTypeList();

    //职位列表
    List<JobTypeDto> jobTypeList();

    //0:管理员 1:用户
    List<UserDto> sysUserList(@Param("type") int type);

    //根据用户id查询其资源
    List<SysRole> getResourceByRoleId(@Param("roleId") String roleId);

    //资源列表
    List<ResourceDto> listPermission();

    //
    List<SysRoleDto> sysRoleList();

    //根据permissionId引用次数
    Integer countPermissionId(@Param("permissionId") String permissionId);

    //插入con_role_permission
    Integer insertConRolePermission(@Param("rolePermissionList") List<ConPermissionRole> rolePermissionList);
}
