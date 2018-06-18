package com.system.controller;

import com.cook.dao.SysUserMapper;
import com.cook.entity.SysUser;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.dao.SystemMapper;
import com.system.dto.UserDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.UUID;


/**
 * @description: 管理Api
 * @author: ziHeng
 * @create: 2018-06-17 08:32
 **/

@RestController
@RequestMapping("/managementApi")
public class ManagementApi {

    private PasswordEncoder passwordEncoder;

    private SystemMapper systemMapper;

    private SysUserMapper sysUserMapper;

    public ManagementApi(PasswordEncoder passwordEncoder, SystemMapper systemMapper, SysUserMapper sysUserMapper) {
        this.passwordEncoder = passwordEncoder;
        this.systemMapper = systemMapper;
        this.sysUserMapper = sysUserMapper;
    }

    /**
      * @Description: 获取系统用户列表
      * @Author: ziHeng
      * @Date: 2018/6/17 10:03 PM
      * @Param: [pageNum]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getUser")
    public ApiResponse getUser(@RequestParam(required = false,defaultValue = "1") Integer pageNum){
        // 分页查询单页面内容大小
        PageHelper.startPage(pageNum,10,"last_login_date desc");
        PageInfo<UserDto> pageInfo = new PageInfo<>(systemMapper.sysUserList(1));
        return ApiResponse.ofSuccess(pageInfo);
    }

    /**
      * @Description: 获取系统管理员列表
      * @Author: ziHeng
      * @Date: 2018/6/17 10:03 PM
      * @Param: [pageNum]
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/getAdmin")
    public ApiResponse getSys(@RequestParam(required = false,defaultValue = "1") Integer pageNum){
        // 分页查询单页面内容大小
        PageHelper.startPage(pageNum,10,"last_login_date desc");
        PageInfo<UserDto> pageInfo = new PageInfo<>(systemMapper.sysUserList(0));
        return ApiResponse.ofSuccess(pageInfo);
    }

    /*
      * @Description: 系统管理员信息更新
      * @Author: ziHeng
      * @Date: 2018/6/17 10:08 PM
      * @Param: [sysUserId, accountNum, roleName, password]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/updateAdmin")
    public ApiResponse updateAdmin(@RequestParam String sysUserId,
                                   @RequestParam String accountNum,
                                   @RequestParam String roleName,
                                   @RequestParam String password){

        password = passwordEncoder.encode(password);
        SysUser sysUser = new SysUser();
        sysUser.setId(sysUserId);
        sysUser.setAccountNum(accountNum);
        sysUser.setPassword(password);
        //角色表

        return ApiResponse.ofSuccess(sysUserMapper.updateByPrimaryKeySelective(sysUser));
    }

    //删除管理员
    @PostMapping("/deleteAdmin")
    public ApiResponse deleteAdmin(@RequestParam String sysUserId){
        return ApiResponse.ofSuccess(sysUserMapper.deleteByPrimaryKey(sysUserId));
    }

    //新增管理员
    @PostMapping("insertAdmin")
    public ApiResponse insertAdmin(@RequestParam String accountNum,
                                   @RequestParam String roleName,
                                   @RequestParam String password){
        password = passwordEncoder.encode(password);
        SysUser sysUser = new SysUser();
        sysUser.setId(UUID.randomUUID().toString());
        sysUser.setAccountNum(accountNum);
        sysUser.setPassword(password);
        sysUser.setEnrollDate(new Date().getTime()/1000);
        sysUser.setLastLoginDate(new Date().getTime()/1000);
        //角色表

        return ApiResponse.ofSuccess(sysUserMapper.insertSelective(sysUser));
    }

}
