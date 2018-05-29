package com.cook.security.component;

import com.alibaba.fastjson.JSON;
import com.cook.response.ApiResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description: 登录失败处理器
 * @author: ziHeng
 * @create: 2018-05-24 09:54
 **/
@Component
@ConditionalOnProperty(prefix = "cook.security",name = "token",havingValue = "true")
public class LoginFailureHandler implements AuthenticationFailureHandler {

    private static Logger logger= LoggerFactory.getLogger(LoginFailureHandler.class);

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        logger.info("用户不存在");


        //返回界面token信息
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(JSON.toJSONString(ApiResponse.ofError(ApiResponse.Status.FAILURE_LOGIN)));
    }
}
