package com.ziheng.filter.sms;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description: 过滤器 获取手机号并生成初始token->provider
 * @author: ziHeng
 * @create: 2018-06-08 18:01
 **/
public class SmsAuthenticationFilter extends AbstractAuthenticationProcessingFilter{

    //@Value("${cook.social.sms.authenticateUrl}")
    private static String smsAuthenticationUrl = "/authentication/sms";

    public SmsAuthenticationFilter() {
        super(new AntPathRequestMatcher(smsAuthenticationUrl,"POST"));
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException, IOException, ServletException {
        ServletWebRequest webRequest = new ServletWebRequest(request,response);
        if(!StringUtils.equalsIgnoreCase(request.getMethod(),"POST")) {
            throw new AuthenticationServiceException("认证方法错误");
        }
        //用户手机号
        String phone = getPhone(webRequest);
        if(phone == null){
            phone = "";
        }
        phone = phone.trim();

        //生成token
        SmsAuthenticationToken authenticationToken = new SmsAuthenticationToken(phone);
        authenticationToken.setDetails(request);

        return this.getAuthenticationManager().authenticate(authenticationToken);
    }

    /**
     * 获取手机号
     */
    protected String getPhone(ServletWebRequest request) {
        return request.getParameter("phone");
    }

}
