<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	margin: 0 0 0 1px;
}

.profilePic img {
	border-radius: 80%;
	width: 87px;
	height: 87px;
}

.profileFrame {
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
}

.nameLv {
	display: flex;
	align-items: flex-end;
	margin: 25px 0 0 14px;;
}

.userInfoBox {
	border: 1px solid white;
	border-radius: 15px 15px 3px 3px;
	text-align: center;
}

button {
	margin: 10px;
	height: 33px;
	font-size: 15px;
}

.sync {
	display: flex;
	justify-content: center;
	margin: 15px 0 10px;
}

.noticeCount {
	margin: 10px;
}

.infoDetail {
	display: flex;
	justify-content: center;
	margin: 3px 3px 8px;
}

hr {
	background: white;
	margin: 8px;
}

.upload {
	margin: 1px 0 4px;
}

.reputation {
	border: 1px solid white;
	border-radius: 3px 3px 15px 15px;
	color: white;
}

.review {
	margin: 8px 0 12px;
	width: 100%;
	text-align: center;
}

.rev {
	width: 100%;
	border-radius: 5px;
	border: 1px solid gray;
	justify-content: center;
	font-size: 16px;
	position: relative;
	display: inline-block;
	font-weight: bolder;
	color: #BDBDBD;
}

.reviewDay {
	font-size: 13px;
	display: flex;
	justify-content: flex-end;
	color: #A4A4A4;
}

.caption {
	width: 100%;
	height: 100%;
	text-align: center;
	background-color: #000;
	position: absolute; /*?????? ????????? ?????? ?????? ??????(2)*/
	top: 0;
	left: 0;
	color: #fff;
	box-sizing: border-box; /* 300x300 ?????? padding??? ??????????????? ??? */
	padding: 0px 3px 3px;
	opacity: 0; /* ???????????? ???????????? 0???????????? ?????? ???????????? ???????????? 0.5????????? ?????????*/
	transition: 0.5s; /*caption??? ???????????? ???????????? 0.5??? ????????? ??? ????????????*/
}

.rev:hover .caption {
	opacity: 0.9;
}

.playWith {
	margin: 8px 0 3px;
}

.nickName {
	margin: 4px 0 6px;
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

/* ?????????????????? ???????????? */
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
	background: #E6E6E6 !important;
	border-left: 3px solid #9C27B0 !important;
}

.contextmenu li:hover a {
	color: #0000FF !important;
}

.paging {
	display: flex;
	justify-content: center;
	margin: 8px 0 8px;
}

.modInfo {
	display: flex;
	justify-content: flex-end;
	margin-left: 20px;
}

.searchBox {
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.input-value {
	width: 30%;
	height: 26px;
	font-size: 14px;
	color: #c4c4c4;
	padding-left: 10px;
	-webkit-transform: skewX(-15deg);
	-ms-transform: skewX(-15deg);
	transform: skewX(-15deg);
	background: transparent;
	border: 1px solid #363636;
	-webkit-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}

.writeReview {
	display: flex;
	justify-content: flex-end;
	position: absolute;
	right: 20px;
	top: 5px;
}

.optionBox {
	color: black;
	background: lightgray;
}

#searchBtn {
	width: 60px;
}

.selectedPosition>img {
	width: 60px;
}

#tierPic2 {
	width: 70px;
}

.tierPic1 {
	width: 25%;
}
</style>

<!-- Main Content Post Section Begin -->
<section class="details-post-section spad" style="padding: 0;">
	<!-- class="container"??? ?????? ????????? ??????????????? ?????? -->
	<div class="container" style="width: 900px;">
		<div class="p-0">
			<div class="details-text typography-page" style="width: 1050px; margin-left: -90px;">
				<div class="dt-breadcrumb" style="margin-bottom: 10px;">
					<div class="dt-bread-option" style="margin-bottom: 10px;">
						<a href="#">userInfo</a> <span>userDetail</span>
					</div>
				</div>
				<br />
				<!-- ????????????????????? ???????????? -->
				<c:set var="nick" value="${userOneSelect.nickName}" />
				<div class="dt-desc" style="display: block;">
					<div class="row outBox" style="margin-left: 5px;">
						<div class="profileBox text-center justify-content-center align-items-center d-flex" style="position: relative;">
							<!-- ??????????????? + exp ?????? -->
							<div class="profilePic">
								<img src="${pageContext.request.contextPath}${userOneSelect.image}">
							</div>

							<!-- ????????? ????????? -->
							<div class="profileFrame">
								<c:choose>
									<c:when test="${userOneSelect.browniePoint > 400}">
										<img src="${pageContext.request.contextPath}/img/frame/final.png" title="MAX">
									</c:when>
									<c:when test="${userOneSelect.browniePoint > 300}">
										<img src="${pageContext.request.contextPath}/img/frame/purple.png" title="?????????: ${userOneSelect.browniePoint}/400">
									</c:when>
									<c:when test="${userOneSelect.browniePoint > 200}">
										<img src="${pageContext.request.contextPath}/img/frame/blue.png" title="?????????: ${userOneSelect.browniePoint}/300">
									</c:when>
									<c:when test="${userOneSelect.browniePoint > 100}">
										<img src="${pageContext.request.contextPath}/img/frame/red.png" title="?????????: ${userOneSelect.browniePoint}/200">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/img/frame/green.png" title="?????????: ${userOneSelect.browniePoint}/100">
									</c:otherwise>
								</c:choose>
								<div class="profileFrameLv">
									<fmt:parseNumber var="lvnum" integerOnly="true" value="${userOneSelect.browniePoint / 100}" /><c:out value="${lvnum}" />
								</div>
							</div>
						</div>
						<div class="col-7" style="color: white;">
							<div class="Hierarchy font-family-maple-bold">
								<i> <c:set var="permitLv" value="${permitLevel}" /> <c:choose>
										<c:when test="${permitLv != 9}">
                                            ????????????
                                        </c:when>
										<c:otherwise>
                                            ?????????
                                        </c:otherwise>
									</c:choose>
								</i>
							</div>
							<div class="nameLv">
								<h3 class="font-family-maple-bold text-white">
									<c:out value="${nick}" />
									&nbsp;|&nbsp; ${userOneSelect.browniePoint} .BP &nbsp;|&nbsp; <span class="rating-star"> <c:forEach begin="1" end="${fullStar}">
											<i class="fas fa-star"></i>
										</c:forEach> <c:forEach begin="1" end="${halfStar}">
											<i class="fas fa-star-half-alt"></i>
										</c:forEach> <c:forEach begin="1" end="${5-fullStar-halfStar}">
											<i class="far fa-star"></i>
										</c:forEach>
									</span>
								</h3>
							</div>
						</div>
						<c:if test="${userOneSelect.userId == sessionScope.id}">
							<div class="modInfo col-3">
								<button type="button" class="btn btn-dark" onclick="fn_infoMod('${userOneSelect.userId}')">????????????</button>
								<!-- 								<button type="button" class="btn btn-danger" onclick="fn_infoDel()">??????</button> -->
							</div>
						</c:if>
					</div>
				</div>
				<!-- ??????/?????????/????????????????????? begin -->
				<div class="row" style="color: white; position: relative;">
					<!-- ?????????1 -->
					<div class="userInfoBox col-sm-4">
						<c:set var="lolId" value="${userOneSelect.lolId}" />
						<div class="sync">
							<c:choose>
								<c:when test="${lolId.contains('_') and sessionScope.id eq userOneSelect.userId}">
									<button type="button" class="btn btn-danger" onclick="fn_sync()">??????</button>
								</c:when>
								<c:otherwise>
									<div id="tierPic1">
										<c:choose>
											<c:when test="${userOneSelect.lolTier eq 'TBD'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/details/LOL.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'IRON'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/iron.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'BRONZE'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/bronze.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'SILVER'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/silver.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'GOLD'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/gold.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'PLATINUM'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/platinum.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'DIAMOND'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/diamond.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'MASTER'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/master.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'GRANDMASTER'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/grandmaster.png" />
											</c:when>
											<c:when test="${userOneSelect.lolTier eq 'CHALLENGER'}">
												<img class="tierPic1" src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
											</c:when>
											<c:otherwise>
												<img src="${pageContext.request.contextPath}/img/details/LOL.png" />
											</c:otherwise>
										</c:choose>
									</div>
									<div id="tierPic2" style="display: none;">

										<c:if test="${userOneSelect.lolTier eq 'TBD'}">
											<img src="${pageContext.request.contextPath}/img/details/LOL.png" style="width: 78%;" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'IRON'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/iron.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'BRONZE'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/bronze.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'SILVER'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/silver.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'GOLD'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/gold.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'PLATINUM'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/platinum.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'DIAMOND'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/diamond.jpg" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'MASTER'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/master.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'GRANDMASTER'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/grandMaster.png" />
										</c:if>
										<c:if test="${userOneSelect.lolTier eq 'CHALLENGER'}">
											<img src="${pageContext.request.contextPath}/img/lol/lolTier/challenger.png" />
										</c:if>

									</div>

								</c:otherwise>
							</c:choose>

						</div>
						<div class="sync">
							<!-- ????????? ???????????? ???????????? ???????????? default ??? ??? | ??? | ??? -->
							${lolId}
							<!-- ???????????? -->
							<c:choose>
								<c:when test="${lolId.contains('_')}">
                                    | ??? Lv. | ??? tier
                                </c:when>
								<c:otherwise>
									<div style="position: absolute; top: 20px; left: 240px;">
										<button style="background: black; color: white; margin: 0px;" onclick="fn_SyncTierLv()" title="????????????">
											<i class="fas fa-sync-alt"></i>
										</button>
									</div>
									<c:if test="${sessionScope.id eq userOneSelect.userId}">
									<div style="position: absolute; top: 20px; left: 275px;">
										<button style="background: black; color: white; margin: 0px;" onclick="fn_SyncDel()" title="????????????">
											<i class="far fa-trash-alt"></i>
										</button>
									</div>
									</c:if>
									<div>
										| <span id="getLv">Lv. ${userOneSelect.lolLevel}</span> | <span id="getTier"> ${userOneSelect.lolTier} </span>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<hr>
						<div class="sync row">
							<div class="col-sm-12">?????????????????????</div>
							<div class="selectedPosition">
								<c:set var="position" value="${userOneSelect.userPosition}" />
								<c:if test="${position.contains('top')}">
									<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" />
								</c:if>
								<c:if test="${position.contains('jun')}">
									<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png" />
								</c:if>
								<c:if test="${position.contains('mid')}">
									<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" />
								</c:if>
								<c:if test="${position.contains('bot')}">
									<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" />
								</c:if>
								<c:if test="${position.contains('sup')}">
									<img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png" />
								</c:if>
								<c:if test="${position.contains('empty')}">
									<img src="${pageContext.request.contextPath}/img/details/QUESTION.gif" />
								</c:if>
							</div>
						</div>
					</div>
					<!-- ?????????2 -->
					<div class="userInfoBox col-sm-4" style="padding-top: 15px;">
						<div>
							<div class="infoDetail">????????? ??????: ${boardTotalCnt}</div>
							<div class="infoDetail">?????? ??????: ${replyTotalCnt}</div>
							<div class="infoDetail">?????????: ${likeReplyCnt}</div>
							<div class="infoDetail">?????????: ${hateReplyCnt}</div>
						</div>
						<hr />
						<div class="infoDetail">??? ?????? ????????? ?????? ???</div>

						<c:choose>
							<c:when test="${fn:length(recentBoard) == 0}">
                                ???
                            </c:when>
							<c:otherwise>
								<c:forEach var="recentBoard" items="${recentBoard}" varStatus="vs">
									<div class="upload">
										${vs.index+1}. <a href="${pageContext.request.contextPath}/${recentBoard.BOARD_KIND}/details/${recentBoard.BOARD_SEQ}"> ${recentBoard.TITLE} </a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- ?????????3 -->
					<div class="userInfoBox col-sm-4" style="padding-top: 20px;">
						<div class="col playWith">?????? ????????? ????????????</div>
						<div class="col">
							<div class="nickBox">
								<b>[???????????? ???????????????????????!]</b>
							</div>
							<c:choose>
								<c:when test="${recentlyChatUserVOList == null or fn:length(recentlyChatUserVOList) == 0}">
									<div class="nickName">?????? ????????? ??????????????? ????????????.</div>
								</c:when>
								<c:otherwise>
									<c:forEach items="${recentlyChatUserVOList}" var="recentlyChatUserVO">
										<div class="nickName">
											[<a class="col" href="/user/info/${recentlyChatUserVO.userId}">${recentlyChatUserVO.nickName}</a>]
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
				<!-- ??????/?????????/????????????????????? end -->
				<br />

				<!-- ????????? begin -->
				<div class="reputation row">
					<div class="col-sm-4" style="display: flex; justify-content: flex-start; align-items: center;">
						????????? ?????? ???????????????!
						<h6>&nbsp;[??????????????? ??????]</h6>
					</div>

					<!-- ?????? begin -->
					<div class="col-sm-8" style="display: flex; justify-content: flex-end;">
						<div class="searchBox">
							<select name="searchType" id="searchType" class="input-value selectOption">
								<option class="optionBox" value="writerId">?????????</option>
								<option class="optionBox" value="writeDate">??????</option>
							</select>
							<input type="text" class="input-value" id="writeUser" name="keyword" style="display: block;" placeholder="???????????????">
							<input type="date" class="input-value" id="dateSelect" name="keyword" style="display: none; width: 45%; background: gray;">
							<button type="button" id="searchBtn" class="btn btn-primary">??????</button>
							<c:if test="${sessionScope.id ne userOneSelect.userId and reviewCnt == 0}">
							<!-- 						?????? ????????? ?????? ?????? ?????? ????????? ??????????????? -->
							<span class="writeReview" style=" display: contents;">
								<button type="button" class="btn btn-secondary" style="margin: 0px;" onclick="fn_review('${userOneSelect.upUserId}')">????????????</button>
							</span>
							</c:if>
						</div>
					</div>
					<!-- ?????? end-->

					<c:forEach var="reviewVO" items="${reviewVOs}" varStatus="status">
						<div class="review col-4" id="divReview_${status.index}">
							<div class="reviewDay">${reviewVO.inUserId}&nbsp;<fmt:formatDate value="${reviewVO.inDate}" />
							</div>
							<div class="rev font-family-maple-bold">
								${reviewVO.reply}
								<!-- hover ??? -->
								<div class="caption">
									<c:forEach begin="1" end="${reviewVO.starCnt}">
										<i class="fas fa-star"></i>
									</c:forEach>
									<c:forEach begin="1" end="${5-reviewVO.starCnt}">
										<i class="far fa-star"></i>
									</c:forEach>
								</div>
							</div>
						</div>
						<ul class="contextmenu" id="divContextmenu_${status.index }">
							<li><a onclick="fn_declaration('${reviewVO.upUserId}','${reviewVO.reply}')">????????????</a></li>
							<!-- ???????????????????????? ??????->> -->
							<li><a href="/user/info/${reviewVO.upUserId}">????????????</a></li>
						</ul>
					</c:forEach>
					<!-- ????????? end-->

					<%-- location.href = "/user/info/${userOneSelect.userId}?num=1" + "&searchType=" + searchType + "&keyword=" + keyword; --%>
					<!-- ??????????????? begin -->
					<div class="paging col-12 pagination-item" style="position: relative;">
						<div class="col-12" style="display: flex; justify-content: center;">
							<c:if test="${page.prev}">
								<a href="/user/info/${userOneSelect.userId}?num=${page.startPageNum-1}&searchType=${page.searchType}&keyword=${page.keyword}">prev</a>
							</c:if>
							<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
								<c:choose>
									<c:when test="${page.num != num}">
										<a href="/user/info/${userOneSelect.userId}?num=${num}&searchType=${page.searchType}&keyword=${page.keyword}">${num}</a>
									</c:when>
									<c:otherwise>
										<a href="#">${num}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${page.next}">
								<a href="/user/info/${userOneSelect.userId}?num=${page.endPageNum+1}&searchType=${page.searchType}&keyword=${page.keyword}">next</a>
							</c:if>
						</div>
					</div>
					<!-- ??????????????? end -->
				</div>

				<!-- ????????? ????????? (???????????????li?????????) -->
				<!-- ?????? ????????? ?????? ?????? ?????? ????????? ?????? share box begin  -->
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

<script>
	function fn_sync() {
		window.open("/user/sync", "userSync",
				"width=768, height=367, left=450,top=120");
	}

	function fn_infoMod(userId) {
		window.open("/user/modify/" + userId, "userModify",
				"width=800, height=680, left=250,top=200");
	}

	function fn_review(user_Id) {
		window.open("/user/review/" + user_Id, "userReview",
				"width=870, height=500, left=400,top=200");
	}

	function fn_declaration(userId, reply) {
		window.open("/user/declare?userId=" + userId + "&log=" + reply,
				"userDeclare", "width=980, height=500, left=400,top=200");
	}

	function fn_infoDel() {
		confirm("?????????????????????????")
	}

	// ????????? ????????? TEXTCONTENT
	$(function() {
		$(".review").contextmenu(
				function(e) {
					const idx = $(this)[0].id.replace('divReview_', '');

					const winWidth = $(document).width();
					const winHeight = $(document).height();
					const posX = e.pageX;
					const posY = e.pageY;
					const contextmenu = $($(".contextmenu")[idx]);
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

	// ???????????? ?????? ????????? display block??? none??? ??? ??????
	$(function() {
		$('#searchType').click(function() {
			if (this.value === 'writerId') {
				$('#writeUser').css('display', 'block');
				$('#dateSelect').css('display', 'none');
			} else {
				$('#writeUser').css('display', 'none');
				$('#dateSelect').css('display', 'block');
			}
		})
	});

	document.getElementById("searchBtn").onclick = function() {

		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword = "";
		if (searchType === "writerId") {
			keyword = document.getElementsByName("keyword")[0].value;
			console.log(keyword);
			location.href = "/user/info/${userOneSelect.userId}?num=1"
					+ "&searchType=" + searchType + "&keyword=" + keyword;
		} else {
			keyword = document.getElementsByName("keyword")[1].value;
			console.log(keyword);
			location.href = "/user/info/${userOneSelect.userId}?num=1"
					+ "&searchType=" + searchType + "&keyword=" + keyword;
		}
		console.log("searchType: " + searchType)
		console.log("keyword: " + keyword)
	};

	function fn_SyncTierLv() {
		if (confirm("????????? ???????????????????????????")) {
			$.ajax({
				url : "/user/search/${userOneSelect.userId}",
				type : "POST",
				dataType : "json",
				success : function(data) {
					$("#getLv").html("Lv. " + data.summonerLevel);
					$("#getTier").html(data.tier);
					$("#tierPic1").attr('style', "display:none;");
					$("#tierPic2").attr('style', "display:inline;");
				},
				error : function(e) {
					alert("???????????? err");
					console.log(e);
				}
			});
		}
	}

	function fn_SyncDel() {
		var chk = confirm("??????????????? ????????????????");
		if (chk) {
			$.ajax({
				url : "/authCancel",
				type : "POST",
				success : function(data) {
					if (data.status === "ng") {
						alert(data.message);
					}
					location.reload();
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
	}
</script>