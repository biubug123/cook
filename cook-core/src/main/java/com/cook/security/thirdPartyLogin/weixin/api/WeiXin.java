package com.cook.security.thirdPartyLogin.weixin.api;

public interface WeiXin {

    WeiXinUserInfo getWeiXinUserInfo(String openId);

}
