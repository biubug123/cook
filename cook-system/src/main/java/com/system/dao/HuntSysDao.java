package com.system.dao;

import com.system.entity.Hunt;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HuntSysDao {

    List<Hunt> listHunt();
}
