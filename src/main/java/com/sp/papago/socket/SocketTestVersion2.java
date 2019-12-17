package com.sp.papago.socket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import lombok.extern.slf4j.Slf4j;

@ServerEndpoint("/ws/chatting")
@Slf4j
public class SocketTestVersion2 {

	private static Map<String,Session> sMap = new HashMap<>();
	@OnOpen
	public void open(Session ss) {
		if(!sMap.containsValue(ss)) {
			sMap.put(ss.getId(), ss);
		}
		log.info("sMap=====>{}",sMap);
		try {
			ss.getBasicRemote().sendText(ss.getId()+"님 "+"환영합니다"+"\n\r");
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@OnMessage
	public void message(String msg, Session ss) {
		for(String key:sMap.keySet()) {
			try {
				if(sMap.get(key)==ss) {
					ss.getBasicRemote().sendText("***"+ss.getId()+"님 *** => "+msg+"\n\r");
				}else {
					sMap.get(key).getBasicRemote().sendText(ss.getId()+"님 => "+msg+"\n\r");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@OnClose
	public void close(Session ss) {
		log.info(ss.getId());
	}
	@OnError
	public void error(Throwable t) {
		log.error("ett===>{}",t);
	}
}
