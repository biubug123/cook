package com.cai.service.Impl;

import com.cai.dao.RecruitDao;
import com.cai.dto.*;
import com.cai.service.RecruitService;
import com.cook.dao.ProxyMapper;
import com.cook.dao.RecruitMapper;
import com.cook.dao.UserRecruitApplyMapper;
import com.cook.entity.Proxy;
import com.cook.entity.UserRecruitApply;
import com.ziheng.dto.userGet.Consult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.TreeSet;
import java.util.UUID;

@Service
public class RecruitServiceImpl implements RecruitService {

    private RecruitDao recruitDao;

    private UserRecruitApplyMapper userRecruitApplyMapper;

    private ProxyMapper proxyMapper;

    private RecruitMapper recruitMapper;

    public RecruitServiceImpl(RecruitDao recruitDao, UserRecruitApplyMapper userRecruitApplyMapper, ProxyMapper proxyMapper, RecruitMapper recruitMapper) {
        this.recruitDao = recruitDao;
        this.userRecruitApplyMapper = userRecruitApplyMapper;
        this.proxyMapper = proxyMapper;
        this.recruitMapper = recruitMapper;
    }

    //招聘详情列表(多个职位)
    @Override
    public List<Recruit> listRecruit(String publisherId) {
        return recruitDao.listRecruit(publisherId);
    }


    /**
      * @Description: 模糊查询职位
      * @Author: ziHeng
      * @Date: 2018/5/23 下午1:29
      * @Param: [jobName]
      * @return: java.util.List<com.cai.dto.JobRecommend>
      */
    @Override
    public TreeSet<JobRecommend> listJobRecommend(String jobName) {
        TreeSet<JobRecommend> jobRecommends = new TreeSet<JobRecommend>();
        //代招
        List<JobRecommend> proxyList = recruitDao.listJobRecommend(jobName,(short)0);

        //企业
        List<JobRecommend> enterpriseList = recruitDao.listJobRecommend(jobName,(short)1);
        jobRecommends.addAll(proxyList);
        jobRecommends.addAll(enterpriseList);
        return jobRecommends;
    }





    /**
     * 插入用户求职申请
     * @return
     */
    @Override
    public int insertUserApply(String userId,
                               String recruitId,
                               Short recruitType,
                               String publisherId,
                               String publisherName,
                               String foodTypeName,
                               String jobName) {

        String id = UUID.randomUUID().toString();

        long applyDate = new Date().getTime() / 1000;

        UserRecruitApply userRecruitApply = new UserRecruitApply(id,
                applyDate,userId,
                recruitId,
                (short)0,recruitType,publisherId,
                publisherName,foodTypeName,
                jobName);


        return userRecruitApplyMapper.insert(userRecruitApply);
    }


    /**
     *  通过id查询招聘详情
     * @param
     * @return
     */
    @Override
    public RecruitDetail getRecruitDetail(String recruitId,Short recruitType) {
        RecruitDetail recruitDetail = recruitDao.getRecruitDetail(recruitId,recruitType);
        if (recruitDetail == null){
            return null;
        }
        String welfare = recruitDetail.getWelfareIdList();
        if(welfare != null){
            String[] list = welfare.split(",");
            recruitDetail.setWelfareList(list);
        }
        return recruitDetail;
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
            com.cook.entity.Recruit recruit = new com.cook.entity.Recruit(UUID.randomUUID().toString(),
                    salary,recruitPeopleNum,
                    (short)0,description,publishDate,0,0,publisherId,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire);
            return recruitMapper.insert(recruit);
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
        com.cook.entity.Recruit recruit = new com.cook.entity.Recruit(UUID.randomUUID().toString(),
                salary,recruitPeopleNum,
                (short)1,description,publishDate,0,0,enterpriseId,foodTypeId,welfareList,jobId,education,experienceRequire,ageRequire);

        return recruitMapper.insert(recruit);
    }

    /**
      * @Description: 获取招聘列表
      * @Author: ziHeng
      * @Date: 2018/5/22 下午9:42
      * @Param: [conditionType, conditionDetail]
      * @return: java.util.List<com.cai.dto.RecruitDto>
      */
    @Override
    public TreeSet<RecruitDto> recruitList(Short conditionType, String conditionDetail) {

        TreeSet<RecruitDto> result = new TreeSet<RecruitDto>();
        //代招
        List<RecruitDto> proxyList = toWelfareList(recruitDao.listRecruitDtoByType(conditionType,conditionDetail,(short)0));

        //企业
        List<RecruitDto> enterpriseList = toWelfareList(recruitDao.listRecruitDtoByType(conditionType,conditionDetail,(short)1));

        result.addAll(proxyList);
        result.addAll(enterpriseList);

        return result;
    }

    //福利字符串转字符串数组
    private List<RecruitDto> toWelfareList(List<RecruitDto> recruitDtoList){

        if (recruitDtoList != null && recruitDtoList.size()>0){
            for (RecruitDto recruitDto:recruitDtoList){
                String welfare = recruitDto.getWelfare();
                String[] list = welfare.split(",");
                recruitDto.setWelfareList(list);
            }
        }

        return recruitDtoList;
    }


}
