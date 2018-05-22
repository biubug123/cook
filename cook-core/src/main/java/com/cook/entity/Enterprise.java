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

    public Enterprise() {
    }

    public Enterprise(String id, String name, String contactWay, String workArea, String address) {
        this.id = id;
        this.name = name;
        this.contactWay = contactWay;
        this.workArea = workArea;
        this.address = address;
    }
}