package com.cook.entity;

import lombok.Data;

//企业
@Data
public class Enterprise {

    private String id;

    private String name;

    //联系方式
    private String contactWay;

    //工作区域
    private String workArea;

    //地址
    private String address;


}