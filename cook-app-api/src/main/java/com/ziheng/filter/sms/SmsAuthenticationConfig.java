package com.ziheng.filter.sms;

import com.cook.security.component.LoginFailureHandler;
import com.cook.security.component.LoginSuccessHandler;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.stereotype.Component;

/**
 * @description: sms过滤器配置
 * @author: ziHeng
 * @create: 2018-06-08 20:31
 **/
@Component
@ConditionalOnProperty(prefix = "cook.security",name = "token",havingValue = "true")
public class SmsAuthenticationConfig extends SecurityConfigurerAdapter<DefaultSecurityFilterChain,HttpSecurity>{

    private LoginSuccessHandler loginSuccessHandler;

    private LoginFailureHandler loginFailureHandler;

    private UserDetailsService userDetailsService;

    public SmsAuthenticationConfig(LoginSuccessHandler loginSuccessHandler, LoginFailureHandler loginFailureHandler, UserDetailsService userDetailsService) {
        this.loginSuccessHandler = loginSuccessHandler;
        this.loginFailureHandler = loginFailureHandler;
        this.userDetailsService = userDetailsService;
    }

    @Override
    public void configure(HttpSecurity builder) throws Exception {
        SmsAuthenticationFilter filter = new SmsAuthenticationFilter();
        //manager
        filter.setAuthenticationManager(builder.getSharedObject(AuthenticationManager.class));
        //provider
        SmsAuthenticationProvider smsAuthenticationProvide =new SmsAuthenticationProvider();
        //userDetails
        smsAuthenticationProvide.setUserDetailsService(userDetailsService);


        //成功处理器
        filter.setAuthenticationSuccessHandler(loginSuccessHandler);
        //失败处理器
        filter.setAuthenticationFailureHandler(loginFailureHandler);

        //添加provider
        builder.authenticationProvider(smsAuthenticationProvide)
                .addFilterAfter(filter, UsernamePasswordAuthenticationFilter.class);
    }
}
