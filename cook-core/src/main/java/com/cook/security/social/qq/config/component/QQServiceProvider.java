/**
 * 
 */
package com.cook.security.social.qq.config.component;

import com.cook.security.social.qq.api.QQ;
import com.cook.security.social.qq.api.QQApi;
import org.springframework.social.oauth2.AbstractOAuth2ServiceProvider;



/**
  * @Description: Api和OAuth2Template
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:28
  */
public class QQServiceProvider extends AbstractOAuth2ServiceProvider<QQ> {

	private String appId;

	//导向第三方获取code
	private static final String URL_AUTHORIZE = "https://graph.qq.com/oauth2.0/authorize";

	//code获取Access_token
	private static final String URL_ACCESS_TOKEN = "https://graph.qq.com/oauth2.0/token";

	//QQ第三方登录第一步
	public QQServiceProvider(String appId, String appSecret) {
		super(new QQOAuth2Template(appId, appSecret, URL_AUTHORIZE, URL_ACCESS_TOKEN));
		this.appId = appId;
	}
	
	/* (non-Javadoc)
	 * @see org.springframework.social.oauth2.AbstractOAuth2ServiceProvider#getApi(java.lang.String)
	 */
	//QQ第二步和第三步
	@Override
	public QQ getApi(String accessToken) {
	    //api服务
		return new QQApi(accessToken, appId);
	}

}
