package com.system.dto;

import lombok.Data;

@Data
public class UserDto {

    private String key;

    //账号
    private String accountNum;

    //密码
    private String password;

    //手机号
    private String phone;

    //注册日期
    private Long enrollDate;

    //最后登录日期
    private Long lastLoginDate;

    private String username;

    private String address;

}