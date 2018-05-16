package com.ziheng.dto.user;

import lombok.Data;

/**
 * @description: 用户的简历实体类
 * @author: ziHeng
 * @create: 2018-05-16 13:40
 **/
@Data
public class Resume {

    private String resumeId;

    private String title;

    private String userName;

    private String sex;

    private Integer age;

    private String phone;

}
