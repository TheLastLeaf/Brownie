<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chat System</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://raw.githubusercontent.com/9bitStudios/barfiller/master/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css"
          integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css"
          integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<style>
    body {
        background: black;
        overflow-x: hidden;
        overflow-y: hidden;
    }

    #cr_title {
        display: flex;
        justify-content: flex-start;
        color: white;
        background: maroon;
        border-radius: 5px;
    }

    .container {
        margin: 8px;
        /* 	border: 1px solid white; */
        width: 960px;
        height: 650px;
        overflow: auto;
    }

    #containBox {
        height: 600px;
        display: flex;
        justify-content: center;
    }

    .enterBox {
        position: absolute;
        bottom: 0;
        border-top: 1px solid white;
        width: 100%;
        border-radius: 10px;
    }

    #includeBox {
        color: white;
        border: 1px solid white;
        border-radius: 10px;
    }

    #chatBox {
        padding: 0px;
        height: 520px;
        overflow: auto;
    }

    .user {
        margin-top: 10px;
        position: relative;
        bottom: 0;
        border: 1px solid white;
    }

    .userBox {
        border: 1px solid white;
        color: white;
        border-radius: 10px;
        word-break: break-all;
        color: white;
    }

    .userInfo {
        margin: 5px;
    }

    .caution {
        font-size: 10px;
        margin: 5px;
        text-align: right;
        text-decoration: underline;
        font-style: italic;
    }

    input[type="text"] {
        margin-top: 1px;
        margin-left: 4px;
        width: 530px;
        height: 40px;
        width: 650px;
    }

    .filebox label {
        display: inline-block;
        padding: .4em .75em;
        color: #999;
        font-size: inherit;
        line-height: normal;
        vertical-align: middle;
        background-color: #fdfdfd;
        cursor: pointer;
        border: 1px solid #ebebeb;
        border-bottom-color: #e2e2e2;
        border-radius: .25em;
        margin: 3px 0px 0px 0px;
    }

    .siteLv {
        width: 30px;
        height: 30px;
    }

    img {
        width: 40px;
        height: 40px;
        margin: 4px;
    }

    #button-send {
        width: 58px;
        margin: 2px;
        background-color: maroon;
    }

    .alert-warning {
        word-break: break-all;
        height: auto;
        width: 500px;
    }
    .user-act-btn {
        width: 50px;
        font-size: 12px;
        float: right;
        padding: 2px;
        margin: 10px 3px 0px;
    } 
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function () {
        $('#msg').focus();

        const LOL_NICK = '${userInfo.lolId}';
        const USER_NAME = [['${userInfo.nickName}']];
        const IN_USER_ID = '${userInfo.userId}';
        const ROOM_NUMBER = '${userInfo.roomNumber}';

        console.log("IN_USER_ID : " + IN_USER_ID);
        console.log("LOL_NICK : " + LOL_NICK);
        console.log("ROOM_NUMBER : " + ROOM_NUMBER);

        $("#button-send").on("click", (e) => {
            send();
        });
        $(document).bind('keypress', pressed);

        function pressed(e) {
            if (e.keyCode === 13) {
                send();
            }
        }

        //이게 방 주소
        const websocket = new WebSocket("ws://" + window.location.host + ":80/WebEcho?roomNumber=" + ROOM_NUMBER);
        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = function (event) {
            if (event.wasClean) {
                console.log("[info] 커넥션이 정상적으로 종료되었습니다(code=" + event.code + " reason=" + event.reason + ")");
                // alert("[close] 커넥션이 정상적으로 종료되었습니다(code=" + event.code + " reason=" + event.reason + ")");
            } else {
                // https://ko.javascript.info/websocket#ref-1158 여기에 오류 코드별 설명이 있음
                // 1000 : 일반폐쇄
                alert('[info] 서버와 연결이 끊어졌습니다.');
            }
            setTimeout(function () {
                connect();
                alert('[info] 서버에 다시 연결되었습니다.')
            }, 1000); // retry connection!!
        };

        websocket.onerror = function (err) {
            console.log('Error:', err);
            setTimeout(function () {
                connect();
            }, 1000); // retry connection!!
        };

        function send() {
            let msg = document.getElementById("msg");
            console.log(USER_NAME + ":" + msg.value + ":" + IN_USER_ID);
            websocket.send(USER_NAME + ":" + msg.value + ":" + IN_USER_ID);
            msg.value = '';
        }

        function onOpen(evt) {
            var str = USER_NAME + ": 님이 입장하셨습니다.:" + IN_USER_ID;
            websocket.send(str);
        }

        function onMessage(msg) {
            var data = msg.data;
            var sessionId = null;
            var message = null;
            var sessionLolNick = null;
            var arr = data.split(":");

            for (var i = 0; i < arr.length; i++) {
                console.log('arr[' + i + ']: ' + arr[i]);
            }

            var cur_session = USER_NAME;

            console.log("cur_session : " + cur_session);
            sessionId = arr[0];
            message = arr[1];
            speakerId = arr[2];
            sessionLolNick = arr[3];

            console.log("sessionID : " + sessionId + " / speakerId : " + speakerId + " / sessionLolNick : " + sessionLolNick);
            console.log("cur_session : " + cur_session);
            console.log("type of message : ", typeof message);
            var str = "<div class='col-6'>";
            str += "<div class='alert alert-warning'>";
            str += "<b>" + sessionId + " : " + message + "</b>";
            str += "</div></div>";
            $("#chatBox").append(str);
            $('#msg').focus();

            if(sessionId === "오류"){
                console.log("오류")
            }

            if(speakerId.includes("방장퇴장")) {
                alert("방장이 퇴장하였습니다. 팀원 모집이 종료됩니다.");
                $('.act-btn input').prop('disabled',true);
                $('div').remove('#'+sessionLolNick);
            }

            if(speakerId.includes("팀원퇴장")) {
                $('div').remove('#'+sessionLolNick);
            }
 
            if (message === " 님이 입장하셨습니다.") {
                console.log("입장했댄다")

                if ($('#' + speakerId).length == 0) {

                    if(!sessionLolNick.includes("_")){
                        var newUser = "<div class='user' id=" + speakerId + ">"
                        newUser += "<span><img src='${pageContext.request.contextPath}/img/lol/lolTier/challenger.png'/></span>"
                        newUser += "<span class='act-btn'>" +
                                        "<input type='sumbit' value='신고' class='user-act-btn btn btn-outline-secondary' onclick='fn_chatReport("+speakerId+","+ROOM_NUMBER+")' />" +
                                        "<input type='sumbit' value='정보' id="+sessionLolNick+" class='user-act-btn btn btn-outline-secondary' onclick='fn_isSearch(this.id)'/>" +
                                        "</span>"
                        newUser += "<div class='userInfo'>" + sessionId + "[" + sessionLolNick + "]" + "</div>"
                    } else {
                        var newUser = "<div class='user' id=" + speakerId + ">"
                        newUser += "<span><img src='${pageContext.request.contextPath}/img/lol/lolTier/challenger.png'/></span>"
                        newUser += "<span class='act-btn'>" +
                                        "<input type='sumbit' value='신고' class='user-act-btn btn btn-outline-secondary' onclick='fn_chatReport("+speakerId+","+ROOM_NUMBER+")' />" +
                                        "</span>"
                        newUser += "<div class='userInfo'>" + sessionId + "[" + sessionLolNick + "]" + "</div>"
                        newUser += "</div>"
                    }
                    $("#chatUserList").append(newUser);
                }
            }

            $('#chatBox').animate({
                scrollTop: chatBox.scrollHeight - chatBox.clientHeight
            }, 100);
            $('#msg').focus();
        }

    })
    function fn_isSearch(lolId){
    	window.open("/search?title="+lolId, "search",
        "width=1100px, height=700px, left=450px,top=120px");
    }

    function fn_chatReport(userId,teamGameSeq){
        window.open("/report/chat?userId=" + userId + "&teamGameSeq=" + teamGameSeq, "REPORT", "width=660, height=500, left=250,top=200");
    }
</script>

<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="container">
    <div id="cr_title" class="row">&nbsp;${roomInfo.teamGameSeq} | ${roomInfo.title}</div>
    <div id="containBox" class="row">
        <div id="includeBox" class="col-sm-9">
            <div class="caution">상처가 되는 말은 하지 말아주세요!</div>
            <div id="chatBox" class="col"></div>

            <div class="enterBox row">
                <input type="text" id="msg" class="form-control" aria-label="Recipient's username"
                       aria-describedby="button-addon2">
                <input type="sumbit" value="전송" class="btn btn-success btn-outline-secondary" id="button-send"/>
            </div>
        </div>

        <div class="userBox col-sm-3" id="chatUserList">
            <c:forEach var="memList" items="${memList}">
                <div class="user" id="${memList.userId}">
                    <span>
                        <img src='${pageContext.request.contextPath}/img/lol/lolTier/challenger.png'/>
                    </span>
                    <span class='act-btn'>
                        <c:set var = "lolId" value = "${memList.lolId}"/>
                        <c:if test = '${not fn:contains(lolId, userInfo.lolId)}'>
                        <input type='sumbit' value='신고' class='user-act-btn btn btn-outline-secondary' onclick="fn_chatReport('${memList.userId}','${memList.teamGameSeq}')"/>
                        </c:if>
                        <c:if test = '${not fn:contains(lolId, "_")}'>
                        <input type='sumbit' value='정보' id="${memList.lolId}" class='user-act-btn btn btn-outline-secondary' onclick="fn_isSearch(this.id)"/>
                        </c:if>

                    </span>
                    <div class="userInfo"><span class="memNick">${memList.nickName}</span> [${memList.lolId}]</div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>


<!-- Js Plugins -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"
        integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js"
        integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://raw.githubusercontent.com/9bitStudios/barfiller/master/js/jquery.barfiller.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.js"
        integrity="sha512-AmJ0T6lpw/ZQtCleMyfbraDy8AGQ9tWaB/PmRkXdKxH9Kvo0oTuW6+2hTEQ89mHkFIO/LpColEe3+QE+FJtgIg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"
        integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>