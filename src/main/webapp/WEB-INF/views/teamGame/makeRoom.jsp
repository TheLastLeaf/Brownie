<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Amin Template">
<meta name="keywords" content="Amin, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Team Maker</title>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/common/icon.ico" />

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
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
	margin: 20px 0;
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

div>div>div>label>img {
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

.submit {
	margin: 15px;
}
</style>

<script type="text/javascript">
	function fn_chatRoom() {
		makeRoom = window.open("chatRoom", "chatingRoom",
				"width=1100, height=720, scroll=no, left=500, top=250");
		opener = makeRoom;
		window.close();
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
	<div class="container d-flex justify-content-end">Lv.백신 / exp : 2810</div>
	<div class="container">
		<div class="row">
			<div class="col text-center" style="border: 1px solid white;">
				<p>
				<h5 style="font-family: mapleBold">닉네임 : FFF</h5>
				</p>
				<p id="title" class="botton" style="margin-bottom: 10px;">
					<b style="font-family: mapleBold;">제목 :&nbsp; <input type="text" maxlength='12' /></b>
				</p>
				<p id="message" style="margin-top: 10px; margin-bottom: 15px;">
					<b style="font-family: mapleBold;">메시지 :&nbsp; <input type="text" maxlength='30' /></b>
				</p>

				<div style="margin-bottom: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-danger btn-gmode Gmode">
						<input type="radio" name="jb-radio" class="jb-radio-1">
						일반게임
						<!-- 						<img src="${pageContext.request.contextPath}/img/lol/Position_Challenger-Top.png" /> -->
					</label>
					&nbsp;
					<label class="btn btn-danger btn-gmode Gmode">
						<input type="radio" name="jb-radio" class="jb-radio-2">
						랭크게임
						<!-- 						<img src="${pageContext.request.contextPath}/img/lol/Position_Challenger-Jungle.png" /> -->
					</label>
					&nbsp;
					<label class="btn btn-danger btn-gmode Gmode">
						<input type="radio" name="jb-radio" class="jb-radio-3">
						자유랭크
						<!-- 						<img src="${pageContext.request.contextPath}/img/lol/Position_Challenger-Mid.png" /> -->
					</label>
					&nbsp;
					<label class="btn btn-danger btn-gmode Gmode">
						<input type="radio" name="jb-radio" class="jb-radio-4">
						칼바람
						<!-- 						<img src="${pageContext.request.contextPath}/img/lol/Position_Challenger-Bot.png" /> -->
					</label>
					&nbsp;
				</div>

				<br />

				<div style="margin-bottom: 3px; margin-top: 10px;" class="btn-group btn-group-toggle" data-toggle="buttons">
					<label class="btn btn-danger position">
						<input type="radio" name="jb-radio" class="jb-radio-1" value="top">
						<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" alt="" />
					</label>
					&nbsp;
					<label class="btn btn-danger position">
						<input type="radio" name="jb-radio" class="jb-radio-2" value="jun">
						<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png" alt="" />
					</label>
					&nbsp;
					<label class="btn btn-danger position">
						<input type="radio" name="jb-radio" class="jb-radio-3" value="mid">
						<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" alt="" />
					</label>
					&nbsp;
					<label class="btn btn-danger position">
						<input type="radio" name="jb-radio" class="jb-radio-4" value="bot">
						<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" alt="" />
					</label>
					&nbsp;
					<label class="btn btn-danger position">
						<input type="radio" name="jb-radio" class="jb-radio-5" value="sup">
						<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png" alt="" />
					</label>
					&nbsp;
				</div>

				<br />

				<div class="container">
					<p style="margin-bottom: 3px;">10분간 1페이지 노출!(-1000px)</p>
					<div style="margin-bottom: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-danger btn-usepoint roomOn">
							<input type="radio" name="jb-radio" class="jb-radio-1" value="top">
							<img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/img/teamGame/check_o.png" alt="" />
						</label>
						&nbsp;
						<label class="btn btn-danger btn-usepoint roomOn">
							<input type="radio" name="jb-radio" class="jb-radio-2" value="jun">
							<img style="width: 20px; height: 20px;" src="${pageContext.request.contextPath}/img/teamGame/check_x.png" alt="" />
						</label>
						&nbsp;
					</div>
					<div style="margin-top: 10px; margin-bottom: 3px;">
						<label class="form-check-label" for="flexSwitchCheckChecked">마이크 </label>
					</div>
					<input class="apple-switch" type="checkbox" id="flexSwitchCheckChecked" checked>
				</div>
				<br />
				<div class="submit">
					<input type="submit" value="방만들고 채팅창으로 이동!" onclick="fn_chatRoom()">
				</div>
			</div>
		</div>
	</div>

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/circle-progress.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>