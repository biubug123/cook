package com.ziheng.filter.socialJwt;

import com.cook.security.component.LoginSuccessHandler;
import com.cook.security.component.SocialLoginFailureHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.SecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.DefaultSecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Component;

/**
 * @description: 配置类 植入jwt验证流程
 * @author: ziHeng
 * @create: 2018-05-29 17:59
 **/
@Component
@ConditionalOnProperty(prefix = "cook",name = "social",havingValue = "true")
public class OpenIdAuthenticationSecurityConfig extends SecurityConfigurerAdapter<DefaultSecurityFilterChain, HttpSecurity> {

    private LoginSuccessHandler loginSuccessHandler;

    private SocialLoginFailureHandler socialLoginFailureHandler;

    private SocialUserDetailsService userDetailsService;

    private final UsersConnectionRepository usersConnectionRepository;

    @Autowired(required = false)
    public OpenIdAuthenticationSecurityConfig(LoginSuccessHandler loginSuccessHandler, SocialLoginFailureHandler socialLoginFailureHandler, SocialUserDetailsService userDetailsService, UsersConnectionRepository usersConnectionRepository) {
        this.loginSuccessHandler = loginSuccessHandler;
        this.socialLoginFailureHandler = socialLoginFailureHandler;
        this.userDetailsService = userDetailsService;
        this.usersConnectionRepository = usersConnectionRepository;
    }

    @Override
    public void configure(HttpSecurity http) throws Exception {
        //filter
        OpenIdAuthenticationFilter openIdAuthenticationFilter = new OpenIdAuthenticationFilter();
        openIdAuthenticationFilter.setAuthenticationManager(http.getSharedObject(AuthenticationManager.class));
        openIdAuthenticationFilter.setAuthenticationSuccessHandler(loginSuccessHandler);
        openIdAuthenticationFilter.setAuthenticationFailureHandler(socialLoginFailureHandler);
        //provider
        OpenIdAuthenticationProvider OpenIdAuthenticationProvider = new OpenIdAuthenticationProvider();
        OpenIdAuthenticationProvider.setUserDetailsService(userDetailsService);
        OpenIdAuthenticationProvider.setUsersConnectionRepository(usersConnectionRepository);

        http.authenticationProvider(OpenIdAuthenticationProvider)
                .addFilterAfter(openIdAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

    }


}
