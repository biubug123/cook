package com.ziheng.service.serviceImpl;

import com.cook.dao.ProxyMapper;
import com.cook.dao.RecruitMapper;
import com.cook.entity.Proxy;
import com.cook.entity.Recruit;
import com.ziheng.service.RecruitPostService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.UUID;

/**
 * @description: 实现类
 * @author: ziHeng
 * @create: 2018-05-18 11:05
 **/
@Service
public class RecruitServiceImpl implements RecruitPostService{

    private ProxyMapper proxyMapper;

    private RecruitMapper recruitMapper;

    public RecruitServiceImpl(ProxyMapper proxyMapper, RecruitMapper recruitMapper) {
        this.proxyMapper = proxyMapper;
        this.recruitMapper = recruitMapper;
    }


    /**
      * @Description: 代招发布招聘 TODO contactWay格式 salary格式 welfareList格式
      * @Author: ziHeng
      * @Date: 2018/5/18 下午5:07
      * @Param: [name, contactWay, workArea, address, userId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
      * @return: java.lang.Integer
      */
    @Override
    @Transactional
    public Integer insertRecruitByProxy(String name,
                                        String contactWay,
                                        String workArea,
                                        String address,
                                        String userId,
                                        String salary,
                                        Integer recruitPeopleNum,
                                        String description,
                                        String foodTypeId,
                                        String welfareList,
                                        String jobId,
                                        String education,
                                        String experienceRequire,
                                        String ageRequire) {
        //代招发布者Id
        String publisherId = UUID.randomUUID().toString();
        Proxy proxy = new Proxy(publisherId,userId,name,contactWay,workArea,address);
        //新增代招
        int proxyResult = proxyMapper.insert(proxy);
        long publishDate = new Date().getTime()/1000;
        //发布招聘
        if(proxyResult>0){
            Recruit recruit = new Recruit(UUID.randomUUID().toString(),
                    salary,recruitPeopleNum,
                    (short)0,description,publishDate,publisherId,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire);
            return recruitMapper.insertSelective(recruit);
        }
        throw new RuntimeException("代理发布招聘失败");
    }

    /**
      * @Description: 企业发布招聘 TODO salary格式 welfareList格式
      * @Author: ziHeng
      * @Date: 2018/5/18 下午5:07
      * @Param: [enterpriseId, salary, recruitPeopleNum, description, foodTypeId, welfareList, jobId, education, experienceRequire, ageRequire]
      * @return: java.lang.Integer
      */
    @Override
    public Integer insertRecruitByEnterprise(String enterpriseId,
                                             String salary,
                                             Integer recruitPeopleNum,
                                             String description,
                                             String foodTypeId,
                                             String welfareList,
                                             String jobId,
                                             String education,
                                             String experienceRequire,
                                             String ageRequire) {
        long publishDate = new Date().getTime()/1000;
        //发布招聘
        Recruit recruit = new Recruit(UUID.randomUUID().toString(),
                salary,recruitPeopleNum,
                (short)1,description,publishDate,enterpriseId,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire);

        return recruitMapper.insertSelective(recruit);
    }
}
