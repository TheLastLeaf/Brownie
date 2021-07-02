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
body {
	background: black;
}

.signup-text {
	padding: 60px 0px 100px;
	overflow: hidden;
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

.reviewUser {
	display: flex;
	justify-content: center;
}

.reviewDate {
	display: flex;
	justify-content: center;
}

.reviewContent {
	margin: 10px 0px 15px;
}

.fa fa-star {
	width: 30px;
}
/* 별 */
.star-rating {
	display: flex;
	flex-direction: row-reverse;
	font-size: 2.25rem;
	line-height: 2.5rem;
	justify-content: space-around;
	padding: 0 0.2em;
	text-align: center;
	width: 5em;
}

.star-rating input {
	display: none;
}

/* 별 테두리 옵션 */
.star-rating label {
	-webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
	-webkit-text-stroke-width: 1.3px;
	-webkit-text-stroke-color: red;
	cursor: pointer;
}

/* 클릭후 채워진 색깔 */
.star-rating :checked ~ label {
	-webkit-text-fill-color: red;
}

/* 마우스 호버색깔 */
.star-rating label:hover, .star-rating label:hover ~ label {
	-webkit-text-fill-color: red;
}

.star-ratings-base {
	z-index: 0;
	padding: 0;
}
/* 별배경 */
</style>

<script>
	function ratingToPercent() {
		const score = +this.restaurant.averageScore * 20;
		return score + 1.5;
	}
</script>

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

				<!-- 					<hr /> -->
				<div class="reviewUserInfo row">
					<div class="reviewUser col-6">작성자: ???</div>
					<div class="reviewDate col-6">작성일: 2020/07/30</div>
				</div>
				<br />
				<div class="reviewContent row">
					<!-- 별 hover 효과 -->
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5" />
						<label for="5-stars" class="star pr-4">
							<i class="fa fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="4-stars" name="rating" value="4" />
						<label for="4-stars" class="star">
							<i class="fa fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="3-stars" name="rating" value="3" />
						<label for="3-stars" class="star">
							<i class="fa fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="2-stars" name="rating" value="2" />
						<label for="2-stars" class="star">
							<i class="fa fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="1-star" name="rating" value="1" />
						<label for="1-star" class="star">
							<i class="fa fa-star"></i>
						</label>
					</div>

					<!-- 별 hover 효과 -->
				</div>
				<div class="comment sf-input-list">
					<input type="text" placeholder="수정이 안되오니 신중하게 작성해주세요!">
				</div>

				<div>
					<button type="submit">
						<span>후기작성</span>
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