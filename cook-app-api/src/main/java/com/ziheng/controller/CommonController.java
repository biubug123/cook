package com.ziheng.controller;

import com.cook.response.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * @description: 写死的Api
 * @author: ziHeng
 * @create: 2018-06-08 13:20
 **/
@RestController
@RequestMapping("/common")
@Api(value = "/common",tags = "搜索条件",description = "搜索条件暂时固定写死的api")
public class CommonController {

    @GetMapping("/salaryList")
    @ApiOperation(value = "工资，暂时固定写死")
    public ApiResponse salaryList(){
        List<String> result = new ArrayList<>();
        String[] salaryList = {"0-2000","2000-3000","3000-4000","4000-5000","5000-6000","6000-8000","8000-10000","10000-12000"};
        result.addAll(Arrays.asList(salaryList));
        return ApiResponse.ofSuccess(result);
    }

    @GetMapping("/foodTypeList")
    @ApiOperation(value = "菜系类型，暂时固定写死")
    public ApiResponse foodTypeList(){
        List<String> result = new ArrayList<>();
        String[] foodTypeList = {"粤菜","越菜","川菜","闽菜","特色菜"};
        Collections.addAll(result, foodTypeList);
        return ApiResponse.ofSuccess(result);
    }

    @GetMapping("/jobTypeList")
    @ApiOperation(value = "职业类型，暂时固定写死")
    public ApiResponse jobTypeList(){
        List<String> result = new ArrayList<>();
        String[] jobTypeList = {"不限","服务员","厨师","后厨","配菜","学徒","打杂","营养师"};
        Collections.addAll(result, jobTypeList);
        return ApiResponse.ofSuccess(result);
    }



}
