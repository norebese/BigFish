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

<!-- JS-->
<script src="<%=contextPath%>/resources/js/companyChat.js"></script>

<!-- CSS-->
<script src="<%=contextPath%>/resources/css/companyChat.css"></script>

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

<style>
	.main{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body class="main">
	
	<div id="topTitle" style="display: flex; justify-content: center; background: rgb(59, 175, 252);">
	</div>
	<br>
	<div style="display: flex; width: 100%; height: 75vh;">
		<div id="chooseUserArea" style="display: flex; width: 35%; flex-direction: column; margin: 0px 10px; border-right: 2px solid rgb(204, 204, 204); ">
		</div>
		
		<div id="chatArea" style="overflow: auto; display: flex; width: 100%; height: 100%; flex-direction: column; margin-left: 8px;">
			
		</div>

	</div>
	<div style="display: flex; flex-direction: row; height: 92px; border-top: 2px solid rgb(204, 204, 204);">
		<textarea id="chatMsg" style="width: 80%; height: 90%; border: none; resize: none; margin-top: 3.5px;"></textarea>
		<button id="chatSend" onclick="sendMsg(0)" style="width: 20%; background:rgb(59, 175, 252); border: none;" class="btn btn-sm btn-primary">전송</button>
	</div>
	
</body>

<script>
	
	const socket = new WebSocket("ws://localhost:8987/bigFish/server")

	sendData = {receiverId : "${storeNo}"}
	
	chatApi.getUserForChat(sendData, function(result){
		const chooseUserArea = document.querySelector("#chooseUserArea");
		console.log(result);
		for(let m of result){
			
			chooseUserArea.insertAdjacentHTML('beforeend','<div onclick="getChat('+m.memNo+',`'+m.memNick+'`)" style="cursor: pointer; width: 100%; height: 10%; border: 1px solid white; display: flex; flex-direction: row; justify-content: space-evenly; align-items: center;">'+m.memNick+'<img id="readCheckRedDot'+m.memNo+'" src="resources/images/red-dot.png" style="visibility: hidden; width:10px; height:10px;" alt=""></div>')

			//m.memNo 가 sendId인 데이터중에 readcheck가 N인게 하나라도 있으면 빨간불 아니면 불없음
			let data = {senderId : m.memNo+"",
						receiverId : "${storeNo}"};

						
			chatApi.readCheckPersonal(data, function(result){
				if(result>0){
					
					const readCheckReddot = document.querySelector("#readCheckRedDot"+m.memNo); 
					readCheckReddot.style.visibility = "visible";
					console.log(m.memNo+" 안읽은거 남음");
				}else{
					const readCheckReddot = document.querySelector("#readCheckRedDot"+m.memNo); 
					readCheckReddot.style.visibility = "hidden";
					console.log(m.memNo+" 안읽은거 없음");
				}
			})

			
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
		console.log(ev.data)

		const receive = JSON.parse(ev.data);

		const chatArea = document.querySelector("#chatArea");


		if(receive.type === "personal"){
			console.log(receive.type);
			chatArea.insertAdjacentHTML('beforeend','<div style="display: flex; justify-content: flex-end;">'+
				'<div class="card" style="display: flex; justify-content: flex-end; background: rgb(59, 175, 252);">' +
					'<div class="card-body">'+receive.msg+'</div>' +
				'</div>'+
			'</div><br>');

			
		}else{
			console.log(receive.type);

			let memberData = {memNo : receive.senderNo}
			chatApi.getUserNameInfoForChat(memberData, function(result){

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

	function sendMsg(memNo){
		const sendData = {
			message : document.querySelector("#chatMsg").value,
			target : memNo, // 개인 회원
			type : "personal"
		}
		
		socket.send(JSON.stringify(sendData));
		document.querySelector("#chatMsg").value = "";
		console.log(sendData);
	}

	function getChat(memNo, memNick){
		const chatSend = document.querySelector("#chatSend");
		chatSend.removeAttribute("onclick");
		chatSend.setAttribute("onclick","sendMsg("+memNo+")");

		const chatArea = document.querySelector("#chatArea");
		chatArea.innerHTML = "";

		const data = {
			senderId : memNo+"",
			receiverId : "${storeNo}"
		};

		chatApi.updateReadPersonal(data, function(sum){
			console.log(sum);
			if(sum>0){
				console.log("업데이트 된 수 : "+sum);
				const readCheckReddot = document.querySelector("#readCheckRedDot"+memNo); 
				readCheckReddot.style.visibility = "hidden";
			}else{
				console.log("읽음 처리 실패");
			}
		})


		chatApi.getChat(data, function(result){


			for(let c of result){
				if(c.type ==="company"){
					// 남(개인)이 보낸거
					chatArea.insertAdjacentHTML('beforeend','<div>'+
						memNick+
						'<div class="card">'+
							'<div class="card-body">'+c.msgText+'</div>'+
						'</div>'+
					'</div><br>');
				}else{
					// 나(사업장)이 보낸거
					chatArea.insertAdjacentHTML('beforeend','<div style="display: flex; justify-content: flex-end;">'+
						'<div class="card" style="display: flex; justify-content: flex-end; background: rgb(59, 175, 252);">' +
							'<div class="card-body">'+c.msgText+'</div>' +
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

		
		

		storeApi.getStoreForChat(storeData, function(result){
			console.log(result);
			topTitle.innerHTML = result.storeName+" 의 1:1 문의하기";
		})

		
	}

</script>
</html>