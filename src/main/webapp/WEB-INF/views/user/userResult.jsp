<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Amin Template">
<meta name="keywords" content="Amin, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!--     Bootstrap CSS -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css?after"> --%>
<title>BROWNIE.GG에 오신걸 환영합니다.</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://raw.githubusercontent.com/9bitStudios/barfiller/master/css/style.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css" integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css" integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>

<style>
/* 바디 백그라운드 */
body {
	background: black;
}
.content {
	background-color: black;
	color: white;
	width: 50%;
	border-radius: 10px;
}

input[type="text"] {
	margin-right: 10px;
	border: 1px solid white;
	text-align: center;
	width: 250px;
}
.bg-dark {
	color: white;
	position: absolute;
	left: 0;
	bottom: 0;
}
</style>

<script type="text/javascript">
	
</script>
<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="container">
		<nav class="navbar sticky-top navbar-dark" style="background: indianred;">
			<a class="navbar-brand" href="#">BROWNIE.GG</a>
			<form action="/search" method="GET">
				<div class="nav-embed-submit-field">
					<input type="text" placeholder="당신의 아이디를 검색하세요!" name="title" class="content">
					<button type="submit" class="btn btn-outline-light btn-sm">검색!</button>
				</div>
			</form>
		</nav>
		<div class="container p-5 shadow-lg p-3 mb-5 rounded" style="background-color: #F2F2F2;">
			<div class="row h-100 justify-content-center align-items-center">
				<div class="col-sm-4">
					<img alt="아이콘" src=${profileImgURL} class="rounded-llg mx-auto d-block" style="max-width: 70%;">
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-7" id="idLevel">
					<h3>${summoner.name}</h3>
					<p>Lv. ${summoner.summonerLevel}</p>
				</div>
			</div>
			<div class="col-12" style="height: 100px"></div>
			<c:forEach var="leagueInfo" items="${leagueInfo}" varStatus="s">
				<div class="row h-100 justify-content-center align-items-center">
					<div class="col-md-5">
						<img alt="랭크 엠블램" src=<c:out value="img/emblems/Emblem_${leagueInfo.tier}.png" /> class="mx-auto d-block" style="max-width: 75%;">
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-6" style="text-align: center;">
						<c:choose>
							<c:when test="${leagueInfo.queueType == 'RANKED_FLEX_SR'}">
								<h2>자유 랭크</h2>
							</c:when>
							<c:when test="${leagueInfo.queueType ==  'RANKED_TFT'}">
								<h2>전략적 팀전투</h2>
							</c:when>
							<c:when test="${leagueInfo.queueType == 'RANKED_SOLO_5x5'}">
								<h2>솔로 랭크</h2>
							</c:when>
						</c:choose>
						<h3>승리/패배</h3>
						<p style="color: #007bff; font-size: 24px; display: inline">${leagueInfo.wins}</p>
						<p style="font-size: 24px; display: inline">/</p>
						<p style="color: #dc3545; font-size: 24px; display: inline">${leagueInfo.losses}</p>
						<fmt:formatNumber var="percent" value="${leagueInfo.wins/(leagueInfo.wins+leagueInfo.losses)}" pattern="0.00%" />
						<span style="color: #6c757d; font-size: 18px;"> (${percent}) </span>
						<h3>당신의 티어는?</h3>
						<p>당신의 리그는 ${leagueName[s.index]}, ${leagueInfo.tier} ${leagueInfo.rank} 단계 입니다.</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark" style="color: white; position: absolute; bottom: 0; width: 100%;">
		<div class="container">
			<div class="row">
				<!-- Copyright -->
				<div class="col-sm-12" style="text-align: center; padding: 10px;">
					© 2021 Copyright:
					<a href="/noxikaGG"> BROWNIE.GG</a>
				</div>
			</div>
		</div>
	</footer>



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