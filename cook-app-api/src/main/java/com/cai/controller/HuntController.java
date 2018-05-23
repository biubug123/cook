package com.cai.controller;

import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import com.cai.service.HuntService;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ziheng.dto.userGet.Resume;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hunt")
@Api(value = "/hunt",description = "求职Api")
public class HuntController {

    @Autowired
    private HuntService huntService;

    @GetMapping(value =  "/listByType")
    @ResponseBody
    @ApiOperation(value = "求职列表(分页)",response = Hunt.class,responseContainer = "List")
    public ApiResponse listHunt(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum,
                                @ApiParam(value = "区域-0  职位-1 薪资-2 招聘方-3 发布时间-4 工作经验-5")@RequestParam("conditionType") Short type,
                                @ApiParam(value = "区域id里的内容")@RequestParam("conditionDetail") String conditionDetail) {
        // 分页查询单页面内容大小
        int pageSize = 10;
        PageHelper.startPage(pageNum, pageSize);
        List<Hunt> huntList = huntService.listHunt(type, conditionDetail);
        PageInfo<Hunt> pageInfo = new PageInfo<Hunt>(huntList);
        return ApiResponse.ofSuccess(pageInfo);
    }

    @GetMapping(value = "/getUser/{resumeId}")
    @ResponseBody
    @ApiOperation(value = "求职详情",response = HuntDetail.class)
    public ApiResponse getHuntDetailByResumeId(@ApiParam(value = "简历id")@PathVariable("resumeId")String resumeId) {
        HuntDetail huntDetail = huntService.getHuntDetailByResumeId(resumeId);

        return ApiResponse.ofSuccess(huntDetail);
    }

    @GetMapping(value = "/jobRecommend")
    @ResponseBody
    @ApiOperation(value = "求职详情里的职位推荐",response = HuntDetail.class,responseContainer = "List")
    public ApiResponse listHuntByKeyword(@ApiParam(value = "职位名称")@RequestParam("jobName")String jobName) {
        return ApiResponse.ofSuccess(huntService.listHuntDetailByKeyword(jobName));
    }
}
