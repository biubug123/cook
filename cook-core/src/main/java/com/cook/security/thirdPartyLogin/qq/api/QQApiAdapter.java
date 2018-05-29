/**
 * 
 */
package com.cook.security.thirdPartyLogin.qq.api;

import com.cook.security.thirdPartyLogin.qq.api.QQ;
import com.cook.security.thirdPartyLogin.qq.api.QQUserInfo;
import org.springframework.social.connect.ApiAdapter;
import org.springframework.social.connect.ConnectionValues;
import org.springframework.social.connect.UserProfile;

/**
  * @Description: 用户信息api适配器
  * @Author: ziHeng
  * @Date: 2018/5/27 下午9:26
  */
public class QQApiAdapter implements ApiAdapter<QQ> {

    //测试QQ服务是否可用
	@Override
	public boolean test(QQ api) {
		return true;
	}

	//
	@Override
	public void setConnectionValues(QQ api, ConnectionValues values) {
	    //获取用户信息
		QQUserInfo userInfo = api.getUserInfo();
		//用户昵称
		values.setDisplayName(userInfo.getNickname());
		//用户头像 40*40像素
		values.setImageUrl(userInfo.getFigureurl_qq_1());
		//QQ个人主页
		values.setProfileUrl(null);
		//用户唯一id
		values.setProviderUserId(userInfo.getOpenId());
	}

	//有关绑定和解绑
	@Override
	public UserProfile fetchUserProfile(QQ api) {
		// TODO Auto-generated method stub
		return null;
	}

	//更新QQ状态
	@Override
	public void updateStatus(QQ api, String message) {
		//do noting
	}

}
