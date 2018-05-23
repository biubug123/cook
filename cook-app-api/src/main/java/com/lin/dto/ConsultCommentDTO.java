package com.lin.dto;

import lombok.Data;

/**
 * Created by Administrator on 2018/5/18.
 */
@Data
public class ConsultCommentDTO {
	
	private String commentId;
	
	private String username;
	
	private String headImgName;
	
	private Long commentDate;
	
	private String content;
	
}
