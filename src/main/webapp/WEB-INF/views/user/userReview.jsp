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
<title>Review</title>

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

.signup-text {
	padding: 60px 0px 100px;
}

.row {
	color: white;
	display: flex;
	justify-content: center;
}

hr {
	border: 1px solid white;
	margin: 0px 0px 5px;
	width: 100%;
}

.reviewDate {
	display: flex;
	justify-content: flex-end;
}
</style>


<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="signup-text">
		<div class="container">
			<form action="" class="signup-form">
				<div class="signup-title" style="margin: 10px;">
					<div class="row">
						<h3 class="title" style="color: white;">후기작성</h3>
					</div>
				</div>

				<hr />
				<div class="reviewDate row">작성일: 2020/07/30</div>
				<div class="reviewContent row">
					내용 : &nbsp;&nbsp;&nbsp;<input type="text" />
				</div>

				<div class="comment">
					<input type="text" placeholder="기타 사유를 적어주세요!">
				</div>

				<div class="reviewContent row">
					별 hover 효과<i class="fa fa-star"></i>
				</div>

				<div>
					<button type="submit">
						<span>신고하기</span>
					</button>
				</div>
			</form>
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