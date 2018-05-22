package com.cai.controller;

import com.cai.dto.Recruit2;
import com.cai.dto.UserApply;
import com.cai.service.RecruitService;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller

public class RecruitController {

    @Autowired
    private RecruitService recruitService;

    @GetMapping("/recruit")
    @ResponseBody
    public ApiResponse listRecruit(@RequestParam("publisherId")String publisherId) {
        return ApiResponse.ofSuccess(recruitService.listRecruit(publisherId));
    }

    @GetMapping("/recruit/jobRecommend")
    @ResponseBody
    public ApiResponse listJobRecommend(@RequestParam("jobName")String jobName) {
        return ApiResponse.ofSuccess(recruitService.listJobRecommend(jobName));
    }

    @PostMapping("/userApplyRecruit")
    @ResponseBody
    public ApiResponse insertUserApply(UserApply userApply) {
        return ApiResponse.ofSuccess(recruitService.insertUserApply(userApply));
    }

    @GetMapping("/recruit/listByType")
    @ResponseBody
    public ApiResponse listRecruit2(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum, @RequestParam("conditionType") String type, @RequestParam("conditionDetail") String conditionDetail) {
        // 分页查询单页面内容大小
        int pageSize = 10;
        PageHelper.startPage(pageNum, pageSize);
        List<Recruit2> recruit2List = recruitService.listRecruit2(type, conditionDetail);
        PageInfo<Recruit2> pageInfo = new PageInfo<Recruit2>(recruit2List);

        return ApiResponse.ofSuccess(pageInfo);
    }

    @GetMapping("/recruit/getDetail/{recruitId}")
    @ResponseBody
    public ApiResponse listRecruitDetail(@PathVariable("recruitId")String recruitId) {
        return  ApiResponse.ofSuccess(recruitService.getRecruitDetail(recruitId));
    }
}
