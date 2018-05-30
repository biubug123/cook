package com.cook.exception;

/**
 * @description: 处理登录注册的业务运行异常类
 * @author: ziHeng
 * @create: 2018-05-29 11:38
 **/
public class AppSecretException extends RuntimeException{

    public AppSecretException(String message) {
        super(message);
    }
}
