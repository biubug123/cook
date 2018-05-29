/**
 * 
 */
package com.cook.security.thirdPartyLogin.qq.config;

import com.cook.security.thirdPartyLogin.qq.api.QQ;
import com.cook.security.thirdPartyLogin.qq.api.QQApiAdapter;
import com.cook.security.thirdPartyLogin.qq.config.component.QQServiceProvider;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;


/** 
  * @Description:
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:26
  */
public class QQConnectionFactory extends OAuth2ConnectionFactory<QQ> {

	public QQConnectionFactory(String providerId, String appId, String appSecret) {
		super(providerId, new QQServiceProvider(appId, appSecret), new QQApiAdapter());
	}

}
