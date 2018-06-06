package com.cook.security;

import com.cook.filter.CorsFilter;
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
import org.springframework.web.cors.CorsUtils;

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

    @Autowired
    private UserDetailsService myUserDetailsService;

    @Autowired(required = false)
    private SocialSecurityConfig socialSecurityConfig;

    @Autowired(required = false)
    private OpenIdAuthenticationSecurityConfig openIdAuthenticationSecurityConfig;

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
        http.authorizeRequests()
                .antMatchers("/security/*","/user/login").permitAll()
                .antMatchers(HttpMethod.OPTIONS).permitAll()
                //.requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
                .anyRequest().authenticated()
                .and().formLogin()
                .loginPage("/security/toLoginPage")
                .loginProcessingUrl("/user/login")
                .usernameParameter("phone")
                .successHandler(loginSuccessHandler)
                .failureHandler(failureHandler)
                .permitAll()
                .and()
                .userDetailsService(myUserDetailsService)
                .csrf().disable();
    }






}
