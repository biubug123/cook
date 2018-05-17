package com.ziheng.controller;

import com.cook.dao.ResumeMapper;
import com.cook.response.ApiResponse;
import com.ziheng.dao.UserGetDao;
import com.ziheng.service.UserGetService;
import com.ziheng.service.UserPostService;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 用户getApi
 * @author: ziHeng
 * @create: 2018-05-16 15:20
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    private UserGetDao userGetDao;

    private UserGetService userGetService;

    private UserPostService userPostService;

    private ResumeMapper resumeMapper;

    public UserController(UserGetDao userGetDao, UserGetService userGetService, UserPostService userPostService, ResumeMapper resumeMapper) {
        this.userGetDao = userGetDao;
        this.userGetService = userGetService;
        this.userPostService = userPostService;
        this.resumeMapper = resumeMapper;
    }

    /*
          * @Description: 用户的求职列表
          * @Author: ziHeng
          * @Date: 2018/5/16 下午3:57
          * @Param: [userId:用户id]
          */
    @GetMapping("/getHuntList/{userId}")
    public ApiResponse huntList(@PathVariable("userId") String userId){

        return ApiResponse.ofSuccess(userGetDao.huntList(userId));

    }

    /*
      * @Description: 用户的简历列表
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:58
      * @Param: [userId:用户id]
      */
    @GetMapping("/getResumeList/{userId}")
    public ApiResponse resultList(@PathVariable("userId") String userId){

        return ApiResponse.ofSuccess(userGetService.resumeList(userId));

    }


    /*
      * @Description: 获取用户个人信息
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:59
      * @Param: [userId:用户id]
      */
    @GetMapping("/getUser/{userId}")
    public ApiResponse getUser(@PathVariable("userId") String userId){

        return ApiResponse.ofSuccess(userGetDao.getUser(userId));

    }

    /**
      * @Description: 获取用户发布的资讯-按照发布日期排序
      * @Author: ziHeng
      * @Date: 2018/5/17 上午11:14
      * @Param: [userId]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getMyConsult/{userId}")
    public ApiResponse getMyConsult(@PathVariable("userId") String userId){

        return ApiResponse.ofSuccess(userGetService.consultList(userId));

    }

    /** 
      * @Description: 获取用户的投递申请
      * @Author: ziHeng
      * @Date: 2018/5/17 上午11:32
      * @Param: [userId]
      * @return: com.cook.response.ApiResponse
      */ 
    @GetMapping("/getRecruitApply/{userId}")
    public ApiResponse getRecruitApply(@PathVariable("userId") String userId){

        return ApiResponse.ofSuccess(userGetDao.getUserApply(userId));

    }

    /** 
      * @Description: 根据类型获取收藏列表 0/1:招聘的职位和求职的职位 2:咨询的收藏
      * @Author: ziHeng
      * @Date: 2018/5/17 下午6:59
      * @Param: [userId, collectType:0/1:招聘的职位和求职的职位 2:咨询的收藏]
      * @return: com.cook.response.ApiResponse
      */ 
    @GetMapping("/getCollectList")
    public ApiResponse getCollectList(@RequestParam("userId") String userId,
                                      @RequestParam("collectType") Short collectType){
        return userGetService.collectListByType(userId,collectType);

    }

    @GetMapping("/getBrowsetList")
    public ApiResponse getBrowsetList(@RequestParam("userId") String userId,
                                      @RequestParam("collectType") Short collectType){
        return userGetService.browseListByType(userId,collectType);

    }

    /** 
      * @Description: 根据收藏类型收藏
      *               收藏类型(招聘:0,求职:1,资讯:2)
      * @Author: ziHeng
      * @Date: 2018/5/17 下午12:06
      * @Param: [userId:用户id, collectType:招聘:0,求职:1,资讯:2, contentId:类型id]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/insertCollect")
    public ApiResponse insertCollect(@RequestParam("userId") String userId,
                                     @RequestParam("collectType") Short collectType,
                                     @RequestParam("contentId") String contentId){

        return ApiResponse.ofSuccess(userPostService.insertUserCollect(userId,collectType,contentId));

    }

    /**
     * @Description: 根据类型新增浏览记录
     *               类型(招聘:0,求职:1,资讯:2)
     * @Author: ziHeng
     * @Date: 2018/5/17 下午12:06
     * @Param: [userId, collectType:招聘:0,求职:1,资讯:2, contentId:类型id]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/insertBrowse")
    public ApiResponse insertBrowse(@RequestParam("userId") String userId,
                                     @RequestParam("browseType") Short browseType,
                                     @RequestParam("contentId") String contentId){

        return ApiResponse.ofSuccess(userPostService.insertUserBrowse(userId,browseType,contentId));

    }

    /*
     * @Description: 用户删除简历
     * @Author: ziHeng
     * @Date: 2018/5/16 下午3:57
     * @Param: [userId:用户id]
     */
    @PostMapping("/deleteResume")
    public ApiResponse deleteResume(@RequestParam("resumeId") String resumeId){

        return ApiResponse.ofSuccess(resumeMapper.deleteByPrimaryKey(resumeId));

    }


}
