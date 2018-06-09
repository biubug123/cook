package com.ziheng.filter.sms;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 * @description: 手机号->userDetails验证并获取用户权限->生成已验证token
 * @author: ziHeng
 * @create: 2018-06-08 19:04
 **/
public class SmsAuthenticationProvider implements AuthenticationProvider{

    private UserDetailsService userDetailsService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        //向下转型-此处authentication由Filter传入
        SmsAuthenticationToken smsAuthenticationToken = (SmsAuthenticationToken) authentication;
        //获取用户信息
        UserDetails userDetails = userDetailsService.loadUserByUsername((String) smsAuthenticationToken.getPrincipal());

        if(userDetails == null){
            throw new InternalAuthenticationServiceException("无用户信息");
        }
        //用户权限和用户信息
        SmsAuthenticationToken authenticationToken = new SmsAuthenticationToken(userDetails.getAuthorities(),userDetails);

        authenticationToken.setDetails(smsAuthenticationToken.getDetails());
        return authentication;

    }

    @Override
    public boolean supports(Class<?> aClass) {
        return SmsAuthenticationToken.class.isAssignableFrom(aClass);
    }

    public void setUserDetailsService(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
}
