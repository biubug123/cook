package com.cook.security.component;

import com.alibaba.fastjson.JSON;
import com.cook.response.ApiResponse;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException;
import org.springframework.security.oauth2.provider.*;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description: 登录成功处理器
 * @author: ziHeng
 * @create: 2018-05-24 09:54
 **/

//@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    private static Logger logger= LoggerFactory.getLogger(LoginSuccessHandler.class);

    @Autowired
    private ClientDetailsService clientDetailsService;

    @Resource(name = "defaultAuthorizationServerTokenServices")
    private AuthorizationServerTokenServices authorizationServerTokenServices;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        logger.info("登录成功");
        //请求头为"Authorization"
        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Basic ")) {
            String[] tokens = this.extractAndDecodeHeader(header);

            //断言-不执行
            assert tokens.length == 2;

            String clientId = tokens[0];
            String clientSecret = tokens[1];

            //获取ClientDetails
            ClientDetails clientDetails = clientDetailsService.loadClientByClientId(clientId);

            //从配置信息里对clientDetail验证
            if(clientDetails == null){
                throw new UnapprovedClientAuthenticationException("clientId对应的配置信息不存在:"+clientId);
            }else if(!StringUtils.equals(clientDetails.getClientSecret(),clientSecret)){
                throw new UnapprovedClientAuthenticationException("clientSecret不匹配:"+clientSecret);
            }

            //发起获取token请求
            TokenRequest tokenRequest = new TokenRequest(MapUtils.EMPTY_MAP,clientId,clientDetails.getScope(),"custom");

            OAuth2Request oAuth2Request = tokenRequest.createOAuth2Request(clientDetails);

            OAuth2Authentication oAuth2Authentication = new OAuth2Authentication(oAuth2Request,authentication);

            OAuth2AccessToken token = authorizationServerTokenServices.createAccessToken(oAuth2Authentication);


            //返回界面token信息
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(JSON.toJSONString(ApiResponse.ofSuccess(token)));
        }else {
            ////返回界面token信息
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(JSON.toJSONString(ApiResponse.ofError(ApiResponse.Status.NOT_VALID_HEADER)));
        }

     }

    //Basic64解码工具
    private String[] extractAndDecodeHeader(String header) throws IOException {
        //去掉"Basic "
        byte[] base64Token = header.substring(6).getBytes("UTF-8");
        //解码容器
        byte[] decoded;
        try {
            //解码
            decoded = Base64.decode(base64Token);
        } catch (IllegalArgumentException var7) {
            throw new BadCredentialsException("Failed to decode basic authentication token");
        }

        //字节转为String
        String token = new String(decoded,"UTF-8");
        int delim = token.indexOf(":");
        if (delim == -1) {
            throw new BadCredentialsException("Invalid basic authentication token");
        } else {
            //用户名和密码
            return new String[]{token.substring(0, delim), token.substring(delim + 1)};
        }
    }
}
