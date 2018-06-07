package com.cook.service;


import com.cook.exception.AppSecretException;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.WebRequest;

import java.util.concurrent.TimeUnit;

/**
 * @description: 验证码接口
 * @author: ziHeng
 * @create: 2018-06-07 15:35
 **/
public abstract class ValidateCodeProcessor<T> {

    private RedisTemplate<Object,Object> redisTemplate;

    //redis里的keyId
    private String keyCode;

    public ValidateCodeProcessor() {
    }

    public ValidateCodeProcessor(RedisTemplate<Object, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }

    public ValidateCodeProcessor(RedisTemplate<Object, Object> redisTemplate, String keyCode) {
        this.redisTemplate = redisTemplate;
        this.keyCode=keyCode;
    }

    //生成验证码
    public abstract T generateCode(ServletWebRequest request);

    
    //从redis验证
    public Boolean isValidate(ServletWebRequest request,String codeValue) {
        String key = key(request);
        if (!redisTemplate.hasKey(key)){
            throw new AppSecretException("验证码已过期");
        }
        //获取redis里存的code
        String storeCode = (String) redisTemplate.opsForValue().get(key);
        //进行对比
        return storeCode.equals(codeValue);
    }

    //从请求头获取key键值
    public String key(WebRequest request) {
        //从请求头里获得该App的设备id
        String deviceId = request.getHeader("deviceId");
        if(StringUtils.isBlank(deviceId)){
            throw new AppSecretException("请求头deviceId不能为空");
        }
        return keyCode+deviceId;
    }

}
