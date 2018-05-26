package com.ziheng.controller;

import com.cook.response.ApiResponse;
import com.ziheng.service.ConsultPostService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 资讯api
 * @author: ziHeng
 * @create: 2018-05-20 15:44
 **/

@RestController
@RequestMapping("/userConsult")
@Api(value = "/userConsult",description = "已测",tags = "资讯发布Api")
public class UserConsultController {

    private ConsultPostService consultPostService;

    public UserConsultController(ConsultPostService consultPostService) {
        this.consultPostService = consultPostService;
    }

    /**
      * @Description: 用户发布图文资讯
      * @Author: ziHeng
      * @Date: 2018/5/20 下午4:45
      * @Param: [consultType, userId, publisherName, title, content, imageName]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/releaseImageTextConsult")
    @ApiOperation(value = "用户发布图文资讯")
    public ApiResponse releaseImageTextConsult(@RequestParam Short consultType,
                                               @RequestParam String publisherName,
                                               @RequestParam String title,
                                               @RequestParam String content,
                                               @RequestParam String imageName){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(consultPostService.releaseImageTextConsult(consultType,userId,publisherName,title,content,imageName));
    }

    /**
      * @Description: 用户发布视频资讯
      * @Author: ziHeng
      * @Date: 2018/5/20 下午4:46
      * @Param: [consultType, userId, publisherName, title, imageName, videoImgName, content]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("releaseVideoConsult")
    @ApiOperation(value = "用户发布视频资讯")
    public ApiResponse releaseVideoConsult(@RequestParam Short consultType,
                                           @RequestParam String publisherName,
                                           @RequestParam String title,
                                           @RequestParam String imageName,
                                           @RequestParam String videoImgName,
                                           @RequestParam String videoUrl,
                                           @RequestParam String content){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(consultPostService.releaseVideoConsult(consultType,userId,publisherName,title,imageName,videoImgName,videoUrl,content));

    }
}
