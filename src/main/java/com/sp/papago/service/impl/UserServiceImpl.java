package com.sp.papago.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.sp.papago.dao.UserDAO;
import com.sp.papago.service.UserService;
import com.sp.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

	@Resource
	private UserDAO udao;
	
	@Override
	public Map<String, Object> doLogin(UserInfoVO ui,HttpSession hs) {
		ui = udao.doLogin(ui);
		Map<String,Object> rMap = new HashMap<>();
		if(ui==null) {
			rMap.put("msg", "아이디나 비밀번호를 확인해주세요");
			rMap.put("result","false");
		}else {
			rMap.put("msg", "환영합니다. "+ui.getUiName()+"님");
			rMap.put("result","true");
			rMap.put("ui", ui);
			hs.setAttribute("ui", ui);
		}
		return rMap;
	}

	@Override
	public Map<String,String> doSignup(UserInfoVO ui) {
		int cnt = udao.doSignup(ui);
		Map<String,String> rMap = new HashMap<>();
		if(cnt==0) {
			rMap.put("msg", "회원가입에 실패하였습니다. 다시 시도해 주세요.");
			rMap.put("result","false");
		}else {
			rMap.put("msg", "회원가입에 성공하였습니다. 로그인 해주세요.");
			rMap.put("result","true");
		}
		return rMap;
	}

}
