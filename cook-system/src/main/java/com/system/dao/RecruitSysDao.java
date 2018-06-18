package com.system.dao;

import com.system.entity.Recruit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface RecruitSysDao {

    List<Recruit> listRecruit();
}
