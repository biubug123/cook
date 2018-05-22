package com.ziheng.dao;

import com.cook.entity.SysUserInfo;
import org.springframework.stereotype.Repository;

/**
 * @description: 用户post
 * @author: ziHeng
 * @create: 2018-05-18 09:09
 **/
@Repository
public interface UserPostDao {

    //用户更新
    int updateBySysUserIdSelective(SysUserInfo record);

}
