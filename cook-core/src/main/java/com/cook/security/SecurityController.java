package com.cook.security;

import com.cook.response.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 安全处理url
 * @author: ziHeng
 * @create: 2018-05-24 09:59
 **/
@RestController
@RequestMapping("/security")
public class SecurityController {

    /**
      * @Description: 用户未登录,返回错误信息让前端引导去登录页面
      * @Author: ziHeng
      * @Date: 2018/5/24 上午10:05
      * @Param: []
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/toLoginPage")
    public ApiResponse toLoginPage(){
        return ApiResponse.ofError(ApiResponse.Status.NOT_LOGIN);
    }





}
