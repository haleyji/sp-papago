package com.sp.papago.socket;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class ServletConfig extends ServerEndpointConfig.Configurator {

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession hs = (HttpSession) request.getHttpSession();
		ServletContext sc = hs.getServletContext();
		sec.getUserProperties().put(hs.getClass().getName(), hs);//key에 "hs"
		sec.getUserProperties().put(sc.getClass().getName(), sc);//"sc"써도됨
	}
}
