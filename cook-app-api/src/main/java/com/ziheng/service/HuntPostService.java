package com.ziheng.service;

public interface HuntPostService {

    //用户填写简历
    Integer insertResume(Short workYear,
                         String workExperienceId,
                         String education,
                         String userId,
                         String title);

    //用户填写求职
    Integer insertHunt(String salary,
                       String resumeId,
                       String jobId,
                       String foodTypeId,
                       String workArea);


}
