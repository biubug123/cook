package com.cook.dao;

import com.cook.entity.Consult;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsultMapper {
    int deleteByPrimaryKey(String id);

    int insert(Consult record);

    int insertSelective(Consult record);

    Consult selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Consult record);

    int updateByPrimaryKey(Consult record);
}