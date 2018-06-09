package com.ziheng.social.weixin.api;

import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.social.oauth2.AbstractOAuth2ApiBinding;
import org.springframework.social.oauth2.TokenStrategy;

import java.nio.charset.Charset;
import java.util.List;

/**
 * @description: 获取微信用户信息
 * @author: ziHeng
 * @create: 2018-05-28 14:59
 **/
public class WeiXinApi extends AbstractOAuth2ApiBinding implements WeiXin {

    private static Logger logger= LoggerFactory.getLogger(WeiXinApi.class);

    //第三步获取用户信息(access_token(父类存在)、openid)
    private static final String URL_GET_USERINFO = "https://api.weixin.qq.com/sns/userinfo?openid=%s";


    public WeiXinApi(String accessToken) {
        super(accessToken, TokenStrategy.ACCESS_TOKEN_PARAMETER);
    }

    /**
     * 默认注册的StringHttpMessageConverter字符集为ISO-8859-1，而微信返回的是UTF-8的，所以覆盖了原来的方法。
     */
    @Override
    protected List<HttpMessageConverter<?>> getMessageConverters() {
        List<HttpMessageConverter<?>> messageConverters = super.getMessageConverters();
        messageConverters.remove(0);
        messageConverters.add(new StringHttpMessageConverter(Charset.forName("UTF-8")));
        return messageConverters;
    }

    @Override
    public WeiXinUserInfo getWeiXinUserInfo(String openId) {
        String url = String.format(URL_GET_USERINFO,openId);
        //发起获取用户信息请求
        String result = getRestTemplate().getForObject(url, String.class);
        logger.info("微信-第三步获取用户信息:{}",result);

        WeiXinUserInfo weiXinUserInfo;
        try {
            weiXinUserInfo = JSONObject.parseObject(result,WeiXinUserInfo.class);
            weiXinUserInfo.setOpenid(openId);
            return weiXinUserInfo;
        } catch (Exception e) {
            throw new RuntimeException("获取用户信息失败", e);
        }
    }
}
