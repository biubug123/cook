package ziheng;

import com.cook.CookApplication;
import com.cook.dao.EnterpriseMapper;
import com.cook.dao.JobMapper;
import com.cook.dao.SysUserMapper;
import com.cook.dao.WelfareMapper;
import com.cook.entity.Enterprise;
import com.cook.entity.Job;
import com.cook.entity.SysUser;
import com.cook.entity.Welfare;
import com.sun.tools.javac.comp.Enter;
import com.ziheng.service.RecruitPostService;
import com.ziheng.service.UserPostService;
import org.apache.commons.lang.RandomStringUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
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
    private RecruitPostService recruitPostService;

    //新用户
    @Test
    public void userTest(){
        for (int i = 0; i < 1000; i++) {
            String phone = RandomStringUtils.randomNumeric(11);
            String password =  RandomStringUtils.randomAlphanumeric(11);
            String accountNum = i%2 ==0? RandomStringUtils.randomNumeric(11):null;
            String sex = i%2 ==0 ?"男":"女";
            userPostService.insertUser(phone,password,sex,accountNum);
        }
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

        String phone = RandomStringUtils.randomNumeric(11);
        recruitPostService.insertRecruitByProxy("芳先生",
                phone,
                "广东省广州市天河区", "广东省广州市天河区公元前3号街","1d7a14f2-1aa9-4581-8b85-194036b77f3e", "3000-4000",2,"发呆","aaab39c1-3540-4009-933e-6f4592597c02",
                "a7ef2c02-c2ed-4d92-9a5c-b14703fa617d","14cd79d8-2148-49f1-b176-1ebc398c815d",
        "本科","一年工作经验","20岁以上");

        recruitPostService.insertRecruitByProxy("芳先生",
                phone,
                "广东省广州市天河区", "广东省广州市天河区3号街","1d7a14f2-1aa9-4581-8b85-194036b77f3e", "3000-4000",2,"发呆","45abe7e2-2851-4bdd-9792-d1ac1a9f9434",
                "a7ef2c02-c2ed-4d92-9a5c-b14703fa617d,78bfca72-0ccc-4ecb-a79f-34ddfffee7b3","14cd79d8-2148-49f1-b176-1ebc398c815d",
                "本科","一年工作经验","20岁以上");


    }
    //企业发布
    @Test
    public void enterpriseRecruit(){

        recruitPostService.insertRecruitByEnterprise("53b3bbba-b9e2-41d3-b2ee-0b29ce764b18","6000-7000",3,"二店长","aaab39c1-3540-4009-933e-6f4592597c02",
                        "b535dc64-c353-4f93-88e0-530077f8b713,a7ef2c02-c2ed-4d92-9a5c-b14703fa617d","14cd79d8-2148-49f1-b176-1ebc398c815d","大学","10年","10岁以上");

    }

    //用户收藏
    @Test
    public void userCollect(){
        userPostService.insertUserCollect("5c76cdb0-9422-4537-ac83-0ba709425bab",(short)0,"5a048509-06a8-4a34-b52a-756af661362c");
    }

    //新增简历



}
