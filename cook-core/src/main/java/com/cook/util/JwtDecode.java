package com.cook.util;

import com.cook.constant.Security;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * @description: jwt解密工具
 * @author: ziHeng
 * @create: 2018-05-25 15:16
 **/
public class JwtDecode {


    public static Claims getClaims(HttpServletRequest request) throws UnsupportedEncodingException {

        String header = request.getHeader("Authorization");
        String token = StringUtils.substringAfter(header,"bearer ");

        Claims claims = Jwts.parser().setSigningKey(Security.JWTSIGNKEY.getBytes("UTF-8"))
                .parseClaimsJws(token).getBody();

        return claims;

    }

}
