package com.cook.dao;

import com.cook.entity.ConsultComment;
import org.springframework.stereotype.Repository;

@Repository
public interface ConsultCommentMapper {
    int deleteByPrimaryKey(String id);

    int insert(ConsultComment record);

    int insertSelective(ConsultComment record);

    ConsultComment selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ConsultComment record);

    int updateByPrimaryKey(ConsultComment record);
}