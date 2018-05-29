package ziheng;

import com.alibaba.fastjson.JSONArray;
import com.cai.service.HuntService;
import com.cai.service.RecruitService;
import com.cook.CookApplication;
import com.cook.dao.*;
import com.cook.entity.*;
import com.ziheng.service.ConsultPostService;
import com.ziheng.service.UserPostService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @description: 测试类
 * @author: ziHeng
 * @create: 2018-05-18 09:28
 **/

@SpringBootTest(classes = CookApplication.class)
@RunWith(SpringRunner.class)
public class FirstTest {

    @Autowired
    private UserPostService userPostService;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private WelfareMapper welfareMapper;

    @Autowired
    private JobMapper jobMapper;

    @Autowired
    private EnterpriseMapper enterpriseMapper;

    @Autowired
    private RecruitService recruitPostService;

    @Autowired
    private HuntService huntPostService;

    @Autowired
    private ConsultPostService consultPostService;

    @Autowired
    private StreetMapper streetMapper;

    @Autowired
    private RegionMapper regionMapper;
    //新用户
    @Test
    public void userTest(){
            String phone = "18926269831";
            String password =  "admin123";
            String accountNum = "admin123";
            //userPostService.insertUser(phone,password,"女",accountNum);
        System.out.println("执行");
    }

    //福利
    @Test
    public void insertWelfare(){
        Welfare welfare = new Welfare();
        welfare.setId(UUID.randomUUID().toString());
        welfare.setName("房补");
        welfareMapper.insert(welfare);
    }

    //岗位
    @Test
    public void insertJob(){
        Job job = new Job();
        job.setId(UUID.randomUUID().toString());
        job.setName("厨师长");
        jobMapper.insert(job);
        job.setId(UUID.randomUUID().toString());
        job.setName("服务员");
        jobMapper.insert(job);
        job.setId(UUID.randomUUID().toString());
        job.setName("总经理");
        jobMapper.insert(job);
        job.setId(UUID.randomUUID().toString());
        job.setName("收银员");
        jobMapper.insert(job);
        job.setId(UUID.randomUUID().toString());
        job.setName("店长");
        jobMapper.insert(job);
    }

    //新增企业
    @Test
    public void insertEnterprise(){
        Enterprise enterprise = new Enterprise(
                UUID.randomUUID().toString(),
                "小北公司","020-63214221",
                "广东省广州市越秀区","广东省广州市越秀区恒安路2号"
        );
        enterpriseMapper.insert(enterprise);
    }

    //代招发布
    @Test
    public void proxyRecruit(){

        String phone = "18028660208";
        recruitPostService.insertRecruitByProxy("张先生",
                phone,
                "广东省广州市天河区", "广东省广州市天河区公元前3号街","1d7a14f2-1aa9-4581-8b85-194036b77f3e", "3000-4000",2,"牛","aaab39c1-3540-4009-933e-6f4592597c02",
                "a7ef2c02-c2ed-4d92-9a5c-b14703fa617d","14cd79d8-2148-49f1-b176-1ebc398c815d",
        "本科","一年工作经验","20岁以上");



    }
    //企业发布
    @Test
    public void enterpriseRecruit(){

        recruitPostService.insertRecruitByEnterprise("53b3bbba-b9e2-41d3-b2ee-0b29ce764b18","6000-7000",3,"二店长","aaab39c1-3540-4009-933e-6f4592597c02",
                        "b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d","14cd79d8-2148-49f1-b176-1ebc398c815d","大学","10年","10岁以上");

    }
    //新增用户浏览
    @Test
    public void userBrowse(){
        userPostService.insertUserBrowse("1d7a14f2-1aa9-4581-8b85-194036b77f3e",(short)1,"2a7e6d0b-ccf9-4d49-9345-a939bbc58f0c");
    }

    //新增用户收藏
    @Test
    public void userCollect(){
        userPostService.insertUserCollect("5c76cdb0-9422-4537-ac83-0ba709425bab",(short)1,"2a7e6d0b-ccf9-4d49-9345-a939bbc58f0c");
    }

    //新增简历
    @Test
    public void insertResume(){
        for (int i = 0; i < 3; i++) {
            userPostService.insertResume((short)3,"5年","高中","1d7a14f2-1aa9-4581-8b85-194036b77f3e","我的简历"+i);
        }
    }

    //用户发布求职
    @Test
    public void insertHunt(){
        userPostService.insertHunt("2000-8000","4dd86556-5e79-47dc-8c63-b7c8766775d0","6fd5c34e-127f-4f15-b5bf-4bea7c14602a","32fc3520-511f-4246-bb09-6772e47b9d31","广东省广州市天河区");
    }



    //用户发表图文资讯
    @Test
    public void releaseImageTextConsult(){
        consultPostService.releaseImageTextConsult((short)0,"1d7a14f2-1aa9-4581-8b85-194036b77f3e","陈大师","大师教程(4)","讲述了如何成为大(4)","http://????.com,http://?????.com");

    }

    //用户发表图文资讯
    @Test
    public void releaseVideoConsult(){
        consultPostService.releaseVideoConsult((short)0,"1d7a14f2-1aa9-4581-8b85-194036b77f3e","陈大师","陈视频教程(2)","http://???.com","http://???.com","http://????","这是视频教程");

    }

    @Test
    public void insertAdmin(){

        SysUser sysUser = new SysUser(UUID.randomUUID().toString(),"admin","admin",null,new Date().getTime()/1000,new Date().getTime()/1000);
        sysUserMapper.insertSelective(sysUser);

    }

    @Test
    public void insertRegion() throws IOException {
        File file = new File("/Users/zhangziheng/Desktop/street.json");
        String content= FileUtils.readFileToString(file,"UTF-8");
        List<Street> streetList = JSONArray.parseArray(content,Street.class);
        System.out.println(streetList.size());

        for (int i = 0; i < streetList.size(); i++) {
            Street street = streetList.get(i);
            streetMapper.insert(street);
        }

        System.out.println("完成");



    }


}
