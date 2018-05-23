package com.lin.controller;

import com.cook.response.ApiResponse;
import com.github.pagehelper.PageInfo;
import com.lin.service.impl.ConsultServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Administrator on 2018/5/18.
 */
@RestController
@RequestMapping("consult")
public class ConsultController {
	
	@Autowired
	private ConsultServiceImpl consultService;
	
	//	评论列表（分页）
//	 新增：  添加一个是否已经对该评论进行了点赞的提示
//	 待解决：从seesion中获取用户信息，列表中要判断用户是否已经点赞过
	@GetMapping(value = "commentList/{consultId}/{pageNum}")
	public ApiResponse commentList( @PathVariable String consultId, @PathVariable int pageNum ) {
		PageInfo pageInfo = consultService.commentList( consultId, pageNum );
		return IsNullOfData( pageInfo );
	}
	
	//	资讯列表按类型划分（分页）
	@PostMapping(value = "consultList")
	public ApiResponse consultList( @RequestParam(value = "consultType", defaultValue = "0") int consultType, @RequestParam("pageNum") int pageNum ) {
		PageInfo pageInfo = consultService.consultList( consultType, pageNum );
		return IsNullOfData( pageInfo );
	}
	
	// 资讯点赞
	// 	返回：是否已经点赞   点赞总数
	@PostMapping(value = "consultAdmire")
	public ApiResponse consultAdmire( @RequestParam(value = "consultId") String consultId, @RequestParam("userId") String userId ) {
		return ApiResponse.ofSuccess( consultService.consultAdmire( consultId, userId ) );
	}
	
	// 评论点赞
	// 	返回：是否已经点赞   点赞总数
	@PostMapping(value = "commentAdmire")
	public ApiResponse commentAdmire( @RequestParam(value = "commentId") String commentId, @RequestParam("userId") String userId ) {
		return ApiResponse.ofSuccess( consultService.commentAdmire( commentId, userId ) );
	}
	
	// 资讯详情
	@GetMapping(value = "getArticle/{consultId}")
	public ApiResponse getArticle( @PathVariable String consultId ) {
		return ApiResponse.ofSuccess( consultService.getArticle( consultId ) );
	}
	
	// 添加评论
	@PostMapping(value = "addComment")
	public ApiResponse addComment( @RequestParam(value = "consultId") String consultId, @RequestParam("commentUserId") String commentUserId, @RequestParam("content") String content ) {
		return ApiResponse.ofSuccess( consultService.addComment( consultId, commentUserId, content ) );
	}
	
	private ApiResponse IsNullOfData( PageInfo pageInfo ) {
		if( pageInfo.getSize() == 0 ) {
			ApiResponse apiResponse = new ApiResponse();
			apiResponse.setCode( 200 );
			apiResponse.setMessage( "没有查询结果" );
			return apiResponse;
		}
		return ApiResponse.ofSuccess( pageInfo );
	}
}