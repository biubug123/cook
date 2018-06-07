package com.cook.security.component;

import com.cook.dao.SysUserMapper;
import com.cook.entity.SysUser;
import com.cook.util.PhoneAndEmailUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.security.SocialUser;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Component;

/**
 * @description: 用户身份
 * @author: ziHeng
 * @create: 2018-05-24 10:29
 **/
@Component
@ConditionalOnProperty(prefix = "cook.security",name = "token",havingValue = "true")
public class MyUserDetailsService implements UserDetailsService,SocialUserDetailsService{

    @Autowired
    private SysUserMapper sysUserMapper;

    private static Logger logger= LoggerFactory.getLogger(MyUserDetailsService.class);

    public static String userId = "";

    //普通登录时用户身份验证
    @Override
    public UserDetails loadUserByUsername(String phoneOrNum) throws UsernameNotFoundException {
        System.out.println("APP或系统");
        System.out.println(phoneOrNum);
        return buildUser(phoneOrNum,0);

    }

    //第三方登录时用户身份验证
    @Override
    public SocialUserDetails loadUserByUserId(String userId) throws UsernameNotFoundException {
        System.out.println("第三方");
        return buildUser(userId,1);

    }


    private synchronized SocialUserDetails buildUser(String tag,int type) {
        SysUser sysUser;
        logger.info(tag);
        //手机号或系统账号查找
        if(type == 0){
            //如果是手机号
            if(PhoneAndEmailUtil.checkTelephone(tag)){
                sysUser = sysUserMapper.userByPhone(tag);
            }else {
                //账号查找
                sysUser = sysUserMapper.userByAccountNum(tag);
            }

        }else {
            sysUser = sysUserMapper.selectByPrimaryKey(tag);
        }
        if (sysUser == null){
            logger.error("用户不存在");
            throw new UsernameNotFoundException("用户不存在");
        }
        userId = sysUser.getId();
        //根据用户名查找用户信息
        //根据查找到的用户信息判断用户是否被冻结
        //String accountNum = sysUser.getAccountNum();
        String password = sysUser.getPassword();
        return new SocialUser(tag, password,
                true, true, true, true,
                AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_ADMIN"));
    }
}
