package com.cook.entity;

import lombok.Data;

@Data
public class SysPermission {
    private String id;

    private String url;

    private String method;

    private String description;

    private String alias;

}