package com.cook.dao;

import com.cook.entity.CommentUserAdmire;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentUserAdmireMapper {
    int insert(CommentUserAdmire record);

    int insertSelective(CommentUserAdmire record);
}