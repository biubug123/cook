package com.cook.security.thirdPartyLogin;

import com.cook.security.component.LoginFailureHandler;
import com.cook.security.component.LoginSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.security.SocialAuthenticationFilter;
import org.springframework.social.security.SpringSocialConfigurer;

//配置social回调域路径(springSocial默认为域名)
public class SocialSecurityConfig extends SpringSocialConfigurer {

    private String filterProcessesUrl;

    public SocialSecurityConfig(String filterProcessesUrl) {
        this.filterProcessesUrl = filterProcessesUrl;
    }

    @Autowired
    private LoginSuccessHandler loginSuccessHandler;


    @Override
    protected <T> T postProcess(T object) {
        SocialAuthenticationFilter filter=(SocialAuthenticationFilter)super.postProcess(object);
        filter.setFilterProcessesUrl(filterProcessesUrl);
        filter.setAuthenticationSuccessHandler(loginSuccessHandler);
        return (T) filter;
    }

    public String getFilterProcessesUrl() {
        return filterProcessesUrl;
    }

    public void setFilterProcessesUrl(String filterProcessesUrl) {
        this.filterProcessesUrl = filterProcessesUrl;
    }


}
