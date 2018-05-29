/**
 * 
 */
package com.cook.security.social.qq.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.social.SocialAutoConfigurerAdapter;
import org.springframework.context.annotation.Configuration;
import org.springframework.social.connect.ConnectionFactory;

/**
  * @Description: QQ第三方登录配置入口
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:28
  */
@Configuration
@ConditionalOnProperty(prefix = "cook.social",name = "qq",havingValue = "true")
public class QQAutoConfig extends SocialAutoConfigurerAdapter {

    private static Logger logger= LoggerFactory.getLogger(QQAutoConfig.class);

    @Value("${cook.social.qq.app-id}")
	private String app_id;

    @Value("${cook.social.qq.app-secret}")
	private String app_secret;

    @Value("${cook.social.qq.provider-id}")
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
	    logger.info("appId:{}",app_id);
	    logger.info("app_secret:{}",app_secret);
	    logger.info("providerId:{}",providerId);
		return new QQConnectionFactory(providerId,app_id,app_secret);
	}

}
