package com.system.controller;

import com.system.dao.ConsultSysDao;
import com.system.entity.Consult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@RequestMapping("/system")
@Controller
public class ConsultSysController {

    @Autowired
    private ConsultSysDao consultSysDao;

    @GetMapping("/listConsult")
    @ResponseBody
    public List<Consult> listConsult(@RequestParam("articleId")String articleId, @RequestParam("articleType")int articleType) {
        return consultSysDao.listConsult(articleId, articleType);
    }
}
