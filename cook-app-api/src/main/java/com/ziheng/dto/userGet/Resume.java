package com.ziheng.dto.userGet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

/**
 * @description: 用户的简历实体类
 * @author: ziHeng
 * @create: 2018-05-16 13:40
 **/
@Data
public class Resume {

    //资讯id
    private String resumeId;

    //标题
    private String title;

    //用户名
    private String userName;

    //性别
    private String sex;

    //生日期限
    @JsonIgnore
    private Long birthDate;

    private Integer age;

    private String phone;



}
