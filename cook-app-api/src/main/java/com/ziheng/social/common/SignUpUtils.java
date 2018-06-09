package com.ziheng.social.common;

import com.cook.exception.AppSecretException;
import com.cook.response.ApiResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionData;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.WebRequest;

import java.util.concurrent.TimeUnit;

/**
 * @description: 第三方登录后用户信息存储到redis
 * @author: ziHeng
 * @create: 2018-05-29 21:34
 **/
@Component
@ConditionalOnProperty(name = "cook.social",havingValue = "true")
public class SignUpUtils {

    private RedisTemplate<Object,Object> redisTemplate;

    //sysUserConnection表增删改查类
    private UsersConnectionRepository usersConnectionRepository;

    //connection工具类
    private ConnectionFactoryLocator connectionFactoryLocator;

    public SignUpUtils(RedisTemplate<Object, Object> redisTemplate, UsersConnectionRepository usersConnectionRepository, ConnectionFactoryLocator connectionFactoryLocator) {
        this.redisTemplate = redisTemplate;
        this.usersConnectionRepository = usersConnectionRepository;
        this.connectionFactoryLocator = connectionFactoryLocator;
    }

    /**
      * @Description: 存入数据到redis(6分钟)
      * @Author: ziHeng
      * @Date: 2018/5/29 下午10:15
      * @Param: [request, connectionData]
      * @return: void
      */
    public void saveConnectionData(WebRequest request, ConnectionData connectionData){
        redisTemplate.opsForValue().set(key(request),connectionData,6, TimeUnit.MINUTES);
    }


    /**
      * @Description:用户注册存sysUserConnection
      * @Author: ziHeng
      * @Date: 2018/5/29 下午9:51
      */
    public ApiResponse doPostSignUp(WebRequest request, String userId){
        //从redis获取从已存入的key
        String key = key(request);
        //
        if(!redisTemplate.hasKey(key)){
            throw new AppSecretException("无法找到缓存的第三方用户社交信息");
        }
        ConnectionData connectionData = (ConnectionData) redisTemplate.opsForValue().get(key);
        //根据providerId获取连接工厂 connectionData->connection
        Connection<?> connection = connectionFactoryLocator.getConnectionFactory(connectionData.getProviderId())
                .createConnection(connectionData);
        //存到sysUserConnection表
        usersConnectionRepository.createConnectionRepository(userId).addConnection(connection);
        return ApiResponse.ofSuccess("绑定成功");
    }


    public String key(WebRequest request) {
        //从请求头里获得该App的设备id
        String deviceId = request.getHeader("deviceId");
        if(StringUtils.isBlank(deviceId)){
            throw new AppSecretException("请求头deviceId不能为空");
        }

        return "cook.userSocialInfoByDeviceId:"+deviceId;
    }
}
