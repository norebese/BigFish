<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BIG FISH</title>

<!-- 폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- memberAPI-->
<script src="<%=contextPath%>/resources/js/service/member-api.js"></script>

<!-- storeAPI-->
<script src="<%=contextPath%>/resources/js/service/store-api.js"></script>

<!-- chatAPI-->
<script src="<%=contextPath%>/resources/js/service/chat-api.js"></script>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
</head>
<body class="main">

<div id="topTitle" style="display: flex; justify-content: center; background: rgb(59, 175, 252);">
	</div>
	<br>
	<div style="display: flex; width: 100%; height: 81vh;">
		<div id="chooseStoreArea" style="display: flex; width: 35%; flex-direction: column; margin: 0px 10px; border-right: 2px solid rgb(204, 204, 204); ">

		</div>
		
		<div id="chatArea" style="overflow: auto; display: flex; width: 100%; height: 100%; flex-direction: column; margin-left: 8px;">
			
		</div>

	</div>
	<div style="display: flex; flex-direction: row; height: 112px; border-top: 2px solid rgb(204, 204, 204);">
		<textarea id="chatMsg" style="width: 80%; height: 90%; border: none; resize: none; margin-top: 3.5px;"></textarea>
		<button id="chatSend" onclick="sendMsg(0)" style="width: 20%; background:rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">전송</button>
	</div>
	
</body>

<script>
	
	const socket = new WebSocket("ws://localhost:8987/bigFish/server")
	chatApi.getRevStoreForChat(function(result){
			const chooseStoreArea = document.querySelector("#chooseStoreArea");
			console.log(result);

			for(let s of result){
				chooseStoreArea.insertAdjacentHTML('beforeend','<div class="choiceStore" onclick="getChat(this,'+s.rstoreNo+',`'+s.rstoreName+'`)" style="cursor: pointer; width: 100%; height: 10%; border: 1px solid white;">'+s.rstoreName+'</div>')
			}


		})
	
	
	

	// 소켓 연결 성공
	socket.onopen = function(){
		
		console.log("webSocket 연결 Ok");

	}

	// 소켓 연결 끊김
	socket.onclose = function(){
		console.log("webSocket 연결 끊김");
	}

	// 소켓 연결 실패
	socket.onerror = function(){
		console.log("webSocket 연결 실패");
	}

	// 소켓 연결로 데이터가 도착했을 때
	// 서버로부터 데이터가 도착했을 때
	socket.onmessage = function(ev){
		console.log(ev.data);

		const receive = JSON.parse(ev.data);

		const chatArea = document.querySelector("#chatArea");

		if(receive.type==="company"){
			chatArea.insertAdjacentHTML('beforeend','<div style="display: flex; justify-content: flex-end;">'+
				'<div class="card" style="display: flex; justify-content: flex-end; background: rgb(59, 175, 252);">' +
					'<div class="card-body">'+receive.msg+'</div>' +
				'</div>'+
			'</div><br>');
		}else{

			let storeNameData = {storeNo : receive.senderNo};

			chatApi.getStoreNameInfoForChat(storeNameData, function(result){
				chatArea.insertAdjacentHTML('beforeend','<div>'+
				result+
				'<div class="card">'+
					'<div class="card-body">'+receive.msg+'</div>'+
				'</div>'+
			'</div><br>');
			})


		}

		chatArea.scrollTop = chatArea.scrollHeight;


	}

	function sendMsg(storeNo){
		const sendData = {
			message : document.querySelector("#chatMsg").value,
			target : storeNo+"", //사업자회원
			type : "company"
		}
		
		socket.send(JSON.stringify(sendData));
		document.querySelector("#chatMsg").value = "";
		console.log(sendData);
	}
	

	function getChat(ev,storeNo,rstoreName){
		console.log(ev);
		
		const choiceStore = document.getElementsByClassName("choiceStore");
		for(let c of choiceStore){
			c.style.background = "white";
		}
		ev.style.background = "rgb(59, 175, 252)";
		const chatSend = document.querySelector("#chatSend");
		chatSend.removeAttribute("onclick");
		chatSend.setAttribute("onclick","sendMsg("+storeNo+")");


		const chatArea = document.querySelector("#chatArea");
		chatArea.innerHTML = "";
		const data = {
			senderId : storeNo+"",
			receiverId : "${loginUser.memNo}"
		}

		chatApi.getChat(data, function(result){
			console.log(result);

			for(let c of result){
				if(c.type==="company"){
					//내(개인)가보낸거임
					chatArea.insertAdjacentHTML('beforeend','<div style="display: flex; justify-content: flex-end;">'+
						'<div class="card" style="display: flex; justify-content: flex-end; background: rgb(59, 175, 252);">' +
							'<div class="card-body">'+c.msgText+'</div>' +
						'</div>'+
					'</div><br>');
				}else{
					//상대(사업장)가보낸거임
					chatArea.insertAdjacentHTML('beforeend','<div>'+
						rstoreName+
						'<div class="card">'+
							'<div class="card-body">'+c.msgText+'</div>'+
						'</div>'+
					'</div><br>');
				}
			}
			chatArea.scrollTop = chatArea.scrollHeight;
		})
	}




	window.onload = function(){
		const topTitle = document.querySelector("#topTitle");

		const storeData = {storeNo : "${storeNo}"};

		topTitle.innerHTML = "${loginUser.memNick}님의 1:1 문의하기";
		

		// storeApi.getStoreForChat(storeData, function(result){
		// 	console.log(result);
		// 	topTitle.innerHTML = result.storeName+" 의 1:1 문의하기";
		// })

		
	}

</script>

</html>