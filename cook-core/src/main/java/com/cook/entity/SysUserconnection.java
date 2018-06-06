package com.cook.entity;

import lombok.Data;

@Data
public class SysUserconnection{

    private String userid;

    private String providerid;

    private String provideruserid;

    private Integer rank;

    private String displayname;

    private String profileurl;

    private String imageurl;

    private String accesstoken;

    private String secret;

    private String refreshtoken;

    private Long expiretime;


}