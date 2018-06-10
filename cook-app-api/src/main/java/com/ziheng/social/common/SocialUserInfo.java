package com.ziheng.social.common;

import lombok.Data;

/**
 * @description: 第三方登录未绑定时的用户信息
 * @author: ziHeng
 * @create: 2018-05-28 12:26
 **/
@Data
public class SocialUserInfo {
    private String providerId;

    private String providerUserId;

    private String nickname;

    private String headimg;
}
