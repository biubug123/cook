package com.system.controller;

import com.system.dao.RecruitSysDao;
import com.system.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.List;

@Controller
@RequestMapping("/system")
public class RecruitSysController {

    @Autowired
    private RecruitSysDao recruitSysDao;

    @ResponseBody
    @GetMapping("/listRecruit")
    public List<Recruit> listRecruit() {
        return recruitSysDao.listRecruit();
    }
}
