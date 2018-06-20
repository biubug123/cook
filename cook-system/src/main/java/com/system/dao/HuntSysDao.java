package com.system.dao;

import com.system.entity.Hunt;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HuntSysDao {

    List<Hunt> listHunt(@Param("userName")String userName, @Param("workArea")String workArea);
}
