/**
 * 
 */
package com.cook.security.thirdPartyLogin.weixin.api;

import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.ConnectionValues;
import org.springframework.social.connect.UserProfile;

/**
 * 微信 api适配器，将微信 api的数据模型转为spring social的标准模型。
 * 
 * 
 * @author zhailiang
 *
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
