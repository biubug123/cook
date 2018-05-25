package com.cook.security;

import com.cook.dao.SysUserMapper;
import com.cook.entity.SysUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.security.SocialUser;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.stereotype.Component;

/**
 * @description: 用户身份
 * @author: ziHeng
 * @create: 2018-05-24 10:29
 **/
@Component
public class MyUserDetailsService implements UserDetailsService{

    @Autowired
    private SysUserMapper sysUserMapper;

    private static Logger logger= LoggerFactory.getLogger(MyUserDetailsService.class);

    public static String userId = "";

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        return buildUser(username);
    }


    private SocialUserDetails buildUser(String phone) {
        SysUser sysUser = sysUserMapper.userByPhone(phone);
        if (sysUser == null){
            throw new UsernameNotFoundException("用户不存在");
        }
        userId = sysUser.getId();
        //根据用户名查找用户信息
        //根据查找到的用户信息判断用户是否被冻结
        String accountNum = sysUser.getAccountNum();
        String password = sysUser.getPassword();
        return new SocialUser(accountNum, password,
                true, true, true, true,
                AuthorityUtils.commaSeparatedStringToAuthorityList("ROLE_ADMIN"));
    }
}
