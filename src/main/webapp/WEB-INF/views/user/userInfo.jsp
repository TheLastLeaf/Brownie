<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../layout/header.jsp" />

<style>
.profileBox {
	display: inline-block;
	width: 80px;
	height: 80px;
	border: 1px solid white;
	border-radius: 5px;
	color: white;
	margin: 4px 10px 4px 0;
	text-align: center;
	position: relative;
	background: #1C1C1C;
	border: 2px solid red;
}

.outBox {
	border: none;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.Hierarchy {
	margin: 7px 10px 15px;
	display: flex;
	align-items: flex-start;
	font-family: mapleBold;
}

.nameLv {
	display: flex;
	align-items: flex-end;
	margin-left: 12px;
}

h3 {
	color: white;
	font-family: mapleBold;
}

.userInfoBox {
	border: 1px solid white;
	border-radius: 15px 15px 3px 3px;
}

button {
	margin: 10px;
}

.sync {
	display: flex;
	justify-content: center;
	margin: 20px 0px 10px;
}

.noticeCount {
	margin: 10px;
}

.infoDetail {
	display: flex;
	justify-content: center;
	margin: 3px;
	margin-bottom: 8px;
}

hr {
	background: white;
	margin: 8px;
}

.reputation {
	border: 1px solid white;
	border-radius: 3px 3px 15px 15px;
	color: white;
}

button {
	height: 33px;
	font-size: 15px;
}

.review {
	margin: 8px 0px 12px;
	width: 100%;
	text-align: center;
}

.rev {
	width: 100%;
	border-radius: 5px;
	border: 1px dotted white;
	display: flex;
	justify-content: center;
	font-size: 19px;
	position: relative;
	display: inline-block;
}

.caption {
	width: 100%;
	height: 100%;
	text-align: center;
	background-color: #000;
	position: absolute; /*내부 요소의 고정 위치 설정(2)*/
	top: 0;
	left: 0;
	color: #fff;
	padding: 3px;
	box-sizing: border-box; /* 300x300 안에 padding이 적용되도록 함 */
	padding-top: 0px;
	opacity: 0; /* 투명도가 처음에는 0이었지만 어떤 이벤트가 발생하면 0.5초뒤에 발생함*/
	transition: 0.5s; /*caption에 이벤트가 발생하여 0.5초 딜레이 후 발생시킴*/
}

.rev:hover .caption {
	opacity: 0.9;
}

.playWith {
	margin: 8px 0px 3px;
}

.nickName {
	margin: 4px 0px 6px;
	text-align: center;
}

.nickBox {
	margin-bottom: 14px;
}

a {
	color: lightblue;
}

/* 마우스우클릭 깔끔버전 */
h1 {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	padding: 1em;
	font-size: 2em;
	letter-spacing: .3em;
	color: #FFFFFF;
	text-align: center;
	border-top: 2px solid #E6EE9C;
	border-bottom: 2px solid #E6EE9C;
}

.contextmenu {
	display: none;
	position: absolute;
	width: 110px; margin : 0;
	padding: 0;
	background: #BDBDBD;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
	overflow: hidden;
	z-index: 999999;
	margin: 0;
}

.contextmenu li {
	border-left: 3px solid transparent;
	transition: ease .2s;
}

.contextmenu li a {
	display: block;
	padding: 10px;
	color: #DF013A;
	text-decoration: none;
	transition: ease .2s;
}

.contextmenu li:hover {
	background: #E6E6E6;
	border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
	color: #0000FF;
}
</style>

<script>
	function fn_sync() {
		window.open("user/userSync", "userSync",
				"width=800, height=680, left=250,top=200");
	};
	function fn_infoMod() {
		window.open("user/userModify", "userModify",
				"width=800, height=680, left=250,top=200");
	};
	function fn_review() {
		window.open("user/userComment", "userComment",
				"width=800, height=680, left=250,top=200");
	};
	function fn_declaration(){
		window.open("user/userDeclar", "userDeclar",
		"width=800, height=680, left=250,top=200");
	}
	// 마우스 우클릭 깔끔한버전 TEXTCONTENT 
	$(document)
			.ready(
					function() {
						//Show contextmenu:
						$(".review")
								.contextmenu(
										function(e) {
											//Get window size:
											var winWidth = $(document).width();
											var winHeight = $(document)
													.height();
											//Get pointer position:
											var posX = e.pageX;
											var posY = e.pageY;
											//Get contextmenu size:
											var menuWidth = $(".contextmenu")
													.width();
											var menuHeight = $(".contextmenu")
													.height();
											//Security margin:
											var secMargin = 10;
											//Prevent page overflow:
											if (posX + menuWidth + secMargin >= winWidth
													&& posY + menuHeight
															+ secMargin >= winHeight) {
												//Case 1: right-bottom overflow:
												posLeft = posX - menuWidth
														- secMargin + "px";
												posTop = posY - menuHeight
														- secMargin + "px";
											} else if (posX + menuWidth
													+ secMargin >= winWidth) {
												//Case 2: right overflow:
												posLeft = posX - menuWidth
														- secMargin + "px";
												posTop = posY + secMargin
														+ "px";
											} else if (posY + menuHeight
													+ secMargin >= winHeight) {
												//Case 3: bottom overflow:
												posLeft = posX + secMargin
														+ "px";
												posTop = posY - menuHeight
														- secMargin + "px";
											} else {
												//Case 4: default values:
												posLeft = posX + secMargin
														+ "px";
												posTop = posY + secMargin
														+ "px";
											}
											;
											//Display contextmenu:
											$(".contextmenu").css({
												"left" : posLeft,
												"top" : posTop
											}).show();
											//Prevent browser default contextmenu.
											return false;
										});
						//Hide contextmenu:
						$(document).click(function() {
							$(".contextmenu").hide();
						});
					});
</script>

<!-- Main Content Post Section Begin -->
<section class="details-post-section spad" style="padding: 0;">
	<!-- class="container"는 글을 가운데 정렬해주는 역할 -->
	<div class="container" style="width: 900px;">

		<div class="p-0">
			<div class="details-text typography-page" style="width: 1050px; margin-left: -90px;">
				<div class="dt-breadcrumb" style="margin-bottom: 10px;">
					<div class="dt-bread-option" style="margin-bottom: 10px;">
						<a href="#">userInfo</a>
						<span>userDetail</span>
					</div>
				</div>
				<br />
				<div class="dt-desc" style="display: block;">
					<div class="row outBox" style="margin-left: 5px;">
						<!-- 프로필사진 -->
						<div class="profileBox text-center justify-content-center align-items-center d-flex">
							<img class="profile" id="profile" src="${pageContext.request.contextPath}/img/user/sana1.gif">
						</div>
						<div class="col-5" style="color: white;">
							<div class="Hierarchy">
								<i>일반회원</i>
							</div>
							<div class="nameLv">
								<h3>
									리학재 | Lv.71 | <span class="rating-star"> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star-half-o"></i> <i class="fa fa-star-o"></i>
									</span>
								</h3>
							</div>
						</div>
						<div class="modInfo col-5" style="display: flex; justify-content: flex-end;">
							<button type="button" class="btn btn-dark" onclick="fn_infoMod()">정보수정</button>
						</div>
					</div>
				</div>

				<!-- 연동/게시글/같이플레이한놈 begin -->
				<div class="row" style="color: white;">
					<!-- 뭉태기1 -->
					<div class="userInfoBox col-sm-4">
						<div class="sync">
							<button type="button" class="btn btn-danger" onclick="fn_sync()">연동</button>
						</div>
						<div class="sync">
							<!-- 연동이 되었다는 가정하에 만들어짐 default 는 ??? | ??? | ??? -->
							ririnto | Lv:80 | Bronze !!
						</div>
						<div class="sync">[메인포지션] : 탑!</div>
					</div>

					<!-- 뭉태기2 -->
					<div class="userInfoBox col-sm-4">
						<div>
							<div class="infoDetail">게시글 갯수: 20</div>
							<div class="infoDetail">댓글 갯수: 400</div>
							<div class="infoDetail">좋아요: 395</div>
							<div class="infoDetail">싫어요: 312</div>
						</div>
						<hr />
						<div class="infoDetail">최근 게시글 내역</div>
						<div>1. 무지성에 관한 고찰</div>
						<div>2. 팀원의 성향에 대한 고찰</div>
						<div>3. 진짜 프로젝트를 2주면 완성이 될까?</div>
					</div>

					<!-- 뭉태기3 -->
					<div class="userInfoBox col-sm-4">
						<div class="col playWith">최근 채팅한 플레이어</div>
						<div class="col">
							<div class="nickBox">
								<b>[이동해서 댓글·별점주세요!]</b>
							</div>
							<div class="nickName">
								<a class="col" href="#">[궁각예술]</a>
							</div>
							<div class="nickName">
								<a class="col" href="#">[안뇽하세욤]</a>
							</div>
							<div class="nickName">
								<a class="col" href="#">[regolas]</a>
							</div>
							<div class="nickName">
								<a class="col" href="#">[스프링밥]</a>
							</div>
							<div class="nickName">
								<a class="col" href="#">[Faked]</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 연동/게시글/같이플레이한놈 end -->
				<br />

				<div class="reputation row">
					<div class="col-sm-10" style="display: flex; justify-content: flex-start; align-items: center;">후기를 써서 테러하세요!</div>
					<div class="col-sm-2" style="display: flex; justify-content: flex-end;">
						<button type="button" class="btn btn-info" onclick="fn_review()">후기작성</button>
					</div>
					<!-- 다른사람이 쓴 후기 -->
					<div class="review col-4">
						<div class="rev">
							이 사람 아리만 해요,,미쳐진짜!
							<!-- 상세내용담는공간 -->
							<div class="caption">☆☆★★★</div>
						</div>
					</div>

					<div class="review col-4">
						<div class="rev">
							기가막히게 코딩을 잘한답니다..!
							<!-- 상세내용담는공간 -->
							<div class="caption">☆☆★★★</div>
						</div>
					</div>

					<div class="review col-4">
						<div class="rev">
							오늘 골드를 찍었대요 백준 골드요!
							<!-- 상세내용담는공간 -->
							<div class="caption">★★★★★</div>
						</div>
					</div>

					<div class="review col-4">
						<div class="rev">
							아리 왜하는지 모르겠어요
							<!-- 상세내용담는공간 -->
							<div class="caption">☆☆☆☆★</div>
						</div>
					</div>

					<div class="review col-4">
						<div class="rev">
							[비속어처리X]
							<!-- 상세내용담는공간 -->
							<div class="caption">☆☆☆☆☆</div>
						</div>
					</div>

					<div class="review col-4">
						<div class="rev">
							너...내 여자해라..
							<!-- 상세내용담는공간 -->
							<div class="caption">☆☆☆☆★</div>
						</div>
					</div>
				</div>

				<!-- <div id="reviewBox" style="color: white;"></div> -->
				<!-- 마우스 우클릭 (숨김처리됨li태그들) -->
				<ul class="contextmenu">
					<li><a onclick="fn_declaration()">신고하기</a></li>
					<!-- 다른유저페이지로 이동->> -->
					<li><a href="#">둘러보기</a></li>
				</ul>

				<!-- share box begin  -->
				<div style="border: 1px solid black; display: block;" class="dt-share"></div>
				<!-- share box end -->

			</div>
		</div>
	</div>
</section>
<!-- Details Post Section End -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${pageContext.request.contextPath}" />
</c:import>