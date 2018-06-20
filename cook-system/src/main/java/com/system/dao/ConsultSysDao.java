package com.system.dao;

import com.system.entity.Consult;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ConsultSysDao {
    List<Consult> listConsult(@Param("articleId")String articleId, @Param("articleType")int articleType);
}
