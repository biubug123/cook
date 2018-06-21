package com.system.dto;

import lombok.Data;

/**
 * @description: 访问资源列
 * @author: ziHeng
 * @create: 2018-06-20 17:28
 **/
@Data
public class ResourceDto {

    private String key;

    private String url;

    private String method;

    private String description;

    private String alias;

    private int citedTime;



}
