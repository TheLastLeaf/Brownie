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
							<i class="fas fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="4-stars" name="rating" value="4" />
						<label for="4-stars" class="star">
							<i class="fas fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="3-stars" name="rating" value="3" />
						<label for="3-stars" class="star">
							<i class="fas fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="2-stars" name="rating" value="2" />
						<label for="2-stars" class="star">
							<i class="fas fa-star"></i>
						</label>
						&nbsp;
						<input type="radio" id="1-star" name="rating" value="1" />
						<label for="1-star" class="star">
							<i class="fas fa-star"></i>
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