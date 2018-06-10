package com.cook.service.Impl;

import com.cook.service.ValidateCodeProcessor;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.ServletWebRequest;

import java.util.concurrent.TimeUnit;

/**
 * @description: 短信
 * @author: ziHeng
 * @create: 2018-06-07 18:53
 **/
public class SmsCodeValidate extends ValidateCodeProcessor<String> {

    private RedisTemplate<Object,Object> redisTemplate;

    private static String keyCode = "cook.smsCodeByDeviceId:";

    public SmsCodeValidate() {
    }

    public SmsCodeValidate(RedisTemplate redisTemplate) {
        super(redisTemplate, keyCode);
        this.redisTemplate = redisTemplate;
    }

    //生成验证码然后存入redis
    @Override
    public String generateCode(ServletWebRequest request) {
        String phone = RandomStringUtils.randomNumeric(11);
        //存入redis
        redisTemplate.opsForValue().set(key(request),phone,1, TimeUnit.MINUTES);
        return phone;
    }
}
