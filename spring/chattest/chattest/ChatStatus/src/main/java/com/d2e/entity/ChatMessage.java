package com.d2e.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chat_messgae")
public class ChatMessage {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true)
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name="type")
    private MessageType type;
    
    @Column(name="message")
    private String content;
    
    @Column(name="id_user")
    private String sender;
    
    @Column(name="user_name")
    private String username;
    
    
    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public enum MessageType {
        CHAT, JOIN, LEAVE, READ
    }
 
    public MessageType getType() {
        return type;
    }
 
    public void setType(MessageType type) {
        this.type = type;
    }
 
    public String getContent() {
        return content;
    }
 
    public void setContent(String content) {
        this.content = content;
    }
 
    public String getSender() {
        return sender;
    }
 
    public void setSender(String sender) {
        this.sender = sender;
    }
     
}