package com.system.service.Impl;

import com.cook.dao.ConUserRoleMapper;
import com.cook.dao.SysPermissionMapper;
import com.cook.dao.SysUserMapper;
import com.cook.entity.ConUserRole;
import com.cook.entity.SysPermission;
import com.cook.entity.SysRole;
import com.cook.entity.SysUser;
import com.cook.response.ApiResponse;
import com.system.dao.SystemMapper;
import com.system.dto.ResourceDto;
import com.system.service.ManagementService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

/**
 * @description: 实现类
 * @author: ziHeng
 * @create: 2018-06-20 15:57
 **/
@Service
public class ManagementServiceImpl implements ManagementService {

    private SysUserMapper sysUserMapper;

    private PasswordEncoder passwordEncoder;

    private ConUserRoleMapper conUserRoleMapper;

    private SysPermissionMapper sysPermissionMapper;

    private SystemMapper systemMapper;

    public ManagementServiceImpl(SysUserMapper sysUserMapper, PasswordEncoder passwordEncoder, ConUserRoleMapper conUserRoleMapper, SysPermissionMapper sysPermissionMapper, SystemMapper systemMapper) {
        this.sysUserMapper = sysUserMapper;
        this.passwordEncoder = passwordEncoder;
        this.conUserRoleMapper = conUserRoleMapper;
        this.sysPermissionMapper = sysPermissionMapper;
        this.systemMapper = systemMapper;
    }

    @Override
    @Transactional
    public Integer insertManager(String accountNum,
                                     String sysRoleId,
                                     String password) {

        password = passwordEncoder.encode(password);
        SysUser sysUser = new SysUser();
        String sysUserId = UUID.randomUUID().toString();
        sysUser.setId(sysUserId);
        sysUser.setAccountNum(accountNum);
        sysUser.setPassword(password);
        sysUser.setEnrollDate(new Date().getTime()/1000);
        sysUser.setLastLoginDate(new Date().getTime()/1000);
        //角色表
        ConUserRole conUserRole = new ConUserRole();
        conUserRole.setId(UUID.randomUUID().toString());
        conUserRole.setSysRoleId(sysRoleId);
        conUserRole.setSysUserId(sysUserId);
        int result = sysUserMapper.insertSelective(sysUser);

        //角色新建成功
        if (result>0){
            return conUserRoleMapper.insert(conUserRole);
        }

        throw new RuntimeException();
    }

    @Override
    public List<ResourceDto> getResourceList() {
        List<ResourceDto> sysPermissions = systemMapper.listPermission();
        for(ResourceDto resourceDto:sysPermissions){
            String resourceId = resourceDto.getKey();
            //引用次数
            int count = systemMapper.countPermissionId(resourceId);
            resourceDto.setCitedTime(count);
        }
        return sysPermissions;
    }

    //过滤
    @Override
    public List<ResourceDto> getFilterResourceList(String roleId) {
        List<ResourceDto> sysPermissions = systemMapper.listPermission();
        List<SysRole> resourceByRoleId = systemMapper.getResourceByRoleId(roleId);
        Iterator<ResourceDto> iterator = sysPermissions.iterator();
        while (iterator.hasNext()){
            String resourceId = iterator.next().getKey();
            for(SysRole sysRole:resourceByRoleId){
                if(sysRole.getId().equals(resourceId)){
                    iterator.remove();
                }
            }
        }
        return sysPermissions;
    }
}
