package com.ziheng.social.weibo.config.component;

import com.ziheng.social.qq.config.component.QQOAuth2Template;
import com.ziheng.social.weibo.api.WeiBo;
import com.ziheng.social.weibo.api.WeiBoApi;
import org.springframework.social.oauth2.AbstractOAuth2ServiceProvider;

/**
 * @description: 连接Api和OAuth2Template
 * @author: ziHeng
 * @create: 2018-05-30 14:49
 **/
public class WeiBoServiceProvider extends AbstractOAuth2ServiceProvider<WeiBo> {


    //导向第三方获取code
    private static final String URL_AUTHORIZE = "https://api.weibo.com/oauth2/authorize";

    //code获取Access_token
    private static final String URL_ACCESS_TOKEN = "https://api.weibo.com/oauth2/access_token";


    public WeiBoServiceProvider(String appId, String appSecret) {
        super(new QQOAuth2Template(appId, appSecret, URL_AUTHORIZE, URL_ACCESS_TOKEN));
    }

    @Override
    public WeiBo getApi(String accessToken) {

        return new WeiBoApi(accessToken);
    }
}
