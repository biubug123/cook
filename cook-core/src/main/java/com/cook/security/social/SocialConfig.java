package com.cook.security.social;

import com.cook.security.component.ConnectionBindView;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.config.annotation.EnableSocial;
import org.springframework.social.config.annotation.SocialConfigurerAdapter;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.web.ProviderSignInUtils;
import org.springframework.web.servlet.View;

import javax.sql.DataSource;

//配置UsersConnectionRepository
@Configuration
@EnableSocial
@ConditionalOnProperty(name = "cook.social",havingValue = "true")
public class SocialConfig extends SocialConfigurerAdapter {

    private static Logger logger= LoggerFactory.getLogger(SocialConfig.class);



    @Qualifier("dataSource")
    @Autowired
    private DataSource dataSource;

    //配置不注册直接使用第三方登录默认注册用户
    @Autowired(required = false)
    private DemoConnectionSignUp demoConnectionSignUp;

    @Value("${cook.social.filterProcessesUrl}")
    private String filterProcessesUrl;


    //连接至ConnectionRepository
    @Override
    public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
        JdbcUsersConnectionRepository repository=new JdbcUsersConnectionRepository(dataSource,connectionFactoryLocator, Encryptors.noOpText());
        //JdbcUsersConnectionRepository.sql
        repository.setTablePrefix("sys_");
        //connectionSignUp 配置第三方登录时插入数据表的userId；配置此项将不会跳入注册页面
        //if(demoConnectionSignUp!=null){
        //    repository.setConnectionSignUp(demoConnectionSignUp);
        //}
        return repository;
    }

    //过滤器config（加入安全器配置需要）
    @Bean
    public SocialSecurityConfig thirdPartySecurityConfig(){
        //filterProcessesUrl 替换默认的"/auth"
        logger.info("当前应用第三方登录的url为"+filterProcessesUrl);

        //自定义配置第三方登录路径
        SocialSecurityConfig configurer=new SocialSecurityConfig(filterProcessesUrl);

        //配置注册页面路径Url
        configurer.signupUrl("/security/toSignUpPage");
        return configurer;
    }

    //providerSignInUtils:social信息存放工具
    //1、注册过程中拿到springsocial信息
    //2、把业务系统userid传到social
    @Bean
    public ProviderSignInUtils providerSignInUtils(ConnectionFactoryLocator connectionFactoryLocator){
        return new ProviderSignInUtils(connectionFactoryLocator,getUsersConnectionRepository(connectionFactoryLocator));
    }

    //这里只配了微信
    @Bean({"connect/weiXinConnect","connect/weiXinConnected"})
    public View ConnectionBind(){
        return new ConnectionBindView();
    }
}
