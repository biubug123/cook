package com.cook.entity;

import lombok.Data;

@Data
public class Proxy {

    private String id;

    private String name;

    //联系方式
    private String contactWay;

    //工作区域
    private String workArea;

    //详细地址
    private String address;


}