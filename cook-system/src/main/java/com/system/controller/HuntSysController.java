package com.system.controller;

import com.system.dao.HuntSysDao;
import com.system.entity.Hunt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/system")
public class HuntSysController {

    @Autowired
    private HuntSysDao huntSysDao;

    @ResponseBody
    @GetMapping("/listHunt")
    public List<Hunt> listHunt() {
        return huntSysDao.listHunt();
    }
}
