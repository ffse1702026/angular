package com.example.websocketdemo;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.TextMessage;
 
@Controller
public class WebSocketController {


    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @MessageMapping("/chat/sendMessage")
    @SendTo("/topic/publicChatRoom")
    public TextMessage sendMessage( @Payload TextMessage chatMessage) {
    	return chatMessage;
    }

  
 
}