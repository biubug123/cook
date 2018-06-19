package com.system.dto;

import lombok.Data;

/**
 * @description: 用户
 * @author: ziHeng
 * @create: 2018-05-16 17:55
 **/

@Data
public class UserDetailDto {
    
    private String headImgUrl;

    private String username;

    private String sex;

    private String phone;

    private String address;

    private String birthDate;
    
}
