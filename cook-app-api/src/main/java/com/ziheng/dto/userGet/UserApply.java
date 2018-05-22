package com.ziheng.dto.userGet;

import lombok.Data;

/**
 * @description: 用户申请投递实体类
 * @author: ziHeng
 * @create: 2018-05-17 11:24
 **/
@Data
public class UserApply {

    //招聘申请id
    private String recruitApplyId;

    private String foodTypeName;

    private String publisherName;

    private String jobName;

    private long applyDate;

}
