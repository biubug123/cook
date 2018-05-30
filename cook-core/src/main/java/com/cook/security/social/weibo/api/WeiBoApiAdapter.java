package com.cook.security.social.weibo.api;

import com.cook.security.social.qq.api.QQUserInfo;
import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.ConnectionValues;
import org.springframework.social.connect.UserProfile;

/**
 * @description: /获取需要存入sys_userConnection表的数据
 * @author: ziHeng
 * @create: 2018-05-30 16:06
 **/
public class WeiBoApiAdapter implements ApiAdapter<WeiBo>{

    private String openId;

    public WeiBoApiAdapter() {}

    public WeiBoApiAdapter(String openId){
        this.openId = openId;
    }

    @Override
    public boolean test(WeiBo weiBo) {
        return true;
    }


    @Override
    public void setConnectionValues(WeiBo weiBo, ConnectionValues connectionValues) {
        //获取用户信息
        WeiBoUserInfo userInfo = weiBo.getWeiBoUserInfo(openId);
        //用户昵称
        userInfo.setName(userInfo.getName());
        //用户头像 50*50像素
        userInfo.setProfile_image_url(userInfo.getProfile_image_url());
        //微博个人主页
        userInfo.setUrl(userInfo.getUrl());
        //用户唯一id
        userInfo.setId(userInfo.getId());
    }

    @Override
    public UserProfile fetchUserProfile(WeiBo weiBo) {
        return null;
    }

    @Override
    public void updateStatus(WeiBo weiBo, String s) {

    }
}
