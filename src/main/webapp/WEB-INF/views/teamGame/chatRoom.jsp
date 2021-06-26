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
<title>Chat System</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
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
body {
	background: black;
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

.chatBox {
	margin: 10px 25px 55px;
	word-break: break-all;
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
	margin: 5px;
	text-align: right;
	text-decoration: underline;
	font-style: italic;
}

body {
	overflow-x: hidden;
	overflow-y: hidden;
}

input[type="text"] {
	margin-top: 2px;
	width: 530px;
	height: 40px;
	width: 530px;
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

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
.siteLv{
	width: 10px;
	height: 10px;
}

img {
	width: 40px;
	height: 40px;
	margin: 4px;
}
</style>


<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="container">
		<div id="cr_title" class="row">&nbsp;Faker | 그마이상구함!</div>
		<div id="containBox" class="row">
			<div id="includeBox" class="col-sm-9">
				<div class="caution">상처가 되는 말은 하지 말아주세요!</div>
				<div class="chatBox" style="font-size: 14px;">
					박세웅: 오호오호!<br /> 박세웅: 채팅은 조금 많이 어려울거 같습니다.<br /> 박세웅: 소켓에 대한 이해가 많이 필요한 기능같습니다.<br /> <br /> 박세웅: 다음주 주간목표가 난이도로 따지면 최고일 수도...아님말고.. <br /> 박세웅: 다음주도 열심히 달려봅시다.. <br /> <br />박세웅: 이모티콘 관련해서는 api가 따로 없네요... <br />박세웅: 아쉽지만 아쉬운대로 파일첨부로 대신해야할거 같습니다만?...

				</div>
				<div class="enterBox row">
					<div>
						&nbsp;&nbsp;&nbsp; 채팅: &nbsp;<input type="text" />
					</div>
					<div class="filebox">
						<label for="file">임티</label>
						<input type="file" id="file" /> <input type="submit" value="전송" />
					</div>
				</div>
			</div>

			<div class="userBox col-sm-3">
				<div class="user">
					<img src="${path}/img/lol/challenger.png" />
					<img class="siteLv" src="${path}/img/details/adminIcon.png" />
					<div class="userInfo">사용자1</div>
				</div>
				<div class="user">
					<img src="${path}/img/lol/challenger.png" />
					<div class="userInfo">사용자2</div>
				</div>
				<div class="user">
					<img src="${path}/img/lol/challenger.png" />
					<div class="userInfo">사용자3</div>
				</div>
				<div class="user">
					<img src="${path}/img/lol/challenger.png" />
					<div class="userInfo">사용자4</div>
				</div>
				<div class="user">
					<img src="${path}/img/lol/challenger.png" />
					<div class="userInfo">사용자5</div>
				</div>
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