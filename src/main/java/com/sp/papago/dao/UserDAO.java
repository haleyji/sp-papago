package com.sp.papago.dao;

import javax.servlet.http.HttpSession;

import com.sp.papago.vo.UserInfoVO;

public interface UserDAO {

	public UserInfoVO doLogin(UserInfoVO ui);
}
