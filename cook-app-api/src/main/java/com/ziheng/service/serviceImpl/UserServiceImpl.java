package com.ziheng.service.serviceImpl;

import com.cook.dao.*;
import com.cook.entity.SysUser;
import com.cook.entity.SysUserInfo;
import com.cook.entity.UserBrowse;
import com.cook.entity.UserCollect;
import com.cook.response.ApiResponse;
import com.ziheng.dao.UserGetDao;
import com.ziheng.dao.UserPostDao;
import com.ziheng.dto.userGet.Consult;
import com.ziheng.dto.userGet.Job;
import com.ziheng.dto.userGet.Resume;
import com.ziheng.service.UserGetService;
import com.ziheng.service.UserPostService;
import com.ziheng.util.ZiHengUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    private SysUserMapper sysUserMapper;

    private SysUserInfoMapper sysUserInfoMapper;

    private UserPostDao userPostDao;

    private ResumeMapper resumeMapper;

    private HuntMapper huntMapper;

    public UserServiceImpl(UserGetDao userGetDao, UserCollectMapper userCollectMapper, UserBrowseMapper userBrowseMapper, SysUserMapper sysUserMapper, SysUserInfoMapper sysUserInfoMapper, UserPostDao userPostDao, ResumeMapper resumeMapper, HuntMapper huntMapper) {
        this.userGetDao = userGetDao;
        this.userCollectMapper = userCollectMapper;
        this.userBrowseMapper = userBrowseMapper;
        this.sysUserMapper = sysUserMapper;
        this.sysUserInfoMapper = sysUserInfoMapper;
        this.userPostDao = userPostDao;
        this.resumeMapper = resumeMapper;
        this.huntMapper = huntMapper;
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

        //返回的list结果 (按照发布日期排序)
        TreeSet<Consult> result = new TreeSet<Consult>();

        //获取图文类型图文
        List<Consult> imageList = userGetDao.consultList(userId,(short)0);
        //图片字符串转为数组
        imageList = toImageList(imageList);
        //获取视频类型图文
        List<Consult> videoList = userGetDao.consultList(userId,(short)1);

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
            //招聘的职位
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 0,(short) 0,"collect"));
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 0,(short) 1,"collect"));
            //求职的职位
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 1,null,"collect"));
            return ApiResponse.ofSuccess(jobTreeSet);
        }else if (collectType == 2){
            TreeSet<Consult> consultTreeSet = new TreeSet<Consult>();
            //图文
            consultTreeSet.addAll(toImageList(userGetDao.consultCollectOrBrowseList(userId,(short)0,"collect")));
            //视频
            consultTreeSet.addAll(userGetDao.consultCollectOrBrowseList(userId,(short)1,"collect"));
            return ApiResponse.ofSuccess(consultTreeSet);
        }

        return ApiResponse.ofError(ApiResponse.Status.INTERNAL_SERVER_ERROR);
    }

    /**
      * @Description: 根据类型获取浏览列表
      * @Author: ziHeng
      * @Date: 2018/5/17 下午8:11
      * @Param: [userId, browseType]
      * @return: com.cook.response.ApiResponse
      */
    @Override
    public ApiResponse browseListByType(String userId, Short browseType) {
        //0:招聘的职位 1:求职的职位 3:资讯的收藏
        if(browseType == 0 || browseType == 1){
            TreeSet<Job> jobTreeSet = new TreeSet<Job>();
            //招聘的职位
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 0,(short) 0,"browse"));
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 0,(short) 1,"browse"));
            //求职的职位
            jobTreeSet.addAll(userGetDao.jobCollectOrBroseList(userId, (short) 1,null,"browse"));
            return ApiResponse.ofSuccess(jobTreeSet);
        }else if (browseType == 2){
            TreeSet<Consult> consultTreeSet = new TreeSet<Consult>();
            //图文
            consultTreeSet.addAll(toImageList(userGetDao.consultCollectOrBrowseList(userId,(short)0,"browse")));
            //视频
            consultTreeSet.addAll(userGetDao.consultCollectOrBrowseList(userId,(short)1,"browse"));
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

    /**
      * @Description: 新用户
      * @Author: ziHeng
      * @Date: 2018/5/17 下午10:00
      * @Param: [phone, password, sex, accountNum:账号]
      * @return: java.lang.Integer
      */
    @Override
    @Transactional
    public Integer insertUser(String phone, String password,String sex, String accountNum) {
        String userId = UUID.randomUUID().toString();
        SysUser sysUser = new SysUser(userId,
                accountNum,
                password,
                phone,
                new Date().getTime()/1000,
                new Date().getTime()/1000);
        int userResult = sysUserMapper.insert(sysUser);
        if(userResult > 0){
            SysUserInfo sysUserInfo =new SysUserInfo(UUID.randomUUID().toString(),
                    sex,userId);
            return sysUserInfoMapper.insertSelective(sysUserInfo);
        }

        throw new RuntimeException("新用户注册失败");
    }

    @Override
    public Integer updateUserBySelective(String userId, String userName, String sex, String headImgName, String signature, String address, Long birthDate) {

        SysUserInfo sysUserInfo = new SysUserInfo(userName,sex,headImgName,signature,address,userId,birthDate);

        return userPostDao.updateBySysUserIdSelective(sysUserInfo);

    }

    /**
     * @Description: 用户新简历
     * @Author: ziHeng
     * @Date: 2018/5/18 下午9:36
     * @Param: [workYear, workExperienceId, education, userId, title]
     * @return: java.lang.Integer
     */
    @Override
    public Integer insertResume(Short workYear,
                                String workExperienceId,
                                String education,
                                String userId,
                                String title) {

        String id = UUID.randomUUID().toString();
        com.cook.entity.Resume resume = new com.cook.entity.Resume(id,workYear,workExperienceId,education,userId,title);
        return resumeMapper.insert(resume);
    }

    /**
     * @Description: 用户发起求职
     * @Author: ziHeng
     * @Date: 2018/5/18 下午9:37
     * @Param: [salary, resumeId, jobId, foodTypeId, workArea]
     * @return: java.lang.Integer
     */
    @Override
    public Integer insertHunt(String salary,
                              String resumeId,
                              String jobId,
                              String foodTypeId,
                              String workArea) {
        String id = UUID.randomUUID().toString();
        Long huntDate = new Date().getTime()/1000;
        com.cook.entity.Hunt hunt = new com.cook.entity.Hunt(id,salary,0,resumeId,jobId,foodTypeId,huntDate,workArea);
        return huntMapper.insert(hunt);
    }
}
