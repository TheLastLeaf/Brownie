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

<!-- favicon -->
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
body {
	background: black;
}

.signup-section {
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

.input-value {
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

.signup-text {
	padding-top: 40px;
}
</style>
<script>
	function fn_changeProfile(){
		$("input[type=file]").change(function(){
			var formData = new formData($("frm")[0]);
			alert("성공");
		})
	}




	function fn_submit() {
		//파일처리 시작 ----------
		var formData = new FormData();
		var inputFile = $("input[name='file']");
		var files = inputFile[0].files;
// 		console.log(files[0]);
		formData.append("uploadFile",files[0]);
		//파일처리 끝 -----------
		var nickNameBox = $("input[name=nickNameBox]").val();
		var positions = []
		$('input[name="positions"]:checked').each(function() {
			positions.push($(this).val())
		});		

// 		var param = "";
// 		param += "dummy=" + Math.random()
		formData.append("nickNameBox",nickNameBox);
		formData.append("positions",positions);
		
		$.ajax({
			url : "/user/userInfo",
			type : "POST",
			data : formData,
			processData:false,
			contentType:false,
			success : function(profilePath) {
					alert("성공: "+profilePath);
					console.log(profilePath);
					console.log(files);
					$("#file").attr("style", "background-image: url(" + profilePath + ");");
					//window.close();
					//window.reload();
			},
			error : function(e) {
				alert("실패ㅜㅜ err");
				console.log(e);
			},
		});
	}

	function fn_loginPlz() {
		alert("로그인이 필요합니다!")

	}
</script>

<body>
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<div class="signup-section" style="display: block;">
		<!-- 		<div class="signup-close"> -->
		<!-- 			<i class=fas fa-times" onclick="fn_close()"></i> -->
		<!-- 		</div> -->
		<div class="signup-text">
			<div class="container">
				<div class="signup-title" style="margin-bottom: 20px;">
					<h2 class="font-family-maple-bold text-white">정보수정</h2>
					<p class="advice">사진을 눌러서 프로필을 바꿔보세요!</p>
				</div>


				<!-- form태그 begin -->
				<form action="/user/userInfo" name="frm" class="signup-form" id="form" method="POST" enctype="multipart/form-data">
					<div class="sf-input-list ">
						<!-- 					text-center justify-content-center align-items-center d-flex -->
						<div class="profileBox" style="border: none;">
							<label for="file">
								<img class="profile" src="">
								<input type="file" id="file" name="file" multiple />
							</label>
						</div>
						<input type="text" class="input-value" name="nickNameBox" placeholder="닉네임 변경 후 31일 동안 변경불가합니다*">

						<!-- 포지션선택 -->
						<div style="margin-bottom: 3px; margin-top: 3px;" class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-danger position">
								<input type="checkbox" name="positions" value="top">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="positions" value="jun">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="positions" value="mid">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="positions" value="bot">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" alt="" />
							</label>
							&nbsp;
							<label class="btn btn-danger position">
								<input type="checkbox" name="positions" value="sup">
								<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png" alt="" />
							</label>
							&nbsp;
						</div>
					</div>
					<div class="radio-check" style="margin: 10px;">
						<label for="rc-agree">
							30일내에 변경불가합니다 동의하시면 체크해주세요.
							<input type="checkbox" id="rc-agree">
							<span class="checkbox"></span>
						</label>
					</div>
					<button type="button" style="margin: 15px;" onclick="fn_submit()">
						<span>update</span>
					</button>
				</form>
				<!-- form태그 end -->
			</div>
		</div>
	</div>

	<!-- <script>
	    $("#file").change(function(e)){
	        var form = $("form")[0];        
	        var formData = new FormData(form);
	        
	        alert(formData);
	
	        $.ajax({
	            cache : false,
	            url : "${pageContext.request.contextPath}/testForm2", // 요기에
	            processData: false,
	            contentType: false,
	            type : 'POST', 
	            data : formData, 
	            success : function(data) {
	                var jsonObj = JSON.parse(data);
	            }, // success 
	    
	            error : function(xhr, status) {
	                alert(xhr + " : " + status);
	            }
	        }); // $.ajax */    }
	</script> -->


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