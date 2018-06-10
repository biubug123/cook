/**
 * 
 */
package com.ziheng.social.weixin.api;

import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.ConnectionValues;
import org.springframework.social.connect.UserProfile;

/**
  * @Description: 将返回的信息组装插入sys_userConnection表
  * @Author: ziHeng
  * @Date: 2018/5/30 下午9:42
  */
public class WeiXinApiAdapter implements ApiAdapter<WeiXin> {

	private String openId;

	public WeiXinApiAdapter() {}

	public WeiXinApiAdapter(String openId){
		this.openId = openId;
	}

	/**
	 * @param api
	 * @return
	 */
	@Override
	public boolean test(WeiXin api) {
		return true;
	}

	/**
	 * @param api
	 * @param values
	 */
	@Override
	public void setConnectionValues(WeiXin api, ConnectionValues values) {
		WeiXinUserInfo profile = api.getWeiXinUserInfo(openId);
		values.setProviderUserId(profile.getOpenid());
		values.setDisplayName(profile.getNickname());
		values.setImageUrl(profile.getHeadimgurl());
	}

	/**
	 * @param api
	 * @return
	 */
	@Override
	public UserProfile fetchUserProfile(WeiXin api) {
		return null;
	}

	/**
	 * @param api
	 * @param message
	 */
	@Override
	public void updateStatus(WeiXin api, String message) {
		//do nothing
	}

}
