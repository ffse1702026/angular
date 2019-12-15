package com.d2e.controller;
 
import static java.lang.String.format;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.BinaryMessage;

import com.d2e.dao.ChatMessageDAO;
import com.d2e.entity.ChatMessage;
import com.d2e.entity.ChatMessage.MessageType;
 
@Controller
public class WebSocketController {
	@Autowired
	private ChatMessageDAO chatMessageDAO;
	
	private Set<String> setUserConect = new HashSet<>();
	
    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/publicChatRoom")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
    	chatMessageDAO.createChatMessage(chatMessage);
        return chatMessage;
    }
 
    @MessageMapping("/chat.addUser")
    @SendTo("/topic/publicChatRoom")
    public BinaryMessage addUser(@Payload BinaryMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        // Add username in web socket session
       // headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }



    @Autowired
    private SimpMessageSendingOperations messagingTemplate;

    @MessageMapping("/chat/{roomId}/sendMessage")
    public void sendMessage(@DestinationVariable String roomId, @Payload ChatMessage chatMessage) {
      messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
      ChatMessage chatNew = new ChatMessage();
      StringBuilder content = new StringBuilder();
      for(String user : setUserConect){
    	  content.append(user).append(",");
      }
      content.append(" read");
      chatNew.setContent(content.toString());
      messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatNew);
    
    	  messagingTemplate.convertAndSend("/users/" + "dbuser1", chatNew);
    	  messagingTemplate.convertAndSend("/users/" + "dbadmin1", chatNew);
      
    }

    @MessageMapping("/chat/{roomId}/addUser")
    public void addUser(@DestinationVariable String roomId, @Payload ChatMessage chatMessage,
        SimpMessageHeaderAccessor headerAccessor) {
      String currentRoomId = (String) headerAccessor.getSessionAttributes().put("room_id", roomId);
      if (currentRoomId != null) {
        ChatMessage leaveMessage = new ChatMessage();
        leaveMessage.setType(MessageType.LEAVE);
       // leaveMessage.setSender(chatMessage.getSender());
        //setUserConect.remove(chatMessage.getUsername());
        messagingTemplate.convertAndSend(format("/channel/%s", currentRoomId), leaveMessage);
      }
     // headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
      //setUserConect.add(chatMessage.getUsername());
      messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
      ChatMessage chatNew = new ChatMessage();
      StringBuilder content = new StringBuilder();
      for(String user : setUserConect){
    	  content.append(user).append(",");
      }
      content.append(" read");
      chatNew.setContent(content.toString());
      messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatNew);
    }
    
    @MessageMapping("/chat/{roomId}/checkRead")
    public void checkRead(@DestinationVariable String roomId, @Payload ChatMessage chatMessage,
        SimpMessageHeaderAccessor headerAccessor) {
      String currentRoomId = (String) headerAccessor.getSessionAttributes().put("room_id", roomId);
      headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
      messagingTemplate.convertAndSend(format("/channel/%s", roomId), chatMessage);
    }
 
}