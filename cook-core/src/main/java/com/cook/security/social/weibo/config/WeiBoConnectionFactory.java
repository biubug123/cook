package com.cook.security.social.weibo.config;

import com.cook.security.social.weibo.api.WeiBo;
import com.cook.security.social.weibo.api.WeiBoApiAdapter;
import com.cook.security.social.weibo.config.component.WeiBoAccessGrant;
import com.cook.security.social.weibo.config.component.WeiBoServiceProvider;
import com.cook.security.social.weixin.api.WeiXin;
import com.cook.security.social.weixin.api.WeiXinApiAdapter;
import com.cook.security.social.weixin.config.component.WeiXinAccessGrant;
import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionData;
import org.springframework.social.connect.support.OAuth2Connection;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.OAuth2ServiceProvider;

/**
 * @description: 微博连接数据库工厂
 * @author: ziHeng
 * @create: 2018-05-30 14:44
 **/
public class WeiBoConnectionFactory extends OAuth2ConnectionFactory<WeiBo>{


    public WeiBoConnectionFactory(String providerId, String appId, String appSecret) {
        super(providerId, new WeiBoServiceProvider(appId,appSecret),new WeiBoApiAdapter());
    }

    /**
     * 由于微博的openId是和accessToken一起返回的，所以在这里直接根据accessToken设置providerUserId即可，不用像QQ那样通过QQAdapter来获取
     */
    @Override
    protected String extractProviderUserId(AccessGrant accessGrant) {
        if(accessGrant instanceof WeiBoAccessGrant) {
            return ((WeiBoAccessGrant)accessGrant).getOpenId();
        }
        return null;
    }

    @Override
    public Connection<WeiBo> createConnection(AccessGrant accessGrant) {
        return new OAuth2Connection<WeiBo>(getProviderId(), extractProviderUserId(accessGrant), accessGrant.getAccessToken(),
                accessGrant.getRefreshToken(), accessGrant.getExpireTime(), getOAuth2ServiceProvider(), getApiAdapter(extractProviderUserId(accessGrant)));
    }

    @Override
    public Connection<WeiBo> createConnection(ConnectionData data) {
        return new OAuth2Connection<WeiBo>(data, getOAuth2ServiceProvider(), getApiAdapter(data.getProviderUserId()));
    }

    private ApiAdapter<WeiBo> getApiAdapter(String providerUserId) {
        return new WeiBoApiAdapter(providerUserId);
    }

    private OAuth2ServiceProvider<WeiBo> getOAuth2ServiceProvider() {
        return (OAuth2ServiceProvider<WeiBo>) getServiceProvider();
    }
}
