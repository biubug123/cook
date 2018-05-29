/**
 * 
 */
package com.cook.security.thirdPartyLogin.qq.config.component;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Template;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.Charset;


/**
  * @Description: 获取code->获取accessToken
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:27
  */
public class QQOAuth2Template extends OAuth2Template {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	public QQOAuth2Template(String clientId, String clientSecret, String authorizeUrl, String accessTokenUrl) {
		super(clientId, clientSecret, authorizeUrl, accessTokenUrl);
		setUseParametersForClientAuthentication(true);
	}
	
	/* (non-Javadoc)
	 * @see org.springframework.social.oauth2.OAuth2Template#postForAccessGrant(java.lang.String, org.springframework.util.MultiValueMap)
	 */
	@Override
	protected AccessGrant postForAccessGrant(String accessTokenUrl, MultiValueMap<String, String> parameters) {

	    //发起请求获取accessToken
		String responseStr = getRestTemplate().postForObject(accessTokenUrl, parameters, String.class);
		logger.info("获取accessToken:{}",responseStr);

		//切割返回参数
		String[] items = StringUtils.splitByWholeSeparatorPreserveAllTokens(responseStr,"&");
		//access_Token
		String accessToken = StringUtils.substringAfterLast(items[0], "=");
		//过期时间(即日起三个月)
		Long expiresIn = new Long(StringUtils.substringAfterLast(items[1], "="));
		//refreshToken(用于刷新token)
		String refreshToken = StringUtils.substringAfterLast(items[2], "=");
		
		return new AccessGrant(accessToken, null, refreshToken, expiresIn);
	}
	
	/* (non-Javadoc)
	 * @see org.springframework.social.oauth2.OAuth2Template#createRestTemplate()
	 */
	//添加新的Converter
	@Override
	protected RestTemplate createRestTemplate() {
		RestTemplate restTemplate = super.createRestTemplate();
		restTemplate.getMessageConverters().add(new StringHttpMessageConverter(Charset.forName("UTF-8")));
		return restTemplate;
	}

}
