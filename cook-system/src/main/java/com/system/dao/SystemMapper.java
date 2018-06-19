package com.system.dao;

import com.system.dto.FoodTypeDto;
import com.system.dto.JobTypeDto;
import com.system.dto.UserDto;
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

}
