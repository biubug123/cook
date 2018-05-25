package com.lin.dto;

import com.cook.entity.Consult;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by Administrator on 2018/5/19.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class ConsultVideoDetailDTO extends Consult {
	
	//标题
	private String title;
	
	//播放次数
	private Integer playCount;
	
	//点赞数量
	private Integer admireCount;
	
	//视频路径
	private String videoUrl;
	
	// 是否已经点赞
	private Integer isAdmired;
}
