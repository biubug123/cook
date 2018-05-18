package com.cook.entity;

import lombok.Data;

@Data
public class SysUser {

    private String id;

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


    public SysUser() {
    }

    public SysUser(String id, String accountNum, String password, String phone, Long enrollDate, Long lastLoginDate) {
        this.id = id;
        this.accountNum = accountNum;
        this.password = password;
        this.phone = phone;
        this.enrollDate = enrollDate;
        this.lastLoginDate = lastLoginDate;
    }
}