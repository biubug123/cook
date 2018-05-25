package com.cook.security.jwt;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @description: jwt返回类
 * @author: ziHeng
 * @create: 2018-05-25 18:33
 **/
@NoArgsConstructor
@Data
public class JwtDto {


    /**
     * additionalInformation : {"userId":"3cb1a0da-2581-41d0-98cb-f34d45e90148","jti":"eb5d9f06-c8a5-4144-8ff4-9f3f658ecc51"}
     * expiration : 1527330429167
     * expired : false
     * expiresIn : 86399
     * refreshToken : {"expiration":1529836029167,"value":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyIiwic2NvcGUiOlsiYWxsIiwicmVhZCIsIndyaXRlIl0sImF0aSI6ImViNWQ5ZjA2LWM4YTUtNDE0NC04ZmY0LTlmM2Y2NThlY2M1MSIsImV4cCI6MTUyOTgzNjAyOSwidXNlcklkIjoiM2NiMWEwZGEtMjU4MS00MWQwLTk4Y2ItZjM0ZDQ1ZTkwMTQ4IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiJdLCJqdGkiOiJlODRmM2RkNC0xNGIyLTQ5MjQtYjc5Yy01MWY4NTE1OTQxNzMiLCJjbGllbnRfaWQiOiJjb29rIn0.s32j8MfuqyxCIv-T_uyGeA9ORMu0tnS-ub9WI4TYEDE"}
     * scope : ["all","read","write"]
     * tokenType : bearer
     * value : eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyIiwic2NvcGUiOlsiYWxsIiwicmVhZCIsIndyaXRlIl0sImV4cCI6MTUyNzMzMDQyOSwidXNlcklkIjoiM2NiMWEwZGEtMjU4MS00MWQwLTk4Y2ItZjM0ZDQ1ZTkwMTQ4IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiJdLCJqdGkiOiJlYjVkOWYwNi1jOGE1LTQxNDQtOGZmNC05ZjNmNjU4ZWNjNTEiLCJjbGllbnRfaWQiOiJjb29rIn0.-ysG-_wAtcusB6c06GaSkliaY8Co3k58DLJ5Pa2h6Ro
     */

    private AdditionalInformationBean additionalInformation;
    private long expiration;
    private boolean expired;
    private int expiresIn;
    private RefreshTokenBean refreshToken;
    private String tokenType;
    private String value;
    private List<String> scope;

    @NoArgsConstructor
    @Data
    public static class AdditionalInformationBean {
        /**
         * userId : 3cb1a0da-2581-41d0-98cb-f34d45e90148
         * jti : eb5d9f06-c8a5-4144-8ff4-9f3f658ecc51
         */

        private String userId;
        private String jti;
    }

    @NoArgsConstructor
    @Data
    public static class RefreshTokenBean {
        /**
         * expiration : 1529836029167
         * value : eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX25hbWUiOiJ1c2VyIiwic2NvcGUiOlsiYWxsIiwicmVhZCIsIndyaXRlIl0sImF0aSI6ImViNWQ5ZjA2LWM4YTUtNDE0NC04ZmY0LTlmM2Y2NThlY2M1MSIsImV4cCI6MTUyOTgzNjAyOSwidXNlcklkIjoiM2NiMWEwZGEtMjU4MS00MWQwLTk4Y2ItZjM0ZDQ1ZTkwMTQ4IiwiYXV0aG9yaXRpZXMiOlsiUk9MRV9BRE1JTiJdLCJqdGkiOiJlODRmM2RkNC0xNGIyLTQ5MjQtYjc5Yy01MWY4NTE1OTQxNzMiLCJjbGllbnRfaWQiOiJjb29rIn0.s32j8MfuqyxCIv-T_uyGeA9ORMu0tnS-ub9WI4TYEDE
         */

        private long expiration;
        private String value;
    }
}
