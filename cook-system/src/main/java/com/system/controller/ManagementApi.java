package com.system.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cook.dao.*;
import com.cook.entity.ConPermissionRole;
import com.cook.entity.SysPermission;
import com.cook.entity.SysRole;
import com.cook.entity.SysUser;
import com.cook.response.ApiResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.dao.SystemMapper;
import com.system.dto.UserDto;
import com.system.service.ManagementService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
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

    private SysPermissionMapper sysPermissionMapper;

    private SysRoleMapper sysRoleMapper;

    private ConUserRoleMapper conUserRoleMapper;

    private ConPermissionRoleMapper conPermissionRoleMapper;

    private ManagementService managementServiceImpl;

    public ManagementApi(PasswordEncoder passwordEncoder, SystemMapper systemMapper, SysUserMapper sysUserMapper, SysPermissionMapper sysPermissionMapper, SysRoleMapper sysRoleMapper, ConUserRoleMapper conUserRoleMapper, ConPermissionRoleMapper conPermissionRoleMapper, ManagementService managementServiceImpl) {
        this.passwordEncoder = passwordEncoder;
        this.systemMapper = systemMapper;
        this.sysUserMapper = sysUserMapper;
        this.sysPermissionMapper = sysPermissionMapper;
        this.sysRoleMapper = sysRoleMapper;
        this.conUserRoleMapper = conUserRoleMapper;
        this.conPermissionRoleMapper = conPermissionRoleMapper;
        this.managementServiceImpl = managementServiceImpl;
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
                                   @RequestParam String sysRoleId,
                                   @RequestParam String password){

        return ApiResponse.ofSuccess(managementServiceImpl.insertManager(accountNum,sysRoleId,password));
    }

    //新增角色
    @PostMapping("/insertRole")
    public ApiResponse insertRole(@RequestParam String roleName){
        SysRole sysRole = new SysRole();
        sysRole.setId(UUID.randomUUID().toString());
        sysRole.setName(roleName);
        sysRole.setCreateDate(new Date().getTime()/1000);

        return ApiResponse.ofSuccess(sysRoleMapper.insert(sysRole));
    }

    //删除角色
    @PostMapping("/deleteRole")
    public ApiResponse deleteRole(@RequestParam String roleId){

        return ApiResponse.ofSuccess(sysRoleMapper.deleteByPrimaryKey(roleId));
    }

    //修改角色名称
    @PostMapping("/updateRole")
    public ApiResponse updateRole(@RequestParam String roleId,
                                  @RequestParam String roleName){
        SysRole sysRole = new SysRole();
        sysRole.setId(roleId);
        sysRole.setName(roleName);
        return ApiResponse.ofSuccess(sysRoleMapper.updateByPrimaryKeySelective(sysRole));
    }



    //更新资源
    @PostMapping("/updateResource")
    public ApiResponse updateResource(@RequestParam String resourceId,
                                      @RequestParam String alias,
                                      @RequestParam String url,
                                      @RequestParam String method,
                                      @RequestParam String description){
        SysPermission sysPermission = new SysPermission();
        sysPermission.setId(resourceId);
        sysPermission.setUrl(url);
        sysPermission.setMethod(method);
        sysPermission.setDescription(description);
        sysPermission.setAlias(alias);

        return ApiResponse.ofSuccess(sysPermissionMapper.updateByPrimaryKey(sysPermission));
    }

    //删除角色
    @PostMapping("/deleteResource")
    public ApiResponse deleteResource(@RequestParam String resourceId){

        return ApiResponse.ofSuccess(sysPermissionMapper.deleteByPrimaryKey(resourceId));
    }

    //新增资源
    @PostMapping("/insertResource")
    public ApiResponse insertResource(@RequestParam String url,
                                      @RequestParam String alias,
                                      @RequestParam String method,
                                      @RequestParam String description){
        SysPermission sysPermission = new SysPermission();
        sysPermission.setId(UUID.randomUUID().toString());
        sysPermission.setUrl(url);
        sysPermission.setMethod(method);
        sysPermission.setDescription(description);
        sysPermission.setAlias(alias);

        return ApiResponse.ofSuccess(sysPermissionMapper.insert(sysPermission));
    }

    //查询所有角色
    @GetMapping("/getRoleList")
    public ApiResponse getRoleList(){
        return ApiResponse.ofSuccess(systemMapper.sysRoleList());
    }


    //查询出所有资源(授权列)
    @GetMapping("/getFilterResource")
    public ApiResponse getAllResource(@RequestParam String roleId){
        return ApiResponse.ofSuccess(managementServiceImpl.getFilterResourceList(roleId));
    }

    //获取访问资源列表
    @GetMapping("/getResourceList")
    public ApiResponse getResourceList(){

        return ApiResponse.ofSuccess(managementServiceImpl.getResourceList());
    }


    //查询某角色已拥有资源(授权列)
    @GetMapping("/getResourceByRoleId")
    public ApiResponse getResourceByRoleId(@RequestParam String roleId){

        return ApiResponse.ofSuccess(systemMapper.getResourceByRoleId(roleId));
    }

    //查询某角色已拥有资源(授权列)
    @PostMapping("/conRolePermission")
    public ApiResponse conRolePermission(@RequestParam String conRolePermission){
        List<ConPermissionRole> conPermissionRoles = JSON.parseArray(conRolePermission,ConPermissionRole.class);
        return ApiResponse.ofSuccess(systemMapper.insertConRolePermission(conPermissionRoles));
    }



}
