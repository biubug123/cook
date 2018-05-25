package com.cook.security.jwt;

import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import static com.cook.security.MyUserDetailsService.userId;

import java.util.HashMap;
import java.util.Map;

/**
 * @description: JWT增强器:在此处写入token其它信息
 * @author: ziHeng
 * @create: 2018-05-25 14:44
 **/
public class JwtEnhancer implements TokenEnhancer {

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken oAuth2AccessToken, OAuth2Authentication oAuth2Authentication) {

        Map<String,Object> info = new HashMap<String, Object>();
        //存入userId
        info.put("userId",userId);

        ((DefaultOAuth2AccessToken)oAuth2AccessToken).setAdditionalInformation(info);

        return oAuth2AccessToken;
    }
}
