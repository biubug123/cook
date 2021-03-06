/**
 * 
 */
package com.ziheng.social.weixin.config;

import com.ziheng.social.qq.config.QQAutoConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.social.SocialAutoConfigurerAdapter;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.ConnectionFactory;

/**
 * 微信登录配置
 */
@Configuration
@ConditionalOnProperty(prefix = "cook.social", name = "weiXin",havingValue = "true")
public class WeiXinAutoConfig extends SocialAutoConfigurerAdapter {


    private static Logger logger= LoggerFactory.getLogger(QQAutoConfig.class);

    @Value("${cook.social.weiXin.app-id}")
    private String app_id;

    @Value("${cook.social.weiXin.app-secret}")
    private String app_secret;

    @Value("${cook.social.weiXin.provider-id}")
    private String providerId;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.boot.autoconfigure.social.SocialAutoConfigurerAdapter
	 * #createConnectionFactory()
	 */
	@Override
	protected ConnectionFactory<?> createConnectionFactory() {
		return new WeiXinConnectionFactory(providerId, app_id,
                app_secret);
	}

}
