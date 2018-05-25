package com.lin.dto;

import com.cook.entity.Consult;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by Administrator on 2018/5/19.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ConsultImageTextDetailDTO extends Consult {
	
	//标题
	private String title;
	
	//图片名称
	private String imageName;
	
	//内容
	private String content;
	
	//点赞数量
	private Integer admireCount;
	
	private Integer isAdmired;
}
