package com.cook.exception;

/**
 * @description: 处理 Service 层上抛的业务运行异常类
 * @author: ziHeng
 * @create: 2018-05-09 11:38
 **/
public class ServiceException extends RuntimeException{

    public ServiceException(String message) {
        super(message);
    }
}
