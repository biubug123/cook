package com.system.controller;

import com.system.dao.VideoArticleDao;
import com.system.entity.VideoArticle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/system")
public class VideoArticleController {

    @Autowired
    private VideoArticleDao videoArticleDao;

    @ResponseBody
    @GetMapping("/listVideoArticle")
    public List<VideoArticle> listVideoArticle() {
        return  videoArticleDao.listVideoArticle();
    }
}
