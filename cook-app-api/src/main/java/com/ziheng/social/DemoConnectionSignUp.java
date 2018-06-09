package com.ziheng.social;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;

/**
 * @description: 默认第三方登录后不注册
 * @author: ziHeng
 * @create: 2018-05-29 16:42
 **/
//@Component
public class DemoConnectionSignUp implements ConnectionSignUp {
    @Override
    public String execute(Connection<?> connection) {
        return connection.getDisplayName();//jdbcUserConnection类里 用户名作为userId
    }
}
