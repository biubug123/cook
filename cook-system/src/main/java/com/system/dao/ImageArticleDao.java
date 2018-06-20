package com.system.dao;

import com.system.entity.ImageArticle;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ImageArticleDao {
    List<ImageArticle> listImageArticle();
}
