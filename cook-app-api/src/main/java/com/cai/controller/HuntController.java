package com.cai.controller;

import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import com.cai.service.HuntService;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/hunt")
@Api(value = "/hunt",description = "已测",tags = "求职Api")
public class HuntController {

    @Autowired
    private HuntService huntService;

    @GetMapping(value =  "/listByType")
    @ResponseBody
    @ApiOperation(value = "求职列表(分页)",response = Hunt.class,responseContainer = "List",notes = "测试参数(顺序): 1-1-收银员，1-0-广东省天河区")
    public ApiResponse listHunt(@RequestParam(value = "pageNum",required = false,defaultValue = "1") Integer pageNum,
                                @ApiParam(value = "0-区域  1-职位 2-薪资 3-招聘方 4-发布时间 5-工作经验")@RequestParam("conditionType") Short type,
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
    @ApiOperation(value = "求职详情",response = HuntDetail.class,notes = "测试参数: aa230318-096d-4a63-a94e-0a7e630da4de")
    public ApiResponse getHuntDetailByResumeId(@ApiParam(value = "简历id")@PathVariable("resumeId")String resumeId) {
        HuntDetail huntDetail = huntService.getHuntDetailByResumeId(resumeId);

        return ApiResponse.ofSuccess(huntDetail);
    }

    @GetMapping(value = "/jobRecommend")
    @ResponseBody
    @ApiOperation(value = "求职详情里的职位推荐",response = HuntDetail.class,responseContainer = "List",notes = "测试参数:收银")
    public ApiResponse listHuntByKeyword(@ApiParam(value = "职位名称")@RequestParam("jobName")String jobName) {
        return ApiResponse.ofSuccess(huntService.listHuntDetailByKeyword(jobName));
    }
}
