/**
 * 
 */
package com.ziheng.social.weibo.config.component;

import org.springframework.social.oauth2.AccessGrant;


/**
  * @Description: 接取accessToken请求传来的参数
  * @Author: ziHeng
  * @Date: 2018/5/30 下午3:14
  */
public class WeiBoAccessGrant extends AccessGrant {

    //第三方用户唯一标识
	private String openId;

	public WeiBoAccessGrant() {
		super("");
	}

	public WeiBoAccessGrant(String accessToken, String scope, String refreshToken, Long expiresIn) {
		super(accessToken, scope, refreshToken, expiresIn);
	}

	/**
	 * @return the openId
	 */
	public String getOpenId() {
		return openId;
	}

	/**
	 * @param openId the openId to set
	 */
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	
}
