package com.ziheng.dto.userGet;

import lombok.Data;

/**
 * @description: 用户
 * @author: ziHeng
 * @create: 2018-05-16 17:55
 **/

@Data
public class User {
    
    private String headImgUrl;

    private String username;

    private String sex;

    private String phone;

    private String address;

    private String signature;

    private String birthDate;
    
}
