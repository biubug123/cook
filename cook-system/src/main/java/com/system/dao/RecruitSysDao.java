package com.system.dao;

import com.system.entity.Recruit;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RecruitSysDao {

    List<Recruit> listRecruit(@Param("jobName")String jobName, @Param("publisherName")String publisherName);
}
