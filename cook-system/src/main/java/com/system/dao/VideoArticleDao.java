package com.system.dao;

import com.system.entity.VideoArticle;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface VideoArticleDao {

    List<VideoArticle> listVideoArticle();
}
