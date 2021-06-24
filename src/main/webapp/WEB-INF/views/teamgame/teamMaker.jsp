<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="../layout/header.jsp">
	<c:param name="path" value="${path}" />
</c:import>
<style>
#floating-left {
	position: fixed;
	left: 6%;
	top: 300px;
	margin-left: 50px;
	width: 150px;
}

#floating-right {
	position: fixed;
	right: 50%;
	top: 300px;
	margin-right: -750px;
	width: 150px;
}

.innerBox {
	display: inline-block;
	width: 24%;
	height: auto;
	border: 1px solid white;
	border-radius: 5px;
	color: white;
	margin: 2px 10px 2px 0;
	text-align: center;
	position: relative;
	background: #1C1C1C;
}

.outBox {
	border: none;
}

.positionTop {
	background: red;
	color: white;
	border-radius: 5px;
}

.positionJun {
	background: lightblue;
	color: black;
	border-radius: 5px;
}

.positionMid {
	background: lightblue;
	color: black;
	border-radius: 5px;
}

.positionAd {
	background: red;
	color: white;
	border-radius: 5px;
}

.positionSup {
	background: lightblue;
	color: black; 
	border-radius: 5px;
}

button>img {
	width: 17px;
	height: 17px;
}

.message {
	margin: 5px;
	word-break: break-all;
}

.Gmode {
	margin-bottom: 0;
	margin-top: 7px;
	background: grey;
	color: white;
	position: absolute;
	bottom: 0;
	width: 100%;
}

.nickname {
	font-family: mapleBold;
	font-weight: bolder;
	margin: 5px;
}

.micUse {
	width: 25px;
	height: 25px;
	margin: 3px;
}
</style>

<script type="text/javascript">
	function fn_makeRoom() {
		window.open("makeRoom", "makeTeam",
				"width=900, height=500, left=250,top=200");
	}
</script>
<!-- Main Content Post Section Begin -->
<section class="details-post-section spad" style="padding: 0;">
	<!-- class="container"는 글을 가운데 정렬해주는 역할 -->
	<div class="container" style="width: 900px;">

		<div class="p-0">
			<div class="details-text typography-page" style="width: 1050px; margin-left: -90px;">
				<div class="dt-breadcrumb" style="margin-bottom: 10px;">
					<div class="dt-bread-option" style="margin-bottom: 10px;">
						<a href="#">team</a> <span>slave</span>
					</div>
					<h4 class="text-white">Make your own TEAM</h4>
				</div>
				<div class="dt-desc" style="display: block;">
					<!-- <p>가장 완성된 팀을 만들어 챌린저에 도전하세요!</p> -->
					<div class="row outBox" style="margin-left: 5px;">
						<!-- 방만들기 begin -->
						<div class="innerBox text-center justify-content-center align-items-center d-flex">
							<label for="makeRoom" onclick="fn_makeRoom()"> <img id="makeRoom" style="width: 40px; margin: 5px" src="${path}/img/details/plusButton.png"> &nbsp; 방만들기
							</label>
						</div>
						<!-- 방만들기 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: #848484; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>그마이상구함!!!</b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<b>하위!!!</b>
								</p>
							</div>
							<p class="nickname">
								Faker | <img style="width: 35px; height: 35px;" src="${path}/img/lol/bronze.png" /> | <img style="width: 25px; height: 25px; margin: 3px;" src="${path}/img/details/mic_o.jpg" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Grandmaster-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Grandmaster-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Grandmaster-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Grandmaster-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Grandmaster-Support.png" />
								</button>
							</p>
							<p class="message">가나다라마바사아자차카타</p>
							<p class="Gmode">
								<b class="adapt">솔로랭크</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: lightblue; color: black; font-size: 18px;">
								<b>다이아이상구함!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								RIRINTO | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" /> | <img class="micUse" src="${path}/img/details/mic_o.jpg" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Diamond-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Diamond-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Diamond-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Diamond-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Diamond-Support.png" />
								</button>
							</p>
							<p class="message">좆나못하니깐 캐리할사람만 들어오셈 히히!</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox">
							<p style="margin: 0; background: brown; color: black; font-size: 18px;">
								<b>브론즈이상구함!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								안뇽하세욤 | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" /> | <img class="micUse" src="${path}/img/details/mic_o.jpg" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Bronze-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Bronze-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Bronze-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Bronze-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Bronze-Support.png" />
								</button>
							</p>
							<p class="message">1235678903456780123563</p>
							<p class="Gmode">
								<b>자유랭크</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- 							<div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: gold; color: black; font-size: 18px;">
								<b>챌린저이상구함!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								궁각예술 | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Challenger-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Challenger-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Challenger-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Challenger-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Challenger-Support.png" />
								</button>
							</p>
							<p class="message">TLdldldlqkf 왜 밑으로 안내려가</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: white; color: black; font-size: 18px;">
								<b>아이언안구함!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								싯벨룜 | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Iron-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Iron-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Iron-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Iron-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Iron-Support.png" />
								</button>
							</p>
							<p class="message"></p>
							<p class="Gmode">
								<b>칼바람</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p class="nickname" style="margin: 0; background: yellow; color: black; font-size: 18px;">
								<b>골드구함!!</b>
							</p>
							<p style="margin: 5px;">
								regolas | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" /> | <img class="micUse" src="${path}/img/details/mic_o.jpg" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Gold-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Gold-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Gold-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Gold-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Gold-Support.png" />
								</button>
							</p>
							<p class="message">div 내부 p 태그를 가장 아랫쪽으로 내리고 싶어요..</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: silver; color: black; font-size: 18px;">
								<b>실버구함!!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								PAKA | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Silver-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Silver-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Silver-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Silver-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Silver-Support.png" />
								</button>
							</p>
							<p class="message">좆나 보기 싫네 ㅋㅋ</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: green; color: black; font-size: 18px;">
								<b>플래티넘구함!!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								또뽀끼 | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Plat-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Plat-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Plat-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Plat-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Plat-Support.png" />
								</button>
							</p>
							<p class="message">기괴하게 변해버린 팀게시판..</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox" style="text-align: center">
							<p style="margin: 0; background: purple; color: black; font-size: 18px;">
								<b>마스터구함!!</b>
							</p>
							<p class="nickname" style="margin: 5px;">
								Greenday | <img style="width: 30px; height: 30px;" src="${path}/img/lol/challenger.png" />
							</p>
							<p style="margin: 3px;">
								<button type="button" class="positionTop">
									<img src="${path}/img/lol/Position_Master-Top.png" />
								</button>
								<button type="button" class="positionJun">
									<img src="${path}/img/lol/Position_Master-Jungle.png" />
								</button>
								<button type="button" class="positionMid">
									<img src="${path}/img/lol/Position_Master-Mid.png" />
								</button>
								<button type="button" class="positionAd">
									<img src="${path}/img/lol/Position_Master-Bot.png" />
								</button>
								<button type="button" class="positionSup">
									<img src="${path}/img/lol/Position_Master-Support.png" />
								</button>
							</p>
							<p class="message">성공해주세요성공해주세요성공해주세요성공해주세요</p>
							<p class="Gmode">
								<b>일반게임</b>
							</p>
						</div>
						<!-- 만들어진 방 end -->

					</div>
				</div>
				<!-- share box begin -->
				<div style="border: 1px solid white; display: block;" class="dt-share">
					<div class="ds-title">share;;</div>
					<div class="ds-links">
						<a href="#" class="wide"> <i class="fa fa-heart-o"></i> <span>120</span>
						</a> <a href="#"> <i class="fa fa-facebook"></i>
						</a> <a href="#"> <i class="fa fa-twitter"></i>
						</a> <a href="#"> <i class="fa fa-google-plus"></i>
						</a> <a href="#"> <i class="fa fa-instagram"></i>z
						</a> <a href="#"> <i class="fa fa-youtube-play"></i>
						</a>
					</div>
				</div>
				<!-- share box end -->

			</div>
		</div>
	</div>
</section>
<!-- Details Post Section End -->

<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${path}" />
</c:import>