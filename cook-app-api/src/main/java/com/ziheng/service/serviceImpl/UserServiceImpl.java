package com.ziheng.service.serviceImpl;

import com.cook.dao.UserBrowseMapper;
import com.cook.dao.UserCollectMapper;
import com.cook.entity.UserBrowse;
import com.cook.entity.UserCollect;
import com.cook.response.ApiResponse;
import com.ziheng.dao.UserGetDao;
import com.ziheng.dto.userGet.Consult;
import com.ziheng.dto.userGet.Job;
import com.ziheng.dto.userGet.Resume;
import com.ziheng.service.UserGetService;
import com.ziheng.service.UserPostService;
import com.ziheng.util.ZiHengUtil;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @description: 用户业务实现层
 * @author: ziHeng
 * @create: 2018-05-16 17:05
 **/
@Service
public class UserServiceImpl implements UserGetService,UserPostService {

    private UserGetDao userGetDao;

    private UserCollectMapper userCollectMapper;

    private UserBrowseMapper userBrowseMapper;

    public UserServiceImpl(UserGetDao userGetDao, UserCollectMapper userCollectMapper, UserBrowseMapper userBrowseMapper) {
        this.userGetDao = userGetDao;
        this.userCollectMapper = userCollectMapper;
        this.userBrowseMapper = userBrowseMapper;
    }

    /**
      * @Description: 用户简历列表
      * @Author: ziHeng
      * @Date: 2018/5/16 下午5:39
      * @Param: [userId]
      * @return: java.util.List<com.ziheng.dto.userGet.Resume>
      */
    @Override
    public List<Resume> resumeList(String userId) {

        List<Resume> resumeList = userGetDao.resumeList(userId);

        //出生日期转换为用户年龄
        for(Resume resume:resumeList){
            Long birthDate = resume.getBirthDate();
            resume.setAge(ZiHengUtil.getAgeByBirth(birthDate));
        }

        return resumeList;
    }

    /**
      * @Description: 获取用户发布的资讯-按照发布日期排序
      * @Author: ziHeng
      * @Date: 2018/5/17 上午10:54
      * @Param: [userId:用户id]
      * @return: java.util.List<com.ziheng.dto.userGet.Consult>
      */
    @Override
    public TreeSet<Consult> consultList(String userId) {

        short consultType;
        //返回的list结果 (按照发布日期排序)
        TreeSet<Consult> result = new TreeSet<Consult>();

        //获取图文类型图文
        consultType=0;
        List<Consult> imageList = userGetDao.consultList(userId,consultType);
        //图片字符串转为数组
        imageList = toImageList(imageList);
        //获取视频类型图文
        List<Consult> videoList = userGetDao.consultList(userId,consultType);

        result.addAll(imageList);
        result.addAll(videoList);


        return result;
    }

    /**
      * @Description: 根据收藏类型收藏
      *               收藏类型(招聘:0,求职:1,资讯:2)
      * @Author: ziHeng
      * @Date: 2018/5/17 下午12:01
      * @Param: [userId, collectType, contentId]
      * @return: java.lang.Integer
      */
    @Override
    public Integer insertUserCollect(String userId, Short collectType, String contentId) {

        //获取UUID
        String uuid = UUID.randomUUID().toString();

        //获取秒时间戳
        Long collectDate = new Date().getTime()/1000;

        UserCollect userCollect = new UserCollect(uuid,collectType,collectDate,userId,contentId);

        return userCollectMapper.insert(userCollect);

    }


    /**
      * @Description: 新增招聘、求职、资讯浏览记录
      *               类型(招聘:0,求职:1,资讯:2)
      * @Author: ziHeng
      * @Date: 2018/5/17 下午12:02
      * @Param: [userId, collectType, contentId]
      * @return: java.lang.Integer
      */
    @Override
    public Integer insertUserBrowse(String userId, Short collectType, String contentId) {

        //获取UUID
        String uuid = UUID.randomUUID().toString();

        //获取秒时间戳
        Long browseDate = new Date().getTime()/1000;

        UserBrowse userBrowse = new UserBrowse(uuid,collectType,browseDate,userId,contentId);

        return userBrowseMapper.insert(userBrowse);
    }

    /** 
      * @Description: 根据类型获取收藏列表
      * @Author: ziHeng
      * @Date: 2018/5/17 下午7:29
      * @Param: [userId, collectType]
      * @return: com.cook.response.ApiResponse
      */ 
    @Override
    public ApiResponse collectListByType(String userId, Short collectType) {
        //0:招聘的职位 1:求职的职位 3:资讯的收藏
        if(collectType == 0 || collectType == 1){
            TreeSet<Job> jobTreeSet = new TreeSet<Job>();
            jobTreeSet.addAll(userGetDao.jobCollectList(userId, (short) 0));
            jobTreeSet.addAll(userGetDao.jobCollectList(userId, (short) 1));
            return ApiResponse.ofSuccess(jobTreeSet);
        }else if (collectType == 2){
            TreeSet<Consult> consultTreeSet = new TreeSet<Consult>();
            short consultType;
            //图文
            consultType = 0;
            consultTreeSet.addAll(toImageList(userGetDao.consultCollectList(userId,consultType)));
            //视频
            consultType = 1;
            consultTreeSet.addAll(userGetDao.consultCollectList(userId,consultType));
            return ApiResponse.ofSuccess(consultTreeSet);
        }

        return ApiResponse.ofError(ApiResponse.Status.INTERNAL_SERVER_ERROR);
    }

    @Override
    public ApiResponse browseListByType(String userId, Short browseType) {
        //0:招聘的职位 1:求职的职位 3:资讯的收藏
        if(browseType == 0 || browseType == 1){
            TreeSet<Job> jobTreeSet = new TreeSet<Job>();
            jobTreeSet.addAll(userGetDao.jobBrowseList(userId, (short) 0));
            jobTreeSet.addAll(userGetDao.jobBrowseList(userId, (short) 1));
            return ApiResponse.ofSuccess(jobTreeSet);
        }else if (browseType == 2){
            TreeSet<Consult> consultTreeSet = new TreeSet<Consult>();
            //图文
            consultTreeSet.addAll(toImageList(userGetDao.consultBrowseList(userId, (short) 0)));
            //视频
            consultTreeSet.addAll(userGetDao.consultBrowseList(userId, (short) 1));
            return ApiResponse.ofSuccess(consultTreeSet);
        }

        return ApiResponse.ofError(ApiResponse.Status.INTERNAL_SERVER_ERROR);
    }



    //图片字符串转字符串数组
    private List<Consult> toImageList(List<Consult> consultList){
        for (Consult consult:consultList){
            String imageName = consult.getImageNames();
            String[] list = imageName.split(",");
            consult.setImageName(list);
        }
        return consultList;
    }
}
