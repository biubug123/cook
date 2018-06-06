package com.ziheng.controller;

import com.cook.response.ApiResponse;
import com.cook.util.RandomUtil;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.jni.FileInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @description: 文件controller
 * @author: ziHeng
 * @create: 2018-06-02 10:50
 **/
@RestController
@RequestMapping("/file")
public class FileController {

    private Logger logger= LoggerFactory.getLogger(getClass());

    @Value("${cook.image.upload-path}")
    private String path;

    /**
      * @Description: 图片的上传
      * @Author: ziHeng
      * @Date: 2018/6/2 上午11:44
      * @Param: [file:MultipartFile文件对象]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/imageUpload")
    public ApiResponse upload(MultipartFile file) throws Exception {

        String fileName = RandomUtil.getImgName(file.getOriginalFilename());

        if(file.isEmpty()){
            return ApiResponse.ofError(ApiResponse.Status.EMPTY_FILE);
        }

        //新文件的路径名、文件名
        File remoteFile = new File(path, fileName);
        String filePath = remoteFile.getPath();

        try {
            Thumbnails.of(file.getInputStream())
                    //图片缩放
                    .scale(0.5)
                    //图片质量
                    .outputQuality(0.5).toFile(filePath);
            return ApiResponse.ofSuccess(remoteFile.getName());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
      * @Description: 文件下载
      * @Author: ziHeng
      * @Date: 2018/6/2 上午11:45
      * @Param: [fileName:将要下载的图片名, response]
      * @return: void
      */
    @GetMapping("/fileDownload/{fileName}")
    public void download(@PathVariable String fileName,HttpServletResponse response){

        try(
            InputStream inputStream=new FileInputStream(new File(path,fileName));
            OutputStream outputStream=response.getOutputStream();
        ){
            response.setContentType("application/x-download");//设置响应response为下载类型

            //MIME协议 浏览器接到请求头就激活下载对话框 设置下载默认名字
            //可能浏览器有默认行为不弹出对话框 默认下载到指定位置
            response.addHeader("Content-Disposition","attachment;filename="+fileName);
            //把文件内容写到响应
            IOUtils.copy(inputStream,outputStream);
            //flush缓冲区数据
            outputStream.flush();
        }catch(Exception e){
            throw new RuntimeException(e);
        }

    }




}
