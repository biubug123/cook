package com.cook.security.component;

import com.cook.dao.SysUserMapper;
import com.cook.dao.SysUserconnectionMapper;
import com.cook.entity.SysUserconnection;
import com.cook.response.ApiResponse;
import com.cook.security.social.common.SignUpUtils;
import com.cook.security.social.common.SocialUserInfo;
import com.cook.service.Impl.ImageCodeValidate;
import com.cook.service.Impl.SmsCodeValidate;
import com.cook.service.SecurityService;
import com.cook.service.ValidateCodeProcessor;
import com.cook.util.JwtDecode;
import com.cook.util.PhoneAndEmailUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.ServletWebRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.ValidationException;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

    @Autowired(required = false)
    private ProviderSignInUtils providerSignInUtils;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired(required = false)
    private SignUpUtils signUpUtils;

    @Autowired
    RedisTemplate<Object,Object> redisTemplate;


    @Value("${cook.social.weiXin.provider-id}")
    private String weiXinProviderId;
    @Value("${cook.social.weiBo.provider-id}")
    private String weiBoProviderId;
    @Value("${cook.social.qq.provider-id}")
    private String qqProviderId;

    private SysUserconnectionMapper sysUserconnectionMapper;

    public SecurityController(SecurityService securityService, SysUserconnectionMapper sysUserconnectionMapper) {
        this.securityService = securityService;
        this.sysUserconnectionMapper = sysUserconnectionMapper;
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
      * @Description: 用户第三方登录后,引导绑定手机号或。
      * @Author: ziHeng
      * @Date: 2018/5/29 下午10:04
      * @Param: [request]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/toSignUpPage")
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ApiResponse toSignUpPage(HttpServletRequest request){
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
        //存入redis
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
            //从redis取出存入表user_connection
            return signUpUtils.doPostSignUp(new ServletWebRequest(request),userId);
        }else {
            throw new ValidationException("不合法的手机号");
        }
    }


    //用户第三方信息列表
    @GetMapping("/userSocialList")
    @ApiOperation(value = "用户第三方信息列表")
    public ApiResponse userSocialList(HttpServletRequest request) {
        String userId = JwtDecode.getUserIdByJWT(request);
        Map<String,Boolean> result = new HashMap<String,Boolean>();
        result.put(weiBoProviderId,false);
        result.put(weiXinProviderId,false);
        result.put(qqProviderId,false);
        List<SysUserconnection> sysUserconnectionList = sysUserconnectionMapper.selectByUserId(userId);
        for(SysUserconnection sysUserconnection:sysUserconnectionList){
            String providerId = sysUserconnection.getProviderid();
            if(result.containsKey(providerId)){
                result.put(providerId,true);
            }
        }
        return ApiResponse.ofSuccess(result);
    }


    //用户绑定第三方登录
    @PostMapping("/bindSocial")
    @ApiOperation(value = "用户绑定第三方（已有token）")
    public ApiResponse bindSocial(HttpServletRequest request) {
        String userId = JwtDecode.getUserIdByJWT(request);

        return signUpUtils.doPostSignUp(new ServletWebRequest(request),userId);
    }
    //解绑用户第三方登录
    @PostMapping("/relieveBind/{providerId}")
    @ApiOperation(value = "解除绑定（已有token）")
    public ApiResponse relieveBind(HttpServletRequest request,
                                   @RequestParam("providerId") String providerId) {
        String userId = JwtDecode.getUserIdByJWT(request);

        return ApiResponse.ofSuccess(sysUserconnectionMapper.deleteByUserIdAndProviderId(userId,providerId));
    }

    /**
     * 创建图片验证码
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @GetMapping("code/image/{deviceId}")
    public void createImage(HttpServletRequest request, HttpServletResponse response, @PathVariable String deviceId)
            throws Exception {
        ServletWebRequest webRequest = new ServletWebRequest(request,response);
        ImageCodeValidate validateCodeProcessor = new ImageCodeValidate(redisTemplate,deviceId);
        BufferedImage image = validateCodeProcessor.generateCode(webRequest);
        try {
            ImageIO.write(image, "JPEG", webRequest.getResponse().getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 创建图片验证码
     *
     * @param request
     * @param response
     * @throws Exception
     */
    @GetMapping("code/sms")
    public void createSms(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ServletWebRequest webRequest = new ServletWebRequest(request,response);
        SmsCodeValidate validateCodeProcessor = new SmsCodeValidate(redisTemplate);
        validateCodeProcessor.generateCode(webRequest);
    }




}
