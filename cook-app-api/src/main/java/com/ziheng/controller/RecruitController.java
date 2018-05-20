package com.ziheng.controller;

import com.cook.dao.EnterpriseMapper;
import com.cook.entity.Enterprise;
import com.cook.response.ApiResponse;
import com.ziheng.service.RecruitPostService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * @description: 招聘api
 * @author: ziHeng
 * @create: 2018-05-19 14:30
 **/
@RestController
@RequestMapping("/recruitApi")
public class RecruitController {

    private EnterpriseMapper enterpriseMapper;

    private RecruitPostService recruitPostService;

    public RecruitController(EnterpriseMapper enterpriseMapper, RecruitPostService recruitPostService) {
        this.enterpriseMapper = enterpriseMapper;
        this.recruitPostService = recruitPostService;
    }

    /** 
      * @Description: 新的企业用户
      * @Author: ziHeng
      * @Date: 2018/5/19 下午2:41
      * @Param: [name, contactWay, workArea, address]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/insertEnterprise")
    public ApiResponse insertEnterprise(@RequestParam("name") String name,
                                        @RequestParam("contactWay") String contactWay,
                                        @RequestParam("workArea") String workArea,
                                        @RequestParam("address") String address){
        Enterprise enterprise = new Enterprise(
                UUID.randomUUID().toString(),
                name,contactWay,
                workArea,address);

        return ApiResponse.ofSuccess(enterpriseMapper.insert(enterprise));
    }

    /**
      * @Description: 代理发起招聘
      * @Author: ziHeng
      * @Date: 2018/5/19 下午2:45
      * @Param: [name, contactWay, workArea, address, userId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/recruitByProxy")
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
        
        return ApiResponse.ofSuccess(recruitPostService.insertRecruitByProxy(name,contactWay,workArea,address,userId,salary,recruitPeopleNum,description,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire));
    }

    /**
      * @Description: 企业发起招聘
      * @Author: ziHeng
      * @Date: 2018/5/19 下午2:48
      * @Param: [enterpriseId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/recruitByEnterprise")
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

        return ApiResponse.ofSuccess(recruitPostService.insertRecruitByEnterprise(enterpriseId,salary,recruitPeopleNum,description,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire));
    }

    

}
