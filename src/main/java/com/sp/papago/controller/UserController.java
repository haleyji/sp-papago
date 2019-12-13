package com.sp.papago.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.sp.papago.service.UserService;
import com.sp.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UserController {
	
	@Resource
	private UserService us;
	
	@PostMapping("/login")
	public Map<String,Object> doLogin(@RequestBody UserInfoVO ui, HttpSession hs){
		log.info("ui =>{}",ui);
		log.info("user info=>{}",ui);
		log.info("user info=>{}",hs);
		return us.doLogin(ui, hs);
	}
	@PostMapping("/signup")
	public Map<String, String> doSignup(@RequestBody UserInfoVO ui){
		log.info("ui =>{}",ui);
		return us.doSignup(ui);
	}
}
