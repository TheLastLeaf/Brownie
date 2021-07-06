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

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
			integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
		  rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

	<!-- Css Styles -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://raw.githubusercontent.com/9bitStudios/barfiller/master/css/style.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css" integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js" integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js" integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://raw.githubusercontent.com/9bitStudios/barfiller/master/js/jquery.barfiller.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.js" integrity="sha512-AmJ0T6lpw/ZQtCleMyfbraDy8AGQ9tWaB/PmRkXdKxH9Kvo0oTuW6+2hTEQ89mHkFIO/LpColEe3+QE+FJtgIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>