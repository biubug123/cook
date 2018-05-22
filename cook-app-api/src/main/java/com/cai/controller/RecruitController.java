package com.cai.controller;

import com.cai.dto.Recruit2;
import com.cai.dto.UserApply;
import com.cai.service.RecruitService;
import com.cook.dao.EnterpriseMapper;
import com.cook.entity.Enterprise;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/recruit")
@Api(value = "/recruit",description = "招聘发布Api")
public class RecruitController {

    private RecruitService recruitService;


    public RecruitController(RecruitService recruitService) {
        this.recruitService = recruitService;
    }

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
