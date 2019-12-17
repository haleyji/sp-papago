package com.sp.papago.socket;

import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class WebSocketTest extends TextWebSocketHandler{

	@Override
	public void afterConnectionEstablished(WebSocketSession session)throws Exception{
		Map<String,Object> attrs = session.getAttributes();
		HttpSession hs = (HttpSession)attrs.get("session");
		log.info("webSessino===>{}",session.getId());
		log.info("HttpSession===>{}",hs.getId());
	}
}
