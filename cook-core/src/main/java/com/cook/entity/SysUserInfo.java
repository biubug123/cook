package com.cook.entity;

import lombok.Data;

@Data
public class SysUserInfo {

    private String id;

    private String username;

    //性别
    private String sex;

    //头像名称
    private String headImgName;

    //个性签名
    private String signature;

    //地址
    private String address;

    //身份证前面照片的名称
    private String identityFront;

    //身份证背面照片的名称
    private String identityBack;

    //身份证照片上传日期
    private Long identityUploadDate;

    //用户id
    private String sysUserId;

    //出生时间
    private Long birthDate;


    public SysUserInfo() {
    }

    public SysUserInfo(String id, String sex, String sysUserId) {
        this.id = id;
        this.sex = sex;
        this.sysUserId = sysUserId;
    }

    public SysUserInfo(String username, String sex, String headImgName, String signature, String address, String sysUserId, Long birthDate) {
        this.username = username;
        this.sex = sex;
        this.headImgName = headImgName;
        this.signature = signature;
        this.address = address;
        this.sysUserId = sysUserId;
        this.birthDate = birthDate;
    }
}