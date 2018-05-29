package com.ziheng.controller;

import com.cook.dao.EnterpriseMapper;
import com.cook.dao.ResumeMapper;
import com.cook.entity.Enterprise;
import com.cook.entity.Proxy;
import com.cook.response.ApiResponse;
import com.cook.security.jwt.JwtDto;
import com.cook.util.JwtDecode;
import com.cook.util.PhoneAndEmailUtil;
import com.fasterxml.jackson.annotation.JsonView;
import com.ziheng.dao.UserGetDao;
import com.ziheng.dto.userGet.*;
import com.ziheng.service.UserGetService;
import com.ziheng.service.UserPostService;
import com.ziheng.util.ZiHengUtil;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponses;
import org.hibernate.validator.valuehandling.UnwrapValidatedValue;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ValidationException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @description: 用户getApi
 * @author: ziHeng
 * @create: 2018-05-16 15:20
 **/
@RestController
@RequestMapping("/user")
@Api(value = "/user",tags = "用户相关api",description = "已测")
public class UserController {

    private UserGetDao userGetDao;

    private UserGetService userGetService;

    private UserPostService userPostService;

    private ResumeMapper resumeMapper;

    private EnterpriseMapper enterpriseMapper;

    public UserController(UserGetDao userGetDao, UserGetService userGetService, UserPostService userPostService, ResumeMapper resumeMapper, EnterpriseMapper enterpriseMapper) {
        this.userGetDao = userGetDao;
        this.userGetService = userGetService;
        this.userPostService = userPostService;
        this.resumeMapper = resumeMapper;
        this.enterpriseMapper = enterpriseMapper;
    }

    /*
      * @Description: 用户的求职列表
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:57
      */
    @GetMapping("/getHuntList")
    @ApiOperation(value = "用户的求职列表",response = Hunt.class,responseContainer = "List")
    public ApiResponse huntList(){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(userGetDao.huntList(userId));

    }

    /*
      * @Description: 用户的简历列表
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:58
      */
    @GetMapping("/getResumeList")
    @ApiOperation(value = "用户的简历列表",response = Resume.class,responseContainer = "List")
    public ApiResponse resultList(){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";

        return ApiResponse.ofSuccess(userGetService.resumeList(userId));

    }


    /*
      * @Description: 获取用户个人信息
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:59
      * @Param: [userId:用户id]
      */
    @GetMapping("/getUser")
    @ApiOperation(value = "获取用户个人信息",response = User.class)
    public ApiResponse getUser(){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(userGetDao.getUser(userId));

    }

    /**
      * @Description: 获取用户发布的资讯-按照发布日期排序
      * @Author: ziHeng
      * @Date: 2018/5/17 上午11:14
      * @Param: [userId]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getMyConsult")
    @ApiOperation(value = "获取用户发布的资讯-按照发布日期排序",response = Consult.class,responseContainer = "List")
    public ApiResponse getMyConsult(){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(userGetService.consultList(userId));

    }

    /** 
      * @Description: 获取用户的投递申请
      * @Author: ziHeng
      * @Date: 2018/5/17 上午11:32
      * @Param: [userId]
      * @return: com.cook.response.ApiResponse
      */ 
    @GetMapping("/getRecruitApply")
    @ApiOperation(value = "获取用户的投递申请",response = UserApply.class,responseContainer = "List")
    public ApiResponse getRecruitApply(){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
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
    @ApiOperation(value = "根据类型获取收藏列表 0/1:招聘的职位和求职的职位 2:咨询的收藏",response = Job.class,responseContainer = "List")
    public ApiResponse getCollectList(@ApiParam(value = "收藏类型 0/1:招聘的职位和求职的职位 2:咨询的收藏")@RequestParam("collectType") Short collectType){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
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
    @ApiOperation(value = "根据类型获取浏览列表 0/1:招聘的职位和求职的职位 2:咨询的浏览",response = Job.class,responseContainer = "List")
    public ApiResponse getBrowseList(@ApiParam(value = "收藏类型 0/1:招聘的职位和求职的职位 2:咨询的浏览")@RequestParam("browseType") Short browseType){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return userGetService.browseListByType(userId,browseType);

    }


    /** 
      * @Description: 用户代招管理页面数据
      * @Author: ziHeng
      * @Date: 2018/5/22 下午1:10
      * @Param: [userId]
      * @return: com.cook.response.ApiResponse
      */    
    @GetMapping("/getProxyList")
    //@JsonView(Job.proxyList.class)
    @ApiOperation(value = "用户的代招管理页面",response = Proxy.class,responseContainer = "List")
    public ApiResponse getProxyList(){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
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
    public ApiResponse insertCollect(@ApiParam(value = "收藏类型")@RequestParam("collectType") Short collectType,
                                     @ApiParam(value = "内容id")@RequestParam("contentId") String contentId){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
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
    public ApiResponse insertBrowse(@ApiParam(value = "浏览类型")@RequestParam("browseType") Short browseType,
                                    @ApiParam(value = "内容id")@RequestParam("contentId") String contentId){
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";

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
    public ApiResponse deleteResume(@ApiParam(value = "简历id")@RequestParam("resumeId") String resumeId){

        return ApiResponse.ofSuccess(resumeMapper.deleteByPrimaryKey(resumeId));

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
    public ApiResponse updateUserInfo(@ApiParam(value = "用户名")@RequestParam(required = false) String userName,
                                      @ApiParam(value = "性别")@RequestParam(required = false) String sex,
                                      @ApiParam(value = "头像图片的名称")@RequestParam(required = false) String headImgName,
                                      @ApiParam(value = "签名")@RequestParam(required = false) String signature,
                                      @ApiParam(value = "地址")@RequestParam(required = false) String address,
                                      @ApiParam(value = "出生日期(十位数-秒)")@RequestParam(required = false) Long birthDate) throws Exception {
        if(birthDate!=null){
            ZiHengUtil.isDecadeNum(birthDate);
        }
        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";
        return ApiResponse.ofSuccess(userPostService.updateUserBySelective(userId,userName,sex,headImgName,signature,address,birthDate));

    }

    /**
     * @Description: 新的企业用户
     * @Author: ziHeng
     * @Date: 2018/5/19 下午2:41
     * @Param: [name, contactWay, workArea, address]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/insertEnterprise")
    @ApiOperation(value = "注册企业用户")
    public ApiResponse insertEnterprise(@ApiParam(value = "企业名称")@RequestParam("name") String name,
                                        @ApiParam(value = "联系方式")@RequestParam("contactWay") String contactWay,
                                        @ApiParam(value = "企业所在区域")@RequestParam("workArea") String workArea,
                                        @ApiParam(value = "企业地址")@RequestParam("address") String address){
        Enterprise enterprise = new Enterprise(
                UUID.randomUUID().toString(),
                name,contactWay,
                workArea,address);

        return ApiResponse.ofSuccess(enterpriseMapper.insert(enterprise));
    }

    /** 
      * @Description: 用户新建简历
      * @Author: ziHeng
      * @Date: 2018/5/22 下午1:11
      * @Param: [workYear, workExperienceId, education, userId, title]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/insertResume")
    @ApiOperation(value = "用户新建简历")
    public ApiResponse insertResume(@ApiParam(value = "工作多少年")@RequestParam Short workYear,
                                    @ApiParam(value = "工作经验id")@RequestParam String workExperienceId,
                                    @ApiParam(value = "教育程度")@RequestParam String education,
                                    @ApiParam(value = "标题")@RequestParam String title){

        String userId = "1d7a14f2-1aa9-4581-8b85-194036b77f3e";

        return ApiResponse.ofSuccess(userPostService.insertResume(workYear,workExperienceId,education,userId,title));
    }

    /** 
      * @Description: 用户发布求职
      * @Author: ziHeng
      * @Date: 2018/5/22 下午1:47
      * @Param: [salary, resumeId, jobId, foodTypeId, workArea]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/insertHunt")
    @ApiOperation(value = "用户发布求职")
    public ApiResponse insertHunt(@ApiParam(value = "工资最小值")@RequestParam Integer minSalary,
                                  @ApiParam(value = "工资最大值")@RequestParam Integer maxSalary,
                                  @ApiParam(value = "简历id")@RequestParam String resumeId,
                                  @ApiParam(value = "职位id")@RequestParam String jobId,
                                  @ApiParam(value = "菜系id")@RequestParam String foodTypeId,
                                  @ApiParam(value = "工作地区")@RequestParam String workArea){


        String salary = minSalary+"-"+maxSalary;
        return ApiResponse.ofSuccess(userPostService.insertHunt(salary,resumeId,jobId,foodTypeId,workArea));
    }

    //测试
    @ApiOperation(value = "用户登录",httpMethod = "POST",response = JwtDto.class)
    //@PostMapping("/login")
    public void login(@RequestParam("phone") String phone,
                      @RequestParam("password") String password) {


    }

    //测试
    @GetMapping("/me")
    @ApiOperation(value = "测试")
    public Object getCurrentUser(Authentication user, HttpServletRequest request) {

        try {
            Claims claims = JwtDecode.getClaims(request);
            String userId = (String) claims.get("userId");
            System.out.println(userId);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return user;
    }


}
