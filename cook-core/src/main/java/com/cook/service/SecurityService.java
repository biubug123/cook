package com.cook.service;

public interface SecurityService {

    //用户注册
    Integer insertUser(String userId,
                       String phone,
                       String password,
                       String sex,
                       String accountNum);

}
