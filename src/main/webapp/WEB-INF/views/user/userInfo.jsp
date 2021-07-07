<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../layout/header.jsp" />
<style>
.profileBox {
	display: inline-block;
	width: 120px;
	height: 120px;
	border-radius: 5px;
	color: white;
	margin: 4px 10px 4px 10px;
	text-align: center;
	position: relative;
	background: #0d0d0d;
	background-size: cover;
}

.outBox {
	border: none;
}

.profilePic {
	position: relative;
	margin: 0px 0PX 0PX 1px;
}

.profilePic img {
	border-radius: 80%;
	width: 87px;
	height: 87px;
}

.profileFrame {
	width: 100%;
	height: 100%;
	object-fit: 120px;
	position: absolute;
	width: 150px;
	height: 150px;
	text-align: center;
}

.profileFrameLv {
	position: absolute;
	color: white;
	bottom: 20px;
	left: 61px;
	font-size: 13px;
	width: 30px;
}

.Hierarchy {
	margin: 7px 10px 15px;
	display: flex;
	align-items: flex-start;
	font-family: MapleBold;
}

.nameLv {
	display: flex;
	align-items: flex-end;
	margin: 25px 0px 0px 14px;;
}

h3 {
	color: white;
	font-family: MapleBold;
}

.userInfoBox {
	border: 1px solid white;
	border-radius: 15px 15px 3px 3px;
	text-align: center;
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

.upload {
	margin: 1px 0px 4px;
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
	border: 1px solid gray;
	display: flex;
	justify-content: center;
	font-size: 16px;
	position: relative;
	display: inline-block;
	font-family: MapleBold;
	font-weight: bolder;
	color: #BDBDBD;
}

.reviewDay {
	font-size: 13px;
	color: white;
	display: flex;
	justify-content: flex-end;
	color: #A4A4A4;
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

h6 {
	color: white;
	font-size: 13px;
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
	width: 110px;
	margin: 0;
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
	cursor: pointer;
}

.contextmenu li:hover {
	background: #E6E6E6;
	border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
	color: #0000FF;
}

.paging {
	display: flex;
	justify-content: center;
	margin: 0px 0px 8px;
}

.modInfo {
	display: flex;
	justify-content: flex-end;
	margin-left: 20px;
}
</style>
<script>
	function fn_sync() {
		window.open("/user/userSync", "userSync",
				"width=800, height=680, left=250,top=200");
	}

	function fn_infoMod() {
		window.open("/user/userModify", "userModify",
				"width=800, height=680, left=250,top=200");
	}

	function fn_review() {
		window.open("/user/userReview", "userReview",
				"width=870, height=500, left=400,top=200");
	}

	function fn_declaration() {
		window.open("/user/userDeclar", "userDeclar",
				"width=980, height=500, left=400,top=200");
	}

	function fn_infoDel() {
		confirm("탈퇴하시겠습니까?")
	}

	// 마우스 우클릭 TEXTCONTENT
	$(function() {
		$(".review").contextmenu(
				function(e) {
					const winWidth = $(document).width();
					const winHeight = $(document).height();
					const posX = e.pageX;
					const posY = e.pageY;
					const contextmenu = $(".contextmenu");
					const menuWidth = contextmenu.width();
					const menuHeight = contextmenu.height();
					const secMargin = 10;
					let posLeft;
					let posTop;
					if (posX + menuWidth + secMargin >= winWidth
							&& posY + menuHeight + secMargin >= winHeight) {
						posLeft = posX - menuWidth - secMargin + "px";
						posTop = posY - menuHeight - secMargin + "px";
					} else if (posX + menuWidth + secMargin >= winWidth) {
						posLeft = posX - menuWidth - secMargin + "px";
						posTop = posY + secMargin + "px";
					} else if (posY + menuHeight + secMargin >= winHeight) {
						posLeft = posX + secMargin + "px";
						posTop = posY - menuHeight - secMargin + "px";
					} else {
						posLeft = posX + secMargin + "px";
						posTop = posY + secMargin + "px";
					}

					contextmenu.css({
						"left" : posLeft,
						"top" : posTop
					}).show();
					return false;
				});
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
				<c:choose>
					<c:when test="${sessionScope.id ne null}">
						<!-- 로그인상태에서 정보화면 -->
						<c:set var="nick" value="${userOneSelect.nickName}" />
						<div class="dt-desc" style="display: block;">
							<div class="row outBox" style="margin-left: 5px;">
								<div class="profileBox text-center justify-content-center align-items-center d-flex" style="position: relative;">
									<!-- 프로필사진 -->
									<div class="profilePic">
										<img src="${pageContext.request.contextPath}/img/user/JombieMushimroom.jpg">
									</div>
									<!-- 프로필 프레임 -->
									<div class="profileFrame">
										<img src="${pageContext.request.contextPath}/img/frame/red.png">
										<div class="profileFrameLv">gd</div>
									</div>
								</div>
								<div class="col-7" style="color: white;">
									<div class="Hierarchy">
										<i>일반회원</i>
									</div>
									<div class="nameLv">
										<h3>
											<c:out value="${nick}" />
											| Lv.
											<c:choose>
												<c:when test="${exp > 30}">
														3
													</c:when>
												<c:when test="${exp > 20}">
														2
													</c:when>
												<c:when test="${exp > 10}">
														1
													</c:when>
												<c:otherwise>
														0
												</c:otherwise>
											</c:choose>
											| <span class="rating-star"> <c:forEach begin="1" end="${fullStar}">
													<i class="fas fa-star"></i>
												</c:forEach> <c:forEach begin="0" end="${halfStar}">
													<i class="fas fa-star-half-alt"></i>
												</c:forEach> <c:forEach begin="1" end="${5-fullStar-halfStar}">
													<i class="far fa-star"></i>
												</c:forEach>
											</span>
										</h3>
									</div>
								</div>
								<div class="modInfo col-3">
									<button type="button" class="btn btn-dark" onclick="fn_infoMod()">정보수정</button>
									<button type="button" class="btn btn-dark" onclick="fn_infoDel()">탈퇴</button>
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
									${userOneSelect.lolId} | 롤Lv. | 롤Tier
								</div>
								<div class="sync">
									<%-- <c:set var="position" value="${userOneSelect.userPosition}"/> --%>
									[메인포지션] : ${position}
								</div>
							</div>
							<!-- 뭉태기2 -->
							<div class="userInfoBox col-sm-4">
								<div>
									<div class="infoDetail">게시글 갯수: ${boardTotalCnt}</div>
									<div class="infoDetail">댓글 갯수: ${replyTotalCnt}</div>
									<div class="infoDetail">좋아요: ${likeReplyCnt}</div>
									<div class="infoDetail">싫어요: ${hateReplyCnt}</div>
								</div>
								<hr />
								<div class="infoDetail">【 최근 게시글 내역 】</div>
								<c:forEach var="recentBoard" items="${recentBoard}" varStatus="vs">
									<div class="upload">
										${vs.index+1}. <a href="">${recentBoard}</a>
									</div>
								</c:forEach>
							</div>
							<!-- 뭉태기3 -->
							<div class="userInfoBox col-sm-4">
								<div class="col playWith">최근 채팅한 플레이어</div>
								<div class="col">
									<div class="nickBox">
										<b>[이동해서 댓글·별점주세요!]</b>
									</div>
									<div class="nickName">
										<a class="col" href="#">[???]</a>
									</div>
									<div class="nickName">
										<a class="col" href="#">[???]</a>
									</div>
									<div class="nickName">
										<a class="col" href="#">[???]</a>
									</div>
									<div class="nickName">
										<a class="col" href="#">[???]</a>
									</div>
									<div class="nickName">
										<a class="col" href="#">[???]</a>
									</div>
								</div>
							</div>
						</div>
						<!-- 연동/게시글/같이플레이한놈 end -->
						<br />
						<div class="reputation row">
							<div class="col-sm-10" style="display: flex; justify-content: flex-start; align-items: center;">
								후기를 써서 테러하세요!
								<h6>&nbsp;[우클릭하여 신고]</h6>
							</div>
							<div class="col-sm-2" style="display: flex; justify-content: flex-end;">
								<button type="button" class="btn btn-info" onclick="fn_review()">후기작성</button>
							</div>
							<!-- 다른사람이 쓴 후기 -->
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;??/??/??</div>
								<div class="rev">
									???
									<!-- 상세내용담는공간 -->
									<div class="caption">☆☆☆☆☆</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									기가막히게 코딩을 잘한답니다..!
									<!-- 상세내용담는공간 -->
									<div class="caption">★★★☆☆</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									오늘 골드를 찍었대요 백준 골드요!
									<!-- 상세내용담는공간 -->
									<div class="caption">★★★★★</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									아리 왜하는지 모르겠어요
									<!-- 상세내용담는공간 -->
									<div class="caption">★☆☆☆☆</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									[비속어처리X]
									<!-- 상세내용담는공간 -->
									<div class="caption">☆☆☆☆☆</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									너...내 여자해라..
									<!-- 상세내용담는공간 -->
									<div class="caption">★☆☆☆☆</div>
								</div>
							</div>
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;21/07/01</div>
								<div class="rev">
									내일은 어떤 기능을 할까요!?!?
									<!-- 상세내용담는공간 -->
									<div class="caption">★★★☆☆</div>
								</div>
							</div>
							<!-- 페이징처리 -->
							<!-- 페이징처리 -->
							<div class="paging col-12">
								<a href="#">[prev]</a>
								<a href="#">[1]</a>
								<a href="#">[2]</a>
								<a href="#">[3]</a>
								<a href="#">[next]</a>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<!-- 비로그인or 로그인처음 상태에서 user화면 -->
						<div class="dt-desc" style="display: block;">
							<div class="row outBox" style="margin-left: 5px;">
								<div class="profileBox text-center justify-content-center align-items-center d-flex" style="position: relative;">
									<!-- 프로필사진 -->
									<div class="profilePic">
										<img src="${pageContext.request.contextPath}/img/user/whiteSpace.png">
									</div>
									<!-- 프로필 프레임(테두리) -->
									<div class="profileFrame">
										<img src="${pageContext.request.contextPath}/img/frame/final.png">
										<div class="profileFrameLv">12</div>
									</div>
								</div>
								<div class="col-7" style="color: white;">
									<div class="Hierarchy">
										<i>회원등급</i>
									</div>
									<div class="nameLv">
										<h3>
											??? | Lv. ??? | <span class="rating-star"> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											</span>
										</h3>
									</div>
								</div>
								<div class="modInfo col-3">
									<button type="button" class="btn btn-dark" onclick="fn_infoMod()">정보수정</button>
									<button type="button" class="btn btn-dark" onclick="fn_infoDel()">탈퇴</button>
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
									??? | ??? | ???
								</div>
								<div class="sync">[메인포지션] : ???</div>
							</div>
							<!-- 뭉태기2 -->
							<div class="userInfoBox col-sm-4">
								<div>
									<div class="infoDetail">게시글 갯수: ???</div>
									<div class="infoDetail">댓글 갯수: ???</div>
									<div class="infoDetail">좋아요: ???</div>
									<div class="infoDetail">싫어요: ???</div>
								</div>
								<hr />
								<div class="infoDetail">최근 게시글 내역</div>
								<div class="upload">???</div>
								<div class="upload">???</div>
								<div class="upload">???</div>
							</div>
							<!-- 뭉태기3 -->
							<div class="userInfoBox col-sm-4">
								<div class="col playWith">최근 채팅한 플레이어</div>
								<div class="col">
									<div class="nickBox">
										<b>[이동해서 댓글·별점주세요!]</b>
									</div>
									<c:forEach begin="0" end="4">
										<div class="nickName">
											<a class="col" href="#">[???]</a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<!-- 연동/게시글/같이플레이한놈 end -->
						<br />
						<div class="reputation row">
							<div class="col-sm-10" style="display: flex; justify-content: flex-start; align-items: center;">
								후기를 써서 테러하세요!
								<h6>&nbsp;[우클릭하여 신고]</h6>
							</div>
							<div class="col-sm-2" style="display: flex; justify-content: flex-end;">
								<button type="button" class="btn btn-info" onclick="fn_review()">후기작성</button>
							</div>
							<!-- 다른사람이 쓴 후기 -->
							<div class="review col-4">
								<div class="reviewDay">작성자&nbsp;??/??/??</div>
								<div class="rev">
									비로그인 상태
									<!-- 상세내용담는공간 -->
									<div class="caption">☆☆☆☆☆</div>
								</div>
							</div>

							<!-- 페이징처리 -->
							<div class="paging col-12">
								<a href="#">[1]</a>
							</div>
						</div>

					</c:otherwise>
				</c:choose>

				<!-- 마우스 우클릭 (숨김처리됨li태그들) -->
				<ul class="contextmenu">
					<li><a onclick="fn_declaration()">신고하기</a></li>
					<!-- 다른유저페이지로 이동->> -->
					<li><a href="#">둘러보기</a></li>
				</ul>
				<!-- 그냥 밑에서 한칸 띄워 놓고 싶어서 만듬 share box begin  -->
				<div style="border: none; display: block;" class="dt-share"></div>
				<!-- share box end -->
			</div>
		</div>
	</div>
</section>
<!-- Details Post Section End -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.9.2/jquery.contextMenu.min.css" integrity="sha512-SWjZLElR5l3FxoO9Bt9Dy3plCWlBi1Mc9/OlojDPwryZxO0ydpZgvXMLhV6jdEyULGNWjKgZWiX/AMzIvZ4JuA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.9.2/jquery.contextMenu.min.js" integrity="sha512-kvg/Lknti7OoAw0GqMBP8B+7cGHvp4M9O9V6nAYG91FZVDMW3Xkkq5qrdMhrXiawahqU7IZ5CNsY/wWy1PpGTQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.9.2/jquery.ui.position.js" integrity="sha512-vBR2rismjmjzdH54bB2Gx+xSe/17U0iHpJ1gkyucuqlTeq+Q8zwL8aJDIfhQtnWMVbEKMzF00pmFjc9IPjzR7w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${pageContext.request.contextPath}" />
</c:import>