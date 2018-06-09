package com.cook.security.jwt;

import com.cook.constant.Security;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;
import org.springframework.security.oauth2.provider.token.store.redis.RedisTokenStore;

/**
 * @description: socialJwt-令牌存储配置
 * @author: ziHeng
 * @create: 2018-05-24 23:20
 **/
@Configuration
@ConditionalOnProperty(prefix = "cook.security" ,name = "token",havingValue = "true")
public class JwtTokenStoreConfig {


    //jwt存储器
    @Bean
    public TokenStore jwtTokenStore(){
        return new JwtTokenStore(jwtAccessTokenConverter());
    }

    //jwt转换器
    @Bean
    public JwtAccessTokenConverter jwtAccessTokenConverter(){
        JwtAccessTokenConverter accessTokenConverter = new JwtAccessTokenConverter();
        accessTokenConverter.setSigningKey(Security.JWTSIGNKEY);
        return accessTokenConverter;
    }

    @Bean
    public TokenEnhancer jwtTokenEnhancer(){
        return new JwtEnhancer();
    }




}
