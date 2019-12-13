package com.sp.papago.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sp.papago.service.UserService;
import com.sp.papago.vo.UserInfoVO;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class SessionInterceptor extends HandlerInterceptorAdapter {
	private ObjectMapper om = new ObjectMapper();
	@Value("${project.mod}")
	private String pm;
	@Resource
	private UserService us;

	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws IOException {
		String uri = req.getRequestURI();
		log.info("uri=>{}", uri);
		HttpSession hs = req.getSession();
		if (hs.getAttribute("ui") == null) {
			String isAjax = req.getHeader("x-ajax");
			if("DEV".equals(pm)) {
				UserInfoVO ui = new UserInfoVO();
				ui.setUiId("haley");
				ui.setUiPwd("haley");
				us.doLogin(ui, hs);
				return true;
			}
			if (isAjax != null) {
				Map<String, String> map = new HashMap<>();
				map.put("msg", "로그인에 실패하였습니다");
				res.setContentType("application/json; charset=utf-8");
				PrintWriter pw = res.getWriter();
				pw.write(om.writeValueAsString(map));
				return false;
			}
			res.sendRedirect("/views/error/session-error");
			return false;
		}
		return true;
	}
}
