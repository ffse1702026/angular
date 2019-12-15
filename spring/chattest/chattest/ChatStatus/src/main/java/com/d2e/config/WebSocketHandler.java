package com.d2e.config;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.AbstractWebSocketHandler;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

public class WebSocketHandler extends AbstractWebSocketHandler {
	//List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();
	
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
        System.out.println("New Text Message Received");
        session.sendMessage(message);
        
    }

    @Override
    protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) throws IOException {
    	
        System.out.println("New Binary Message Received");
        
//        for(WebSocketSession webSocketSession : sessions) {
//        	webSocketSession.sendMessage(message);
//        	//webSocketSession.sen
//		}
        session.sendMessage(message);
    }
    
//    @Override
//	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//    	System.out.println(session);
//    	System.out.println(session);
//    	//sessions.add(session);
//	}
//    
}
