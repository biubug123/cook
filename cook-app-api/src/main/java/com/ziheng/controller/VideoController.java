package com.ziheng.controller;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.auth.sts.AssumeRoleRequest;
import com.aliyuncs.auth.sts.AssumeRoleResponse;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoRequest;
import com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse;
import com.cook.constant.Security;
import com.cook.dao.VideoMapper;
import com.cook.response.ApiResponse;
import com.ziheng.dto.VideoCallBackDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.web.bind.annotation.*;


/**
 * @description: 视频服务api
 * @author: ziHeng
 * @create: 2018-06-02 12:02
 **/
@RestController
@Api(value = "video",tags = "视频Api")
@RequestMapping("/video")
public class VideoController {

    //1、前端APP获取StsToken，然后上传视频到阿里云点播(上传成功后获取返回的videoId)
    //2、前端App发送videoId、视频的title和content给服务端,（成功后返回数据库存储后的id）
    //3、视频点播转码后回调服务端(),服务端根据返回的videoId更新update数据库其播放地址和封面地址

    private VideoMapper videoMapper;

    public VideoController(VideoMapper videoMapper) {
        this.videoMapper = videoMapper;
    }

    /**
      * @Description: STS授权(给APP一个STS授权码)
      * @Author: ziHeng
      * @Date: 2018/6/4 下午2:43
      * @Param: []
      * @return: com.cook.response.ApiResponse
      */ 
    @GetMapping("/getStsToken")
    @ApiOperation(value = "获取视频临时StStoken",notes = "该token只适用于视频相关权限")
    public ApiResponse getSts(){
        return ApiResponse.ofSuccess(stsGen());
    }

    /**
      * @Description: APP上传完第三方视频后，后台存储videoId
      * @Author: ziHeng
      * @Date: 2018/6/4 下午2:51
      * @Param: [videoId, title, content]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/storeVideo")
    @ApiOperation(value = "APP上传完第三方视频后，后台存储videoId")
    public ApiResponse storeVideo(@RequestParam("videoId") String videoId,
                                  @ApiParam("视频标题")@RequestParam String title,
                                  @ApiParam("视频描述内容")@RequestParam String content){
        //存储到数据库并返回该数据库记录id值
        return null;
    }

    /** 
      * @Description: 视频转码完成后回调Url
      * @Author: ziHeng
      * @Date: 2018/6/4 下午3:13
      * @Param: [videoCallBackDto]
      * @return: com.cook.response.ApiResponse
      */ 
    @GetMapping("/video/upLoadCallBack")
    @ApiOperation(value = "视频转码完成后回调Url")
    public ApiResponse getUrl(@RequestBody VideoCallBackDto videoCallBackDto){
        //视频地址
        String mp4Url =videoCallBackDto.getFileUrl();
        //视频封面
        String coverUrl = videoCallBackDto.getCoverUrl();
        //视频id
        String videoId = videoCallBackDto.getVideoId();
        //条件更新数据库(根据视频id判断update)
        return null;
    }


    /**
      * @Description: 获取STS授权码
      * @Author: ziHeng
      * @Date: 2018/6/4 下午2:45
      * @Param: []
      * @return: com.aliyuncs.auth.sts.AssumeRoleResponse
      */
    private AssumeRoleResponse stsGen(){
        String endpoint = "sts.aliyuncs.com";
        String roleArn = "acs:ram::1409506853807566:role/videomanager";
        String policy = "{\n" +
                "    \"Version\": \"1\", \n" +
                "    \"Statement\": [\n" +
                "        {\n" +
                "            \"Action\": [\n" +
                "                \"oss:*\"\n" +
                "            ], \n" +
                "            \"Resource\": [\n" +
                "                \"acs:oss:*:*:*\" \n" +
                "            ], \n" +
                "            \"Effect\": \"Allow\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        try {
            // Init ACS Client
            DefaultProfile.addEndpoint("cn-shanghai", "cn-shanghai", "Sts", endpoint);
            IClientProfile profile = DefaultProfile.getProfile("cn-shanghai", Security.aliAccessKeyId, Security.aliAccessKeySecret);
            String roleSessionName = RandomStringUtils.randomAlphabetic(11);
            DefaultAcsClient client = new DefaultAcsClient(profile);
            final AssumeRoleRequest request = new AssumeRoleRequest();
            request.setMethod(MethodType.POST);
            request.setRoleArn(roleArn);
            request.setRoleSessionName(roleSessionName);
            request.setPolicy(policy); // Optional
            final AssumeRoleResponse response = client.getAcsResponse(request);
            return response;
        } catch (ClientException e) {
            throw new RuntimeException(e.getErrCode());
        }
    }


    /**
      * @Description: 通过视频id获取视频信息
      * @Author: ziHeng
      * @Date: 2018/6/4 下午3:13
      * @Param: [videoId]
      * @return: com.aliyuncs.vod.model.v20170321.GetPlayInfoResponse
      */
    public static GetPlayInfoResponse getPlayInfo(String videoId) {
        DefaultProfile profile = DefaultProfile.getProfile("cn-shanghai", "LTAIpqpDKdD8ICoS", "LXHkQZFuaA5snsEjdoG8JxkDjkCAeK");
        DefaultAcsClient client = new DefaultAcsClient(profile);
        GetPlayInfoRequest request = new GetPlayInfoRequest();
        request.setVideoId(videoId);  // 准备播放的视频ID
        //获取mp4格式
        request.setFormats("mp4");
        //request.setAuthTimeout(1800l);
        GetPlayInfoResponse response;
        try {
            response = client.getAcsResponse(request);
        } catch (ServerException e) {
            throw new RuntimeException(e);
        } catch (ClientException e) {
            throw new RuntimeException(e);
        }
        return response;
    }


}


