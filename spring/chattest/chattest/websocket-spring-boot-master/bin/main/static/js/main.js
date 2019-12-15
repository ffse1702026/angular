'use strict';
 
 
var messageForm = document.querySelector('#messageForm');
var messageInput = document.querySelector('#message');
var messageArea = document.querySelector('#messageArea');
var connectingElement = document.querySelector('#connecting');
const sendImageButton = document.getElementById("sendImage");
 
var stompClient = null;
var username = null;
var userid = null;
  
 
function connect() {
    username = document.querySelector('#username').innerText.trim();
    userid = document.querySelector('#userid').innerText.trim(); 
    var socket = new SockJS('ws://localhost:8080/socket');
    stompClient = Stomp.over(socket);
 
    stompClient.connect({}, onConnected, onError);
}
 
// Connect to WebSocket Server.
connect();
 
function onConnected() {
    // Subscribe to the Public Topic
	var roomchat = document.querySelector('#roomchat').value;
    stompClient.subscribe('/channel/'+ roomchat , onMessageReceived);
 
    // Tell your username to the server
    stompClient.send("/app/chat/"+ roomchat +"/addUser",
        {},
        JSON.stringify({sender: userid, username:username, type: 'JOIN'})
    )
 
    connectingElement.classList.add('hidden');
}
 
 
function onError(error) {
    connectingElement.textContent = 'Could not connect to WebSocket server. Please refresh this page to try again!';
    connectingElement.style.color = 'red';
}
 
 
function sendMessage(event) {
    var messageContent = messageInput.value.trim();
    var roomchat = document.querySelector('#roomchat').value;
    if(messageContent && stompClient) {
        var chatMessage = {
            sender: userid,
            username:username,
            content: messageInput.value,
            type: 'CHAT'
        };
        stompClient.send("/app/chat/"+ roomchat +"/sendMessage", {}, JSON.stringify(chatMessage));
        messageInput.value = '';
    }
    event.preventDefault();
}
 
 
function onMessageReceived(payload) {
    var message = JSON.parse(payload.body);
    username = document.querySelector('#username').innerText.trim();
    var messageElement = document.createElement('li');
    if(username != message.username){
    	messageElement.classList.add('right');
    }
    if(message.type === 'JOIN') {
        messageElement.classList.add('event-message');
        message.content = username + ' joined!';
    }
    else if(message.type === 'READ') {
        messageElement.classList.add('event-message');
        message.content = username + ' READ!';
    }
    else if (message.type === 'LEAVE') {
        messageElement.classList.add('event-message');
        message.content = message.sender + ' left!';
    } else {
    	 messageElement.classList.add('chat-message');   
         var usernameElement = document.createElement('strong');
         usernameElement.classList.add('nickname');
         if(message.username != null){
        	 var usernameText = document.createTextNode(message.username);
             var usernameText = document.createTextNode(message.username);
         }else {
        	 var usernameText = document.createTextNode("");;
         }
         usernameElement.appendChild(usernameText);
         messageElement.appendChild(usernameElement);
    }
 
    var textElement = document.createElement('span');
    var messageText = document.createTextNode(message.content);
    textElement.appendChild(messageText);
 
    messageElement.appendChild(textElement);
    
    messageArea.appendChild(messageElement);
    messageArea.scrollTop = messageArea.scrollHeight;
    
}

function changeStatus(event){
	var roomchat = document.querySelector('#roomchat').value;
    stompClient.send("/app/chat/"+ roomchat +"/checkRead",
            {},
            JSON.stringify({sender: userid, username:username, type: 'READ'})
        )
}

sendImageButton.onclick = function (event) {
	
	const socket = new WebSocket("ws://localhost:8080/socket");
	socket.binaryType = "arraybuffer";
    let file = fileInput.files[0];
    $("#file_name").val(file.name);
    sendMessages(file);
    fileInput.value = null;
    socket.onmessage = function (event) {
    	console.log(event);
        if (event.data instanceof ArrayBuffer) {
            addMessageToWindow('Got Image:');
            addImageToWindow(event.data);
        } else {
            addMessageToWindow(`Got Message: ${event.data}`);
        }
    };
};

  
messageForm.addEventListener('submit', sendMessage, true);
//messageForm.addEventListener('focus', changeStatus, true);

//messageInput.addEventListener('focus', changeStatus, true);