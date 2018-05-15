package com.cook.dao;

import com.cook.entity.ImageText;
import org.springframework.stereotype.Repository;

@Repository
public interface ImageTextMapper {
    int deleteByPrimaryKey(String id);

    int insert(ImageText record);

    int insertSelective(ImageText record);

    ImageText selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ImageText record);

    int updateByPrimaryKey(ImageText record);
}