package com.sp.papago.socket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.slf4j.Slf4j;

//@ServerEndpoint(value="/ws/chat", configurator=ServletConfig.class)
@Slf4j
public class SocketTest {

	private static List<Session> ssList = new ArrayList<>();
	@OnOpen//해당서버에 연결을 맺었을때 발생하는 이벤트
	public void open(Session ss, EndpointConfig ec) {
		HttpSession hs = (HttpSession)ec.getUserProperties();
		if(ssList.indexOf(ss)==-1) {
			ssList.add(ss);
		}
		log.info(ss.getId());
		try {
			ss.getBasicRemote().sendText("hello");
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@OnMessage//메세지가 클라이언트로부터 들어왔을때
	public void message(String msg, Session ss) {
		for(Session ss1:ssList) {
			if(ss1!=ss) {
				try {
					ss1.getBasicRemote().sendText(msg);
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
	}
	
	@OnClose//연결되었던것이 끊길때, id를 찾아서 연결빼줌
	public void close(Session ss) {
		ssList.remove(ss);
		log.info(ss.getId());
	}
	@OnError
	public void error(Throwable t) {
		log.error("ett===>{}",t);
	}
}
