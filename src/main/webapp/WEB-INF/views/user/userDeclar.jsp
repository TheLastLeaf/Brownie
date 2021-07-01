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
<title>Declare</title>

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

.signup-section {
	overflow: hidden;
}

.custom-control {
	margin: 15px 0px 10px;
	display: flex;
	justify-content: center;
}
.signup-text {
	padding-top: 45px;
}
.nameInfo{
	display: flex;
	justify-content: center; 
}
.suspect{
	border: 0.5px solid white;
	color: white;
	margin-bottom: 10px;
	font-size: 15px;
	border-radius: 8px;
}
input[type="text"] {
	margin: 10px;
	border: 1px solid white;
	text-align: center;
}

button {
	margin-top: 5px;
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
				<div class="signup-title" style="margin: 10px;">
					<h3 class="title" style="color: white;">You Die</h3>
					<!-- 					<p class="title">신고창</p> -->
				</div>
				<div class="nameInfo row" >
					<div class="suspect col-3">용의자:&nbsp; 쓋빨롬</div>
<!-- 					<div class="suspect col-6">피해자:&nbsp; 유미</div> -->
				</div>
				<form action="#" class="signup-form">
					<div class="sf-input-list ">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox2" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox2" style="color: white;">혐오발언</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox3" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox3" style="color: white;">티어사칭</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox4" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox4" style="color: white;">욕설리풋</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" id="jb-checkbox1" class="custom-control-input">
							<label class="custom-control-label" for="jb-checkbox1" style="color: white;">맘에안듬</label>
						</div>
						<div class="comment">
							<input type="text" placeholder="기타 사유를 적어주세요!">
						</div>

						<!-- <input type="checkbox" class="col-1" name="position" id="s" value="SUP" /> -->
					</div>
					<button type="submit">
						<span>신고하기</span>
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