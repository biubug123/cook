package com.cook.security.social.weibo.config;

import com.cook.security.social.weibo.api.WeiBoApiAdapter;
import com.cook.security.social.weibo.config.component.WeiBoServiceProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.social.SocialAutoConfigurerAdapter;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.ConnectionFactory;

/**
 * @description: 微博第三方登录配置
 * @author: ziHeng
 * @create: 2018-05-30 14:41
 **/
@Configuration
@ConditionalOnProperty(prefix = "cook.social",name = "weiBo",havingValue = "true")
public class WeiBoAutoConfig extends SocialAutoConfigurerAdapter{

    private static Logger logger= LoggerFactory.getLogger(WeiBoAutoConfig.class);

    @Value("${cook.social.weiBo.app-id}")
    private String app_id;

    @Value("${cook.social.weiBo.app-secret}")
    private String app_secret;

    @Value("${cook.social.weiBo.provider-id}")
    private String providerId;


    @Override
    protected ConnectionFactory<?> createConnectionFactory() {
        return new WeiBoConnectionFactory(providerId,app_id,app_secret);
    }
}
