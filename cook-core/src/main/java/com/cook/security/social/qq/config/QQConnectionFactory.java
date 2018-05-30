/**
 * 
 */
package com.cook.security.social.qq.config;

import com.cook.security.social.qq.api.QQ;
import com.cook.security.social.qq.api.QQApiAdapter;
import com.cook.security.social.qq.config.component.QQServiceProvider;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;


/** 
  * @Description: QQ连接数据库工厂
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:26
  */
public class QQConnectionFactory extends OAuth2ConnectionFactory<QQ> {

	public QQConnectionFactory(String providerId, String appId, String appSecret) {
		super(providerId, new QQServiceProvider(appId, appSecret), new QQApiAdapter());
	}

}
