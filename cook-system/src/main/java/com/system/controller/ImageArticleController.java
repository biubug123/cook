package com.system.controller;

import com.system.dao.ImageArticleDao;
import com.system.entity.ImageArticle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/system")
public class ImageArticleController {

    @Autowired
    private ImageArticleDao imageArticleDao;

    @GetMapping("/listImageArticle")
    @ResponseBody
    public List<ImageArticle> listImageArticle() {
        return imageArticleDao.listImageArticle();
    }
}
