package com.cai.controller;

import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import com.cai.service.HuntService;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hunt")
public class HuntController {

    @Autowired
    private HuntService huntService;

    @GetMapping(value =  "/listByType")
    @ResponseBody
    public ApiResponse listHunt(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum, @RequestParam("conditionType") String type, @RequestParam("conditionDetail") String conditionDetail) {
        // 分页查询单页面内容大小
        int pageSize = 10;
        PageHelper.startPage(pageNum, pageSize);
        List<Hunt> huntList = huntService.listHunt(type, conditionDetail);
        PageInfo<Hunt> pageInfo = new PageInfo<Hunt>(huntList);
        return ApiResponse.ofSuccess(pageInfo);
    }

    @GetMapping(value = "/getUser/{resumeId}")
    @ResponseBody
    public ApiResponse getHuntDetailByResumeId(@PathVariable("resumeId")String resumeId) {
        HuntDetail huntDetail = huntService.getHuntDetailByResumeId(resumeId);

        return ApiResponse.ofSuccess(huntDetail);
    }

    @GetMapping(value = "/jobRecommend")
    @ResponseBody
    public ApiResponse listHuntByKeyword(@RequestParam("jobName")String jobName) {
        return ApiResponse.ofSuccess(huntService.listHuntDetailByKeyword(jobName));
    }
}
