package com.system.controller;

import com.cook.dao.FoodTypeMapper;
import com.cook.dao.JobMapper;
import com.cook.entity.FoodType;
import com.cook.entity.Job;
import com.cook.response.ApiResponse;
import com.cook.util.RandomUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.system.dao.SystemMapper;
import com.system.dto.FoodTypeDto;
import com.system.dto.JobTypeDto;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/**
 * @description: 菜系api
 * @author: ziHeng
 * @create: 2018-06-12 13:05
 **/
@RestController
@RequestMapping("/commonTableApi")
public class CommonSysController {

    @Value("${cook.logo.upload-path}")
    private String uploadPath;


    private FoodTypeMapper foodTypeMapper;

    private SystemMapper systemMapper;

    private JobMapper jobMapper;

    public CommonSysController(FoodTypeMapper foodTypeMapper, SystemMapper systemMapper, JobMapper jobMapper) {
        this.foodTypeMapper = foodTypeMapper;
        this.systemMapper = systemMapper;
        this.jobMapper = jobMapper;
    }


    /**
      * @Description: 获取菜系列表
      * @Author: ziHeng
      * @Date: 2018/6/12 1:34 PM
      * @return: com.cook.response.ApiResponse
      */
    @GetMapping("/foodTypeList")
    public ApiResponse getFoodTypeList(@RequestParam(required = false,defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,10);
        PageInfo<FoodTypeDto> pageInfo = new PageInfo<>(systemMapper.foodTypeList());
        return ApiResponse.ofSuccess(pageInfo);
    }

    /**
     * @Description: 获取职位列表
     * @Author: ziHeng
     * @Date: 2018/6/12 1:34 PM
     * @return: com.cook.response.ApiResponse
     */
    @GetMapping("/jobTypeList")
    public ApiResponse getJobTypeList(@RequestParam(required = false,defaultValue = "1") Integer pageNum){
        PageHelper.startPage(pageNum,10);
        PageInfo<JobTypeDto> pageInfo = new PageInfo<>(systemMapper.jobTypeList());
        return ApiResponse.ofSuccess(pageInfo);
    }

    /**
     * @Description: 根据菜系id删除
     * @Author: ziHeng
     * @Date: 2018/6/12 1:31 PM
     * @Param: [foodTypeId]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/updateFood")
    public ApiResponse updateFoodByKey(@RequestParam("foodTypeId") String foodTypeId,
                                        @RequestParam("foodTypeName") String foodTypeName){
        //上传的图片名
        //String uploadIconName = StringUtils.substring(uploadImageUrl, uploadImageUrl.lastIndexOf("/")+1,uploadImageUrl.lastIndexOf("."));
        //删除之前的图片


        //上传的图片名改为删除之前的图片名
        FoodType foodType = new FoodType();
        foodType.setName(foodTypeName);
        foodType.setId(foodTypeId);
        return ApiResponse.ofSuccess(foodTypeMapper.updateByPrimaryKeySelective(foodType));
    }

    /**
      * @Description: 根据菜系id删除
      * @Author: ziHeng
      * @Date: 2018/6/12 1:31 PM
      * @Param: [foodTypeId]
      * @return: com.cook.response.ApiResponse
      */
    @PostMapping("/deleteFood")
    public ApiResponse deleteFood(@RequestParam("foodTypeId") String foodTypeId){
        return ApiResponse.ofSuccess(foodTypeMapper.deleteByPrimaryKey(foodTypeId));
    }

    /**
     * @Description: 新增职位
     * @Author: ziHeng
     * @Date: 2018/6/12 1:31 PM
     * @Param: [foodTypeId]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/insertJob")
    public ApiResponse insertJob(@RequestParam("jobName") String jobName){
        String uuid = UUID.randomUUID().toString();
        Job job = new Job();
        job.setId(uuid);
        job.setName(jobName);
        return ApiResponse.ofSuccess(jobMapper.insert(job));
    }

    /**
     * @Description: 新增菜系
     * @Author: ziHeng
     * @Date: 2018/6/12 1:31 PM
     * @Param: [foodTypeId]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/insertFoodType")
    public ApiResponse insertFoodType(@RequestParam("foodTypeName") String foodTypeName,
                                      @RequestParam("iconName") String iconName){
        String uuid = UUID.randomUUID().toString();
        FoodType foodType = new FoodType();
        foodType.setId(uuid);
        foodType.setName(foodTypeName);
        foodType.setIconName(iconName);
        return ApiResponse.ofSuccess(foodTypeMapper.insert(foodType));
    }
    

    /** 
      * @Description: 更新职业
      * @Author: ziHeng
      * @Date: 2018/6/12 7:05 PM
      * @Param: [jobTypeId, jobName]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/updateJob")
    public ApiResponse updateJobByKey(@RequestParam("jobTypeId") String jobTypeId,
                                      @RequestParam("jobName") String jobName){
        Job job = new Job();
        job.setId(jobTypeId);
        job.setName(jobName);
        return ApiResponse.ofSuccess(jobMapper.updateByPrimaryKey(job));
    }
    
    /** 
      * @Description: 删除职业
      * @Author: ziHeng
      * @Date: 2018/6/12 7:05 PM
      * @Param: [jobTypeId]
      * @return: com.cook.response.ApiResponse
      */ 
    @PostMapping("/deleteJob")
    public ApiResponse deleteJob(@RequestParam("jobTypeId") String jobTypeId){
        return ApiResponse.ofSuccess(jobMapper.deleteByPrimaryKey(jobTypeId));
    }



    /**
     * @Description: 图片的上传
     * @Author: ziHeng
     * @Date: 2018/6/2 上午11:44
     * @Param: [file:MultipartFile文件对象]
     * @return: com.cook.response.ApiResponse
     */
    @PostMapping("/logoUpload")
    public ApiResponse upload(MultipartFile file) throws Exception {

        String fileName = RandomUtil.getImgName(file.getOriginalFilename());

        if(file.isEmpty()){
            return ApiResponse.ofError(ApiResponse.Status.EMPTY_FILE);
        }

        //新文件的路径名、文件名
        File remoteFile = new File(uploadPath, fileName);

        file.transferTo(remoteFile);
        return ApiResponse.ofSuccess(fileName);

    }

}
