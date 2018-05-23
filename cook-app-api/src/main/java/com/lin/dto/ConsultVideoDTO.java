package com.lin.dto;

import lombok.Data;

/**
 * Created by Administrator on 2018/5/19.
 */
@Data
public class ConsultVideoDTO {
	
	private String consultId;
	
	private String title;
	
	private String publisherName;
	
	private String videoUrl;
	
	private Integer playCount;
	
	private Long publishDate;
	
}
