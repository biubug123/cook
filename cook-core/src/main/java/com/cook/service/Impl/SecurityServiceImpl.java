package com.cook.service.Impl;

import com.cook.dao.SysUserInfoMapper;
import com.cook.dao.SysUserMapper;
import com.cook.entity.SysUser;
import com.cook.entity.SysUserInfo;
import com.cook.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * @description: 安全业务
 * @author: ziHeng
 * @create: 2018-05-28 12:17
 **/
@Service
public class SecurityServiceImpl implements SecurityService {

    private SysUserMapper sysUserMapper;

    private SysUserInfoMapper sysUserInfoMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public SecurityServiceImpl(SysUserMapper sysUserMapper, SysUserInfoMapper sysUserInfoMapper) {
        this.sysUserMapper = sysUserMapper;
        this.sysUserInfoMapper = sysUserInfoMapper;
    }

    /**
     * @Description: 新用户
     * @Author: ziHeng
     * @Date: 2018/5/17 下午10:00
     * @Param: [phone, password, sex, accountNum:账号]
     * @return: java.lang.Integer
     */
    @Override
    @Transactional
    public Integer insertUser(String userId,String phone, String password,String sex, String accountNum) {
        SysUser sysUser = new SysUser(userId,
                accountNum,
                //加密
                passwordEncoder.encode(password),
                phone,
                new Date().getTime()/1000,
                new Date().getTime()/1000);
        //用户表插入
        int userResult = sysUserMapper.insert(sysUser);
        //信息表插入
        if(userResult > 0){
            SysUserInfo sysUserInfo =new SysUserInfo(UUID.randomUUID().toString(),
                    sex,userId);
            return sysUserInfoMapper.insertSelective(sysUserInfo);
        }

        throw new RuntimeException("新用户注册失败");
    }
}
