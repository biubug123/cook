package com.cook.security;

import com.cook.filter.CorsFilter;
import com.cook.filter.ValidateFilter;
import com.cook.security.social.SocialSecurityConfig;
import com.cook.security.jwt.socialJwt.OpenIdAuthenticationSecurityConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.context.SecurityContextPersistenceFilter;

/**
 * @description: token资源服务
 * @author: ziHeng
 * @create: 2018-05-24 15:35
 **/

@Configuration
@EnableResourceServer
@ConditionalOnProperty(prefix = "cook.security",name = "token",havingValue = "true")
public class TokenResourceServer extends ResourceServerConfigurerAdapter{


    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;

    @Autowired
    private AuthenticationFailureHandler failureHandler;

    //用户身份配置
    @Autowired
    private UserDetailsService myUserDetailsService;

    //第三方登录回调域配置
    @Autowired(required = false)
    private SocialSecurityConfig socialSecurityConfig;

    //第三方登录过滤器
    @Autowired(required = false)
    private OpenIdAuthenticationSecurityConfig openIdAuthenticationSecurityConfig;

    //验证码过滤器
    @Autowired
    private ValidateFilter validateFilter;

    //跨域过滤器
    @Autowired
    private CorsFilter corsFilter;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        if(socialSecurityConfig !=null){
            http.apply(socialSecurityConfig);
        }
        if(openIdAuthenticationSecurityConfig !=null) {
            http.apply(openIdAuthenticationSecurityConfig);
        }
        //跨域过滤器
        http.addFilterBefore(corsFilter,SecurityContextPersistenceFilter.class);
        http.addFilterAfter(validateFilter,CorsFilter.class);
        http.authorizeRequests()
                .antMatchers("/security/*","/user/login").permitAll()
                .antMatchers(HttpMethod.OPTIONS).permitAll()
                //.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
                .anyRequest().authenticated()
                .and().formLogin()
                .loginPage("/security/toLoginPage")
                .loginProcessingUrl("/user/login")
                .usernameParameter("username")
                .successHandler(loginSuccessHandler)
                .failureHandler(failureHandler)
                .permitAll()
                .and()
                .userDetailsService(myUserDetailsService)
                .csrf().disable();
    }






}
