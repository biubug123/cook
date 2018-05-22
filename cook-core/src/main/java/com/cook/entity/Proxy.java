package com.cook.entity;

import lombok.Data;

@Data
public class Proxy {

    private String id;

    //用户id
    private String userId;

    private String name;

    //联系方式
    private String contactWay;

    //工作区域
    private String workArea;

    //详细地址
    private String address;


    public Proxy() {
    }

    public Proxy(String id, String userId, String name, String contactWay, String workArea, String address) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.contactWay = contactWay;
        this.workArea = workArea;
        this.address = address;
    }
}