<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Team Maker</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/style.css" type="text/css">
</head>

<style>
    div {
        color: white
    }

    /* 바디 백그라운드 */
    body {
        background: black;
    }

    p {
        margin: 20px 0px;
        color: #D8D8D8;
    }

    input[type=text] {
        background: lightgrey;
    }

    .btn-primary {
        background-color: #660099;
        border: none;
    }

    h5 {
        color: white;
    }

    div > div > div > label > img {
        width: 20px;
        height: 20px;
    }

    .btn-danger:not(:disabled):not(.disabled).active {
        background-color: lightblue;
        border-color: lightblue;
        color: purple;
    }

    .btn-danger:hover {
        background-color: coral;
        text-decoration: none;
    }

    /* 랭크,자랭,일반,칼바람 분류 라디오버튼 */
    .btn-gmode {
        color: black;
        background-color: #FF8000;
        border: white;
        text-decoration: none;
    }

    /* 방끌어 올리기 */
    .btn-usepoint {
        color: black;
        background-color: #F2F2F2;
        border: white;
        text-decoration: none;
    }

    input[type="submit"] {
        background: lightgrey;
    }

    /* 마이크 온오프 CHECKBOX */
    input.apple-switch {
        position: relative;
        appearance: none;
        outline: none;
        width: 50px;
        height: 30px;
        background-color: #ffffff;
        border: 1px solid #D9DADC;
        border-radius: 50px;
        box-shadow: inset -20px 0 0 0 lightgrey;
        transition-duration: 200ms;
    }

    input.apple-switch:after {
        content: "";
        position: absolute;
        top: 1px;
        left: 1px;
        width: 26px;
        height: 26px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 2px 4px 6px rgba(0, 0, 0, 0.2);
    }

    input.apple-switch:checked {
        border-color: #4ED164;
        box-shadow: inset 20px 0 0 0 #4ED164;
    }

    input.apple-switch:checked:after {
        left: 20px;
        box-shadow: -2px 4px 3px rgba(0, 0, 0, 0.05);
    }
</style>

<script type="text/javascript">
    function fn_chatRoom() {
        window.open("chatRoom", "chatingRoom",
            "width=800, height=600, left=500, top=250");
    }
</script>
<body>

<div id="preloder">
    <div class="loader"></div>
</div>

<!-- 라인을 클릭했을때 라인에 따라 움직이는 gif 만들기 -->
<!-- <span style="text-align: right;"> -->
<!-- 	포인트 -->
<!-- </span> -->
<div class="container" style="display: flex; justify-content: flex-end;">Lv.백신 / exp : 2810</div>
<div class="container">
    <div class="row">
        <div class="col" style="text-align: center;">
            <p>
            <h5 style="font-family: mapleBold">닉네임 : FFF</h5>
            </p>
            <p id="title" style="margin-bottom: 10px;">
                <b style="font-family: mapleBold;">제목 :&nbsp; <input type="text" maxlength='12'/></b>
            </p>
            <p id="message" style="margin-top: 10px; margin-bottom: 15px;">
                <b style="font-family: mapleBold;">메시지 :&nbsp; <input type="text" maxlength='30'/></b>
            </p>

            <div style="margin-bottom: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
                <label id="Gmode" class="btn btn-danger btn-gmode">
                    <input type="radio" name="jb-radio" id="jb-radio-1">일반게임
                    <!-- 						<img src="${path}/img/lol/Position_Challenger-Top.png" /> -->
                </label>
                &nbsp;
                <label id="Gmode" class="btn btn-danger btn-gmode">
                    <input type="radio" name="jb-radio" id="jb-radio-2">랭크게임
                    <!-- 						<img src="${path}/img/lol/Position_Challenger-Jungle.png" /> -->
                </label>
                &nbsp;
                <label id="Gmode" class="btn btn-danger btn-gmode">
                    <input type="radio" name="jb-radio" id="jb-radio-3">자유랭크
                    <!-- 						<img src="${path}/img/lol/Position_Challenger-Mid.png" /> -->
                </label>
                &nbsp;
                <label id="Gmode" class="btn btn-danger btn-gmode">
                    <input type="radio" name="jb-radio" id="jb-radio-4">칼바람
                    <!-- 						<img src="${path}/img/lol/Position_Challenger-Bot.png" /> -->
                </label>
                &nbsp;
            </div>

            <br/>

            <div style="margin-bottom: 3px; margin-top: 10px;" class="btn-group btn-group-toggle" data-toggle="buttons">
                <label id="position" class="btn btn-danger">
                    <input type="radio" name="jb-radio" id="jb-radio-1" value="top">
                    <img src="${path}/img/lol/Position_Challenger-Top.png"/>
                </label>
                &nbsp;
                <label id="position" class="btn btn-danger">
                    <input type="radio" name="jb-radio" id="jb-radio-2" value="jun">
                    <img src="${path}/img/lol/Position_Challenger-Jungle.png"/>
                </label>
                &nbsp;
                <label id="position" class="btn btn-danger">
                    <input type="radio" name="jb-radio" id="jb-radio-3" value="mid">
                    <img src="${path}/img/lol/Position_Challenger-Mid.png"/>
                </label>
                &nbsp;
                <label id="position" class="btn btn-danger">
                    <input type="radio" name="jb-radio" id="jb-radio-4" value="bot">
                    <img src="${path}/img/lol/Position_Challenger-Bot.png"/>
                </label>
                &nbsp;
                <label id="position" class="btn btn-danger">
                    <input type="radio" name="jb-radio" id="jb-radio-5" value="sup">
                    <img src="${path}/img/lol/Position_Challenger-Support.png"/>
                </label>
                &nbsp;
            </div>

            <br/>

            <div class="container">
                <p style="margin-bottom: 3px;">방끌어올리기!!(-1000px)</p>
                <div style="margin-bottom: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
                    <label id="roomOn" class="btn btn-danger btn-usepoint">
                        <input type="radio" name="jb-radio" id="jb-radio-1" value="top">
                        <img style="width: 20px; height: 20px;" src="${path}/img/details/check_o.png"/>
                    </label>
                    &nbsp;
                    <label id="roomOn" class="btn btn-danger btn-usepoint">
                        <input type="radio" name="jb-radio" id="jb-radio-2" value="jun">
                        <img style="width: 20px; height: 20px;" src="${path}/img/details/check_x.png"/>
                    </label>
                    &nbsp;
                </div>
                <div style="margin-top: 10px; margin-bottom: 3px;">
                    <label class="form-check-label" for="flexSwitchCheckChecked">마이크 </label>
                </div>
                <input class="apple-switch" type="checkbox" id="flexSwitchCheckChecked" checked>
            </div>
            <br/> <input type="submit" value="방만들고 채팅창으로 이동!" onclick="fn_chatRoom()">
        </div>
    </div>
</div>

<!-- Js Plugins -->
<script src="${path}/js/jquery-3.3.1.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="${path}/js/jquery.magnific-popup.min.js"></script>
<script src="${path}/js/circle-progress.min.js"></script>
<script src="${path}/js/jquery.barfiller.js"></script>
<script src="${path}/js/jquery.slicknav.js"></script>
<script src="${path}/js/owl.carousel.min.js"></script>
<script src="${path}/js/main.js"></script>

</body>
</html>