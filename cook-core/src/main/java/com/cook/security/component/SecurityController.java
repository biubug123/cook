package com.cook.security.component;

import com.cook.dao.SysUserMapper;
import com.cook.response.ApiResponse;
import com.cook.security.thirdPartyLogin.common.SignUpUtils;
import com.cook.security.thirdPartyLogin.common.SocialUserInfo;
import com.cook.service.SecurityService;
import com.cook.util.PhoneAndEmailUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.ValidationException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

/**
 * @description: 安全处理url
 * @author: ziHeng
 * @create: 2018-05-24 09:59
 **/
@RestController
@RequestMapping("/security")
public class SecurityController {

    private SecurityService securityService;

    private static Logger logger= LoggerFactory.getLogger(SecurityController.class);

    @Autowired
    private ProviderSignInUtils providerSignInUtils;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SignUpUtils signUpUtils;

    public SecurityController(SecurityService securityService) {
        this.securityService = securityService;
    }

    /**
      * @Description: 用户未登录,返回错误信息让前端引导前往登录页面
      * @Author: ziHeng
      * @Date: 2018/5/24 上午10:05
      * @Param: []
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/toLoginPage")
    public ApiResponse toLoginPage(){
        return ApiResponse.ofError(ApiResponse.Status.NOT_LOGIN);
    }

    /**
      * @Description: 用户第三方登录后,"引导"去注册页面或绑定手机号页面(用户第一次用未绑定的第三方时)
      * @Author: ziHeng
      * @Date: 2018/5/29 下午10:04
      * @Param: [request]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/toSignUpPage")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ApiResponse toSignUpPage(HttpServletRequest request) throws UnsupportedEncodingException {
        SocialUserInfo userInfo = new SocialUserInfo();
        //从session里获取连接
        Connection<?> connection = providerSignInUtils.getConnectionFromSession(new ServletWebRequest(request));
        if (connection==null){
            return ApiResponse.ofError(ApiResponse.Status.FAILURE_UESRINFO);
        }
        //providerId
        userInfo.setProviderId(connection.getKey().getProviderId());
        //providerUserId
        userInfo.setProviderUserId(connection.getKey().getProviderUserId());
        //头像
        userInfo.setHeadimg(connection.getImageUrl());
        //昵称
        userInfo.setNickname(connection.getDisplayName());
        //用工具存入redis
        signUpUtils.saveConnectionData(new ServletWebRequest(request),connection.createData());
        return ApiResponse.ofData(userInfo, ApiResponse.Status.NOT_SIGNUP);
    }


    /**
     * @Description: 直接注册新用户
     * @Author: ziHeng
     * @Date: 2018/5/17 下午9:26
     * @Param: [phone:手机号, password:密码, accountNum:账号，可选]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/regist")
    @ApiOperation(value = "注册新用户")
    public ApiResponse insertUser(@ApiParam(value = "手机号")@RequestParam("phone") String phone,
                                  @ApiParam(value = "密码")@RequestParam("password") String password) throws ValidationException {

        if(phone!=null&& PhoneAndEmailUtil.checkTelephone(phone)){
            String userId = UUID.randomUUID().toString();
            return ApiResponse.ofSuccess(securityService.insertUser(userId,phone,password,null,null));
        }else {
            throw new ValidationException("不合法的手机号");
        }

    }


    /**
      * @Description: 第三方登录后"注册"新用户或绑定手机
      * @Author: ziHeng
      * @Date: 2018/5/29 下午10:05
      * @Param: [phone, password, request]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/registAfterSocial")
    @ApiOperation(value = "第三方登录注册新用户或绑定手机")
    public ApiResponse registAfterSocial(@ApiParam(value = "手机号")@RequestParam(value = "phone",required = false) String phone,
                                         //@ApiParam(value = "密码")@RequestParam(value = "password",required = false) String password,
                                         HttpServletRequest request) throws ValidationException, UnsupportedEncodingException {
        String userId;
        if(phone!=null&& PhoneAndEmailUtil.checkTelephone(phone)){
            //手机号获取用户id
            userId = sysUserMapper.userByPhone(phone).getId();
            logger.info("绑定手机号");
            if(userId==null){
                userId = UUID.randomUUID().toString();
                logger.info("新用户");
                securityService.insertUser(userId,phone,null,null,null);
            }
            return ApiResponse.ofSuccess(signUpUtils.doPostSignUp(new ServletWebRequest(request),userId));
        }else {
            throw new ValidationException("不合法的手机号");
        }
    }


    //某用户第三方登录信息列表


    //用户绑定第三方登录

    //删除某第三方登录


}