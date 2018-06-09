package com.ziheng.filter.sms;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;

import java.util.Collection;

/**
 * @description: 短信token
 * @author: ziHeng
 * @create: 2018-06-08 17:49
 **/
public class SmsAuthenticationToken extends AbstractAuthenticationToken{

    private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

    private final Object phone;

    public SmsAuthenticationToken(String phone) {
        super(null);
        this.phone = phone;
        setAuthenticated(false);
    }

    public SmsAuthenticationToken(Collection<? extends GrantedAuthority> authorities, Object phone) {
        super(authorities);
        this.phone = phone;
        super.setAuthenticated(true);
    }

    @Override
    public Object getCredentials() {
        return null;
    }

    @Override
    public Object getPrincipal() {
        return this.phone;
    }

    public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
        if (isAuthenticated) {
            throw new IllegalArgumentException(
                    "Cannot set this token to trusted - use constructor which takes a GrantedAuthority list instead");
        }

        super.setAuthenticated(false);
    }

}
