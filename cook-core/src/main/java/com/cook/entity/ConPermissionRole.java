package com.cook.entity;

import lombok.Data;

import java.util.UUID;

@Data
public class ConPermissionRole {

    private String id ;

    private String sysRoleId;

    private String sysPermissionId;

    public ConPermissionRole() {
        this.id = UUID.randomUUID().toString();
    }
}