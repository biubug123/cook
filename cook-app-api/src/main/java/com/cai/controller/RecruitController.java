package com.cai.controller;

import com.cai.dto.*;
import com.cai.service.RecruitService;
import com.cook.dao.EnterpriseMapper;
import com.cook.entity.Enterprise;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ziheng.dto.userGet.Resume;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@RestController
@Api(value = "/recruit",description = "招聘Api")
public class RecruitController {

    private RecruitService recruitService;


    public RecruitController(RecruitService recruitService) {
        this.recruitService = recruitService;
    }

    @GetMapping("/recruit/{publisherId}")
    @ApiOperation(value = "招聘详情(多个职位)",response = Recruit.class,responseContainer = "List")
    public ApiResponse listRecruit(@PathVariable("publisherId")String publisherId) {
        return ApiResponse.ofSuccess(recruitService.listRecruit(publisherId));
    }

    @GetMapping("/recruit/jobRecommend")
    @ApiOperation(value = "职位推荐",response = JobRecommend.class,responseContainer = "List")
    public ApiResponse listJobRecommend(@RequestParam("jobName")String jobName) {
        return ApiResponse.ofSuccess(recruitService.listJobRecommend(jobName));
    }

    @PostMapping("/userApplyRecruit")
    @ApiOperation(value = "用户申请招聘")
    public ApiResponse insertUserApply(@RequestBody UserApply userApply) {
        return ApiResponse.ofSuccess(recruitService.insertUserApply(userApply));
    }

    @GetMapping("/recruit/listByType")
    @ApiOperation(value = "招聘列表(分页)",response = RecruitDto.class,responseContainer = "List")
    public ApiResponse listRecruit2(@RequestParam(value = "pageNum", defaultValue = "0") Integer pageNum,
                                    @ApiParam(value = "区域-0  职位-1 薪资-2 招聘方-3 发布时间-4 工作经验-5") @RequestParam("conditionType") Short type,
                                    @ApiParam(value = "条件内容") @RequestParam("conditionDetail") String conditionDetail) {
        // 分页查询单页面内容大小
        int pageSize = 10;
        PageHelper.startPage(pageNum, pageSize);
        List<RecruitDto> result = new ArrayList<RecruitDto>();
        result.addAll(recruitService.recruitList(type, conditionDetail));
        PageInfo<RecruitDto> pageInfo = new PageInfo<RecruitDto>(result);
        return ApiResponse.ofSuccess(pageInfo);
    }

    @GetMapping("/recruit/getDetail")
    @ApiOperation(value = "招聘详情",response = RecruitDetail.class)
    public ApiResponse listRecruitDetail(@RequestParam("recruitId")String recruitId,
                                         @RequestParam("recruitType")Short recruitType) {
        return  ApiResponse.ofSuccess(recruitService.getRecruitDetail(recruitId,recruitType));
    }




    /**
     * @Description: 代理发起招聘
     * @Author: ziHeng
     * @Date: 2018/5/19 下午2:45
     * @Param: [name, contactWay, workArea, address, userId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/recruitByProxy")
    @ApiOperation(value = "代理发起招聘")
    public ApiResponse proxyByRecruit(@RequestParam String name,
                                      @RequestParam String contactWay,
                                      @RequestParam String workArea,
                                      @RequestParam String address,
                                      @RequestParam String userId,
                                      @RequestParam String salary,
                                      @RequestParam Integer recruitPeopleNum,
                                      @RequestParam String description,
                                      @RequestParam String foodTypeId,
                                      @RequestParam String welfareList,
                                      @RequestParam String jobId,
                                      @RequestParam String education,
                                      @RequestParam String experienceRequire,
                                      @RequestParam String ageRequire){

        return ApiResponse.ofSuccess(recruitService.insertRecruitByProxy(name,contactWay,workArea,address,userId,salary,recruitPeopleNum,description,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire));
    }

    /**
     * @Description: 企业发起招聘
     * @Author: ziHeng
     * @Date: 2018/5/19 下午2:48
     * @Param: [enterpriseId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/recruitByEnterprise")
    @ApiOperation(value = "企业发起招聘")
    public ApiResponse enterpriseRecruit(@RequestParam String enterpriseId,
                                         @RequestParam String salary,
                                         @RequestParam Integer recruitPeopleNum,
                                         @RequestParam String description,
                                         @RequestParam String foodTypeId,
                                         @RequestParam String welfareList,
                                         @RequestParam String jobId,
                                         @RequestParam String education,
                                         @RequestParam String experienceRequire,
                                         @RequestParam String ageRequire){

        return ApiResponse.ofSuccess(recruitService.insertRecruitByEnterprise(enterpriseId,salary,recruitPeopleNum,description,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire));
    }

}
