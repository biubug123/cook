package com.ziheng.controller;

import com.cook.dao.ResumeMapper;
import com.cook.response.ApiResponse;
import com.ziheng.dao.UserGetDao;
import com.ziheng.service.UserGetService;
import com.ziheng.service.UserPostService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * @description: 用户getApi
 * @author: ziHeng
 * @create: 2018-05-16 15:20
 **/
@RestController
@RequestMapping("/user")
@Api(value = "/user",description = "用户相关api")
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
    @ApiOperation(value = "用户的求职列表")
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
    @ApiOperation(value = "用户的简历列表")
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
    @ApiOperation(value = "获取用户个人信息")
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
    @ApiOperation(value = "获取用户发布的资讯-按照发布日期排序")
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
    @ApiOperation(value = "获取用户的投递申请")
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
    @ApiOperation(value = "根据类型获取收藏列表 0/1:招聘的职位和求职的职位 2:咨询的收藏")
    public ApiResponse getCollectList(@RequestParam("userId") String userId,
                                      @RequestParam("collectType") Short collectType){
        return userGetService.collectListByType(userId,collectType);

    }

    /**
      * @Description: 根据类型获取浏览列表 0/1:招聘的职位和求职的职位 2:咨询的收藏
      * @Author: ziHeng
      * @Date: 2018/5/17 下午4:42
      * @Param: [userId, collectType]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getBrowseList")
    @ApiOperation(value = "根据类型获取浏览列表 0/1:招聘的职位和求职的职位 2:咨询的收藏")
    public ApiResponse getBrowsetList(@RequestParam("userId") String userId,
                                      @RequestParam("collectType") Short collectType){
        return userGetService.browseListByType(userId,collectType);

    }


    @GetMapping("/getProxyList")
    @ApiOperation(value = "用户的代招管理页面")
    public ApiResponse getProxyList(@RequestParam("userId") String userId){
        return ApiResponse.ofSuccess(userGetDao.listProxy(userId));
    };

    /** 
      * @Description: 根据收藏类型收藏
      *               收藏类型(招聘:0,求职:1,资讯:2)
      * @Author: ziHeng
      * @Date: 2018/5/17 下午12:06
      * @Param: [userId:用户id, collectType:招聘:0,求职:1,资讯:2, contentId:类型id]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/insertCollect")
    @ApiOperation(value = "根据类型获取浏览列表 0/1:招聘的职位和求职的职位 2:咨询的收藏")
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
    @ApiOperation(value = "根据类型新增浏览记录 类型(招聘:0,求职:1,资讯:2)")
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
    @ApiOperation(value = "用户删除简历")
    public ApiResponse deleteResume(@RequestParam("resumeId") String resumeId){

        return ApiResponse.ofSuccess(resumeMapper.deleteByPrimaryKey(resumeId));

    }


    /**
      * @Description: 注册新用户
      * @Author: ziHeng
      * @Date: 2018/5/17 下午9:26
      * @Param: [phone:手机号, password:密码, accountNum:账号，可选]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/insertUser")
    @ApiOperation(value = "注册新用户")
    public ApiResponse insertUser(@RequestParam("phone") String phone,
                                  @RequestParam("password") String password,
                                  @RequestParam("sex") String sex,
                                  @RequestParam(value = "accountNum",required = false) String accountNum){


        return ApiResponse.ofSuccess(userPostService.insertUser(phone,password,sex,accountNum));

    }


    /**
      * @Description: 用户修改个人信息
      * @Author: ziHeng
      * @Date: 2018/5/18 上午10:56
      * @Param: [userId, userName, sex, headImgName:上传后返回去的头像名称, signature:个性签名, address:地址, birthDate]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/updateUserInfo")
    @ApiOperation(value = "用户修改个人信息")
    public ApiResponse updateUserInfo(@RequestParam(required = false) String userId,
                                      @RequestParam(required = false) String userName,
                                      @RequestParam(required = false) String sex,
                                      @RequestParam(required = false) String headImgName,
                                      @RequestParam(required = false) String signature,
                                      @RequestParam(required = false) String address,
                                      @RequestParam(required = false) Long birthDate){

        return ApiResponse.ofSuccess(userPostService.updateUserBySelective(userId,userName,sex,headImgName,signature,address,birthDate));

    }




}
