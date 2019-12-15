


    const messageWindow = document.getElementById("messages");

    const sendButton = document.getElementById("send");
    const messageInput = document.getElementById("message");

    const fileInput = document.getElementById("file");
    const sendImageButton = document.getElementById("sendImage");

    
    

    

    sendButton.onclick = function (event) {
        sendMessages(messageInput.value);
        messageInput.value = "";
    };

    sendImageButton.onclick = function (event) {
    	
    	const socket = new WebSocket("ws://localhost:8092/socket");
    	socket.binaryType = "arraybuffer";
        let file = fileInput.files[0];
        $("#file_name").val(file.name);
        sendMessage(file);
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

    function sendMessage(message) {
    	const socket = new WebSocket("ws://localhost:8092/socket")
        socket.send(message);
        addMessageToWindow("Sent Message: " + message);
    }

    function addMessageToWindow(message) {
        messageWindow.innerHTML += `<div>${message}</div>`
    }

    function addImageToWindow(image) {
        let url = URL.createObjectURL(new Blob([image]));
        var file_name = $("#file_name").val();
        
        var link = `<a href="${url}" download="${file_name}"/>"${file_name}"`;
        sendMessage(link);
    }
    
    
    function connect() {
        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);
     
        stompClient.connect({}, onConnected, onError);
    }
    
    connect();
    
    function onConnected() {
    	 
        stompClient.subscribe('/topic/publicChatRoom' , onMessageReceived);
     
    }
    
    
    function onError(error) {
        alert("cannot connect");
    }
    
    function sendMessages(message) {
 
            stompClient.send('/app/chat/sendMessage', {}, JSON.stringify(message));
            messageInput.value = '';

    }
    
    function onMessageReceived(payload) {
    	console.log(payload);
        var message = JSON.parse(payload.body);
       
        messageWindow.innerHTML += `<div>${message.payload}</div>`
    }

    
    