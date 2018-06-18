package com.cook.filter;

import com.cook.service.Impl.ImageCodeValidate;
import com.cook.service.Impl.SmsCodeValidate;
import com.cook.service.ValidateCodeProcessor;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description: 验证过滤器
 * @author: ziHeng
 * @create: 2018-06-05 18:32
 **/
@Component
public class ValidateFilter extends OncePerRequestFilter implements InitializingBean{

    private static Logger logger= LoggerFactory.getLogger(ValidateFilter.class);

    @Value("${cook.authenticate.imageUrl}")
    private String imageAuthenticateUrl;

    @Value("${cook.authenticate.smsUrl}")
    private String smsAuthenticateUrl;

    private Map<String,String> authenticationUrl = new HashMap<>();

    /**
     * 验证请求url与配置的url是否匹配的工具类
     */
    private AntPathMatcher pathMatcher = new AntPathMatcher();

    @Override
    public void afterPropertiesSet() throws ServletException {
        authenticationUrl.put("image",imageAuthenticateUrl);
        authenticationUrl.put("sms",smsAuthenticateUrl);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        ServletWebRequest webRequest = new ServletWebRequest(request,response);
        String requestUrl = request.getRequestURI();
        String requestMethod = request.getMethod();
        //判断post请求
        if(StringUtils.equalsIgnoreCase(requestMethod,"POST")){
            for (String key:authenticationUrl.keySet()) {
                String url = authenticationUrl.get(key);
                //确认
                if(pathMatcher.match(url,requestUrl)){
                    //根据类型类型
                    if(chooseValidator(webRequest, key)){
                        chain.doFilter(request, response);
                    }
                    //需要验证
                    logger.info("需要验证:{}",url);
                }
            }
        }
        //logger.info("验证过滤器");
        chain.doFilter(request, response);

    }

    private Boolean chooseValidator(ServletWebRequest webRequest, String type) {
        //上传的参数
        String codeValue = webRequest.getParameter("code");
        ValidateCodeProcessor validateCodeProcessor;
        if(type.equals("image")){
            //图片验证码验证
            validateCodeProcessor = new ImageCodeValidate();
            return validateCodeProcessor.isValidate(webRequest,codeValue);
        }else {
            //短信验证码验证
            validateCodeProcessor = new SmsCodeValidate();
            return validateCodeProcessor.isValidate(webRequest,codeValue);
        }
    }

}
