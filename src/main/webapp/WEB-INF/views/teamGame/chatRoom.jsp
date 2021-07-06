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

.siteLv {
	width: 30px;
	height: 30px;
}

img {
	width: 40px;
	height: 40px;
	margin: 4px;
}

button[type="button"] {
	margin: 2px;
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
					박세웅: 오호오호!
					<br />
					박세웅: 채팅은 조금 많이 어려울거 같습니다.
					<br />
					박세웅: 소켓에 대한 이해가 많이 필요한 기능같습니다.
					<br />
					<br />
					박세웅: 다음주 주간목표가 난이도로 따지면 최고일 수도...아님말고..
					<br />
					박세웅: 다음주도 열심히 달려봅시다..
					<br />
					<br />
					박세웅: 이모티콘 관련해서는 api가 따로 없네요...
					<br />
					박세웅: 아쉽지만 아쉬운대로 파일첨부로 대신해야할거 같습니다만?...

				</div>
				<div class="enterBox row">
					<div>
						&nbsp;&nbsp;&nbsp; 채팅: &nbsp;
						<input type="text" />
					</div>
					<div class="filebox">
						<label for="file">임티</label>
						<input type="file" id="file" />
					</div>
					<div>
						<button type="button" class="btn btn-success">전송</button>
					</div>
				</div>
			</div>

			<div class="userBox col-sm-3">
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
					<img class="siteLv" src="${pageContext.request.contextPath}/img/teamGame/adminIcon.png" />
					<div class="userInfo">사용자1</div>
				</div>
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
					<img class="siteLv" src="${pageContext.request.contextPath}/img/teamGame/adminIcon.png" />
					<div class="userInfo">사용자2</div>
				</div>
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
					<img class="siteLv" src="${pageContext.request.contextPath}/img/teamGame/adminIcon.png" />
					<div class="userInfo">사용자3</div>
				</div>
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
					<img class="siteLv" src="${pageContext.request.contextPath}/img/teamGame/adminIcon.png" />
					<div class="userInfo">사용자4</div>
				</div>
				<div class="user">
					<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
					<img class="siteLv" src="${pageContext.request.contextPath}/img/teamGame/adminIcon.png" />
					<div class="userInfo">사용자5</div>
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