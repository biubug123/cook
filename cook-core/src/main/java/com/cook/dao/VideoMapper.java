package com.cook.dao;

import com.cook.entity.Video;
import org.springframework.stereotype.Repository;

@Repository
public interface VideoMapper {
    int deleteByPrimaryKey(String id);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);
}