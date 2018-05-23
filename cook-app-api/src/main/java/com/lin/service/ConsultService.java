package com.lin.service;

import com.cook.entity.Consult;
import com.github.pagehelper.PageInfo;

/**
 * Created by Administrator on 2018/5/18.
 */
public interface ConsultService {
	
	// 评论列表(分页)
	PageInfo commentList( String consultId, int pageNum );
	
	// 资讯列表按类型划分(分页)
	PageInfo consultList( int consultType, int pageNum );
	
	// 资讯点赞
	Integer consultAdmire( String consultId, String userId );
	
	// 资讯评论点赞
	Integer commentAdmire( String commentId, String userId );
	
	// 查看资讯详情
	Consult getArticle( String consultId );
	
	// 添加评论
	String addComment( String consultId, String commentUserId, String content );
}
