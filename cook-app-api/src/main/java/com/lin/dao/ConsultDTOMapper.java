package com.lin.dao;

import com.cook.entity.Consult;
import com.lin.dto.ConsultCommentDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/5/18.
 */
public interface ConsultDTOMapper {
	
	List<ConsultCommentDTO> listConsultComment( @Param("consultId") String consultId );
	
	List<Consult> consultList( @Param("consultType") int consultType );
	
	Integer selectConsultAdmire( @Param("consultId") String consultId, @Param("userId") String userId );
	
	void delectConsultAdmire( @Param("consultId") String consultId, @Param("userId") String userId );
	
	Integer countConsultAdmire();
	
	Integer selectCommentAdmire( @Param("commentId") String commentId, @Param("userId") String userId );
	
	void delectCommentAdmire( @Param("commentId") String commentId, @Param("userId") String userId );
	
	Integer countCommentAdmire();
	
	Integer existContextOfComment( @Param("consultId") String consultId, @Param("commentUserId") String commentUserId, @Param("content") String content );
}
