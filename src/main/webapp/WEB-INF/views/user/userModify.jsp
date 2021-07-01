<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Amin Template">
<meta name="keywords" content="Amin, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>MODIFY</title>

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
body {
	background: black;
}
.signup-section{
	overflow: hidden;
}
.profileBox {
	display: inline-block;
	width: 160px;
	height: 160px;
	border: 1px solid white;
	border-radius: 5px;
	color: white;
	margin: 0px 0px 10px 0px;
	position: relative;
	background: #1C1C1C;
}

.profile {
	object-fit: cover;
	width: 158px;
	height: 158px;
	border-radius: 15px;
}

.profileBox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

input[name="position"] {
	width: 20px;
	height: 20px;
}

.advice {
	color: #CEF6F5;
}

.chooseLane {
	color: white;
}
.input-value{
	width: 80%;
	text-align: center;
}
/* 선택되기전 기본색 */
.btn-danger {
	background: yellow;
	border-color: white;
}
/* 선택이 되었을때 색깔 */
.btn-danger:not(:disabled):not(.disabled).active {
	background-color: #FF0040;
	border-color: #FF0040;
	color: purple;
}
/* 선택이 끝난 이후 (기존 .btn-danger과 background 맞추는것을 선호)*/
.btn-danger.focus, .btn-danger:focus {
	background: #D7DF01;
}

/* 마우스 올려놓았을때 효과 */
.btn-danger:hover { 
	background-color: coral;
	border-color: red;
	text-decoration: none;
}

.signup-text{
	padding-top: 40px;
}


</style>
<script>
	function fn_close() {
		window.close();
	}
</script>

<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="signup-section" style="display: block;">
<!-- 		<div class="signup-close"> -->
<!-- 			<i class="fa fa-close" onclick="fn_close()"></i> -->
<!-- 		</div> -->
		<div class="signup-text">
			<div class="container">
				<div class="signup-title" style="margin-bottom: 20px;">
					<h2 style="font-family: mapleBold; color: white;">정보수정</h2>
					<p class="advice">사진을 눌러서 프로필을 바꿔보세요!</p>
				</div>
				<form action="#" class="signup-form">
					<div class="sf-input-list ">
						<!-- 					text-center justify-content-center align-items-center d-flex -->
						<div class="profileBox" style="border: none;">
							<label for="file">
								<img class="profile" src="${pageContext.request.contextPath}/img/user/sana1.gif">
								<input type="file" id="file" />
							</label>
						</div>
						<input type="text" class="input-value" placeholder="닉네임 변경 후 31일 동안 변경불가합니다*">

						<!-- 포지션선택 -->
						<div style="margin-bottom: 3px; margin-top: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-danger position">
								<input type="checkbox" name="jb-radio" class="jb-radio-1" value="top">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="jb-radio" class="jb-radio-2" value="jun">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="jb-radio" class="jb-radio-3" value="mid">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="jb-radio" class="jb-radio-4" value="bot">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="jb-radio" class="jb-radio-5" value="sup">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png" alt="" />
							</label>
							&nbsp;
						</div>

						<!-- <input type="checkbox" class="col-1" name="position" id="s" value="SUP" /> -->
					</div>
					<div class="radio-check" style="margin: 10px;">
						<label for="rc-agree">
							30일내에 변경불가합니다 동의하시면 체크해주세요.
							<input type="checkbox" id="rc-agree">
							<span class="checkbox"></span>
						</label>
					</div>
					<button type="submit" style="margin: 15px;">
						<span onclick="fn_close()">update</span>
					</button>
				</form>
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