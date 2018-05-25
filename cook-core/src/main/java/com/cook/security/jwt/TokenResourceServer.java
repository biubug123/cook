package com.cook.security.jwt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * @description: token资源服务
 * @author: ziHeng
 * @create: 2018-05-24 15:35
 **/

//@Configuration
//@EnableResourceServer
public class TokenResourceServer extends ResourceServerConfigurerAdapter{


    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;

    @Autowired
    private AuthenticationFailureHandler failureHandler;

    @Autowired
    private UserDetailsService myUserDetailsService;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/security/*","/user/login").permitAll()
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
