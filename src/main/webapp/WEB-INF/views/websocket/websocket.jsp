<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

    $(document).ready(function () {
        //여기다가 세션에서 받아온 유저 닉네임 or 아이디 넣어주면 됨
        const username = [['익명이']];

        $("#disconn").on("click", (e) => {
            websocket.close();
        })

        $("#button-send").on("click", (e) => {
            send();
        });

        $("#enter-chat").on("click", (e) => {
            onOpen();
        });

        //이게 방 주소
        const websocket = new WebSocket("ws://192.168.41.27:80/WebEcho?roomNumber=1");
        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = onClose;
        websocket.onerror = function (err) {
            console.log('Error:', err);
            setTimeout(function () {
                connect();
            }, 1000); // retry connection!!
        };

        function send() {
            let msg = document.getElementById("msg");
            console.log(username + ":" + msg.value);
            websocket.send(username + ":" + msg.value);
            msg.value = '';
        }

        //채팅창에서 나갔을 때 인식이 안되네 ... 이거 세션 종료 제대로 해야하는데 나중에 체크해봐야할듯
        function onClose() {
            console.log(username + ": 님이 방을 나가셨습니다.");
            var str = username + ": 님이 방을 나가셨습니다.";
            websocket.send(str);
        }

        //채팅창에 들어왔을 때 이건 잘 됨
        function onOpen() {
            var str = username + ": 님이 입장하셨습니다.";
            websocket.send(str);
        }

        function onMessage(msg) {
            var data = msg.data;
            var sessionId = null;
            //데이터를 보낸 사람
            var message = null;
            var arr = data.split(":");

            for (var i = 0; i < arr.length; i++) {
                console.log('arr[' + i + ']: ' + arr[i]);
            }

            var cur_session = username;

            //현재 세션에 로그인 한 사람
            console.log("cur_session : " + cur_session);
            sessionId = arr[0];
            message = arr[1];

            console.log("sessionID : " + sessionId);
            console.log("cur_session : " + cur_session);

            var str = "<div class='col-6'>";
            str += "<div class='alert alert-warning'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#msgArea").append(str);
        }
    })
</script>
<div class="container">
    <div class="col-6">
        <label><b>채팅방</b></label>
    </div>
    <div>
        <div id="msgArea" class="col"></div>
        <div class="col-6">
            <div class="input-group mb-3">
                <input type="text" id="msg" class="form-control" aria-label="Recipient's username"
                       aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                    <button class="btn btn-outline-secondary" type="button" id="disconn">나가기</button>
                    <button class="btn btn-outline-secondary" type="button" id="enter-chat">접속</button>
                </div>
            </div>
        </div>
    </div>
</div>
</html>