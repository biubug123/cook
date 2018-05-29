package com.cook.security.social.qq.api;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.oauth2.AbstractOAuth2ApiBinding;
import org.springframework.social.oauth2.TokenStrategy;

/**
 * @description: 用access_token获取openId->再获取用户信息
 * @author: ziHeng
 * @create: 2018-05-27 17:58
 **/
public class QQApi extends AbstractOAuth2ApiBinding implements QQ {

    private static Logger logger= LoggerFactory.getLogger(QQApi.class);

    //第二步获取openId(access_token)
    private static final String URL_GET_OPENID = "https://graph.qq.com/oauth2.0/me?access_token=%s";

    //第三步获取用户信息(access_token(父类存在)、oauth_consumer_key(appId)、openid)
    private static final String URL_GET_USERINFO = "https://graph.qq.com/user/get_user_info?oauth_consumer_key=%s&openid=%s";

    private String appId;

    private String openId;

    //token放在请求参数里
    public QQApi(String accessToken, String appId){
        //token托管给AbstractOAuth2ApiBinding
        super(accessToken, TokenStrategy.ACCESS_TOKEN_PARAMETER);
        this.appId = appId;

        //类型格式化
        String url = String.format(URL_GET_OPENID, accessToken);

        //发起获取openId请求
        String result = getRestTemplate().getForObject(url, String.class);
        logger.info("qq-第二步获取openid:{}",result);

        this.openId = StringUtils.substringBetween(result, "\"openid\":\"", "\"}");

    }

    @Override
    public QQUserInfo getUserInfo() {

        String url = String.format(URL_GET_USERINFO, appId, openId);
        //发起获取用户信息请求
        String result = getRestTemplate().getForObject(url, String.class);
        logger.info("qq-第三步获取用户信息:{}",result);

        QQUserInfo userInfo;
        try {
            userInfo = JSONObject.parseObject(result,QQUserInfo.class);
            userInfo.setOpenId(openId);
            return userInfo;
        } catch (Exception e) {
            throw new RuntimeException("获取用户信息失败", e);
        }


    }
}
