package com.cook.security.social.weibo.api;

import com.alibaba.fastjson.JSONObject;
import com.cook.security.social.weixin.api.WeiXinUserInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.oauth2.AbstractOAuth2ApiBinding;
import org.springframework.social.oauth2.TokenStrategy;

/**
 * @description: 获取用户信息Api
 * @author: ziHeng
 * @create: 2018-05-30 15:55
 **/
public class WeiBoApi extends AbstractOAuth2ApiBinding implements WeiBo{

    private static Logger logger= LoggerFactory.getLogger(WeiBoApi.class);

    //第三步获取用户信息(access_token(父类存在)、openid)
    private static final String URL_GET_USERINFO = "https://api.weibo.com/2/users/show.json?uid=%s";

    public WeiBoApi(String accessToken) {
        super(accessToken, TokenStrategy.ACCESS_TOKEN_PARAMETER);
    }

    @Override
    public WeiBoUserInfo getWeiBoUserInfo(String openId) {
        String url = String.format(URL_GET_USERINFO,openId);
        //发起获取用户信息请求
        String result = getRestTemplate().getForObject(url, String.class);
        logger.info("微博-第三步获取用户信息:{}",result);

        WeiBoUserInfo weiBoUserInfo;
        try {
            weiBoUserInfo = JSONObject.parseObject(result,WeiBoUserInfo.class);
            return weiBoUserInfo;
        } catch (Exception e) {
            throw new RuntimeException("获取用户信息失败", e);
        }
    }
}
