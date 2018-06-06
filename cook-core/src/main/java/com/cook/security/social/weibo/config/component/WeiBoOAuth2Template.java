package com.cook.security.social.weibo.config.component;

import com.alibaba.fastjson.JSONObject;
import com.cook.security.social.weixin.config.component.WeiXinAccessGrant;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2Template;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.nio.charset.Charset;
import java.util.Map;

/**
 * @description: code和AccessToken
 * @author: ziHeng
 * @create: 2018-05-30 14:55
 **/
public class WeiBoOAuth2Template extends OAuth2Template{

    private String clientId;

    private String clientSecret;

    private String accessTokenUrl;

    private static Logger logger= LoggerFactory.getLogger(WeiBoOAuth2Template.class);

    public WeiBoOAuth2Template(String clientId, String clientSecret, String authorizeUrl, String accessTokenUrl) {
        super(clientId, clientSecret, authorizeUrl, accessTokenUrl);
        setUseParametersForClientAuthentication(true);
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.accessTokenUrl = accessTokenUrl;
    }

    @Override
    public AccessGrant exchangeForAccess(String authorizationCode, String redirectUri,
                                         MultiValueMap<String, String> additionalParameters) {
        return getAccessToken(accessTokenUrl);
    }

    //获取token并处理
    @SuppressWarnings("unchecked")
    private AccessGrant getAccessToken(String accessTokenRequestUrl) {

        //发起请求
        String response = getRestTemplate().getForObject(accessTokenRequestUrl, String.class);

        logger.info("微博第二步:通过code获取access_token, 响应内容:{} ",response);

        Map<String, Object> result = null;
        try {
            result = JSONObject.parseObject(response,Map.class);
        } catch (Exception e) {
            e.printStackTrace();
        }


        WeiBoAccessGrant accessToken = new WeiBoAccessGrant(
                MapUtils.getString(result, "access_token"),
                MapUtils.getString(result, "scope"),
                MapUtils.getString(result, "refresh_token"),
                MapUtils.getLong(result, "expires_in"));

        accessToken.setOpenId(MapUtils.getString(result, "uid"));

        return accessToken;
    }

    @Override
    protected RestTemplate createRestTemplate() {
        RestTemplate restTemplate = super.createRestTemplate();
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter(Charset.forName("UTF-8")));
        return restTemplate;
    }
}
