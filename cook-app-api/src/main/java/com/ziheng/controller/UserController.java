package com.ziheng.controller;

import com.cook.response.ApiResponse;
import com.ziheng.dao.UserDao;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: 用户api
 * @author: ziHeng
 * @create: 2018-05-16 15:20
 **/
@RestController
@RequestMapping("/user")
public class UserController {

    private UserDao userDao;

    public UserController(UserDao userDao) {
        this.userDao = userDao;
    }

    /*
      * @Description: 用户的求职列表
      * @Author: ziHeng
      * @Date: 2018/5/16 下午3:57
      * @Param: [userId:用户id]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getHuntList/{userId}")
    public ApiResponse huntList(@PathVariable("userId") String userId) throws Exception{

        return ApiResponse.ofSuccess(userDao.huntList(userId));

    }

}
