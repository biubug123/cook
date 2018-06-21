package com.system.service;

import com.cook.response.ApiResponse;
import com.system.dto.ResourceDto;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface ManagementService {



    //新增管理员
    Integer insertManager(String accountNum,
                              String sysRoleId,
                              String password);

    //获取访问资源列表
    List<ResourceDto> getResourceList();

    //获取授权访问资源列(过滤已选择列)
    List<ResourceDto> getFilterResourceList(String roleId);

}
