package com.sp.papago.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sp.papago.vo.UserInfoVO;

public interface UserService {

	public Map<String,Object> doLogin(UserInfoVO ui,HttpSession hs);
}
