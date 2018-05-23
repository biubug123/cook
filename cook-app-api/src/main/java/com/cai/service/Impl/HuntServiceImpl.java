package com.cai.service.Impl;

import com.cai.dao.HuntDao;
import com.cai.dto.Hunt;
import com.cai.dto.HuntDetail;
import com.cai.service.HuntService;
import com.cook.dao.HuntMapper;
import com.cook.dao.ResumeMapper;
import com.cook.entity.Resume;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class HuntServiceImpl implements HuntService {

    @Autowired
    private HuntDao huntDao;


    /**
     * 分页查询求职列表
     * @param conditionType 查询条件
     * @param conditionDetail 条件具体内容
     * @return
     */
    @Override
    public List<Hunt> listHunt(Short conditionType, String conditionDetail) {
        return huntDao.listHunt(conditionType, conditionDetail);
    }

    /**
     * 根据求职ID获取求职详情
     * @param resumeId
     * @return
     */
    @Override
    public HuntDetail getHuntDetailByResumeId(String resumeId) {
        return huntDao.getHuntDetailByResumeId(resumeId);
    }

    /**
     * 模糊查询求职列表
     * @param jobRecommend
     * @return
     */
    @Override
    public List<HuntDetail> listHuntDetailByKeyword(String jobRecommend) {
        return huntDao.listHuntDetailByKeyword(jobRecommend);
    }


}
