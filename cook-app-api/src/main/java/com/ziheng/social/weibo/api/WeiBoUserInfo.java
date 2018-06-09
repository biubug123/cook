package com.ziheng.social.weibo.api;

import lombok.Data;

/**
 * @description: 微博的用户信息
 * @author: ziHeng
 * @create: 2018-05-30 14:50
 **/

@Data
public class WeiBoUserInfo {

    private boolean follow_me;
    private int friends_count;
    //性别，m：男、f：女、n：未知
    private String gender;
    private boolean allow_all_act_msg;
    private String city;
    private int favourites_count;
    private String description;
    private String created_at;
    private String province;
    //用户昵称
    private String screen_name;
    private int bi_followers_count;
    private String verified_reason;
    //用户UID
    private int id;
    private boolean geo_enabled;
    private boolean allow_all_comment;
    private int online_status;
    private boolean verified;
    private String profile_image_url;
    private String url;
    private String avatar_large;
    private int statuses_count;
    private String domain;
    private int followers_count;
    private boolean following;
    //友好显示名称
    private String name;
    private String location;
    private Object status;

}
