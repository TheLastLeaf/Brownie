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
	margin: 4px 10px 4px 0;
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
	background: white;
	color: black;
	border-radius: 5px;
}

.positionMid {
	background: white;
	color: black;
	border-radius: 5px;
}

.positionAd {
	background: red;
	color: white;
	border-radius: 5px;
}

.positionSup {
	background: white;
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

.roomTitle {
	font-family: maplelight;
	font-weight: bolder;
	margin: 5px;
	border-radius: 5px;
	background: grey; 
}

.micUse {
	width: 25px;
	height: 25px;
	margin: 3px;
}

.tierImg {
	width: 25px;
	height: 25px;
}
</style>

<script type="text/javascript">
	function fn_makeRoom() {
		window.open("makeRoom", "makeTeam",
				"width=800, height=570, left=250,top=200"); 
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
						<a href="#">team</a>
						<span>slave</span>
					</div>
					<h4 class="text-white">Make your own TEAM</h4>
				</div>
				<div class="dt-desc" style="display: block;">
					<!-- <p>가장 완성된 팀을 만들어 챌린저에 도전하세요!</p> -->
					<div class="row outBox" style="margin-left: 5px;">
						<!-- 방만들기 begin -->
						<div class="innerBox text-center justify-content-center align-items-center d-flex">
							<label for="makeRoom" onclick="fn_makeRoom()">
								<img id="makeRoom" style="width: 40px; margin: 5px" src="${path}/img/details/plusButton.png">
								&nbsp; 방만들기
							</label>
						</div>
						<!-- 방만들기 end -->

						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">칼바람 할 사람 구함~</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">너와 함께 게임을 하고 싶어!</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->

						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">즐겜러 구해욤~</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">그마이상구함!!!</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">칼바람 도마바람 국자바람</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">노랑통닭마려운 낭니</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">집에 가고 싶습니까?...</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">같이 좀만 더 하면 안될까?ㅠㅠ,,</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">나 스프링 못해서 어떻함</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">존나 울고싶네</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->
						<!-- 만들어진 방 begin -->
						<!-- <div class="innerBox" style="text-align: center"> -->
						<div class="innerBox text-center">
							<div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
								<p class="col-sm" style="margin: 0; text-align: left;">
									<b>솔로랭크 </b>
								</p>
								<p class="col-sm" style="margin: 0; text-align: right;">
									<img style="width: 25px; height: 25px;" src="${path}/img/details/mic_o.jpg" />
								</p>
							</div>
							<div class="roomTitle">시간을 쏟는게 맞을까?...</div>
							<p style="margin: 10px 0px 3px;">
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
							<div class="" style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
								<p class="message">이쁘지 않으면 만지기도 싫은걸?..ㅠㅠ,,</p>
							</div>
							<div class="row text-white" style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-end;">닉네임</div>
								<div class="col-sm-6" style="margin: 0; display: flex; justify-content: flex-start;">
									<img class="tierImg" src="${path}/img/lol/grandMaster.png" />
									[G·M]
								</div>
							</div>
						</div>
						<!-- 만들어진 방 end -->

					</div>
				</div>
				<!-- share box begin -->
				<div style="border: 1px solid white; display: block;" class="dt-share">
					<div class="ds-title">share;;</div>
					<div class="ds-links">
						<a href="#" class="wide">
							<i class="fa fa-heart-o"></i>
							<span>120</span>
						</a>
						<a href="#">
							<i class="fa fa-facebook"></i>
						</a>
						<a href="#">
							<i class="fa fa-twitter"></i>
						</a>
						<a href="#">
							<i class="fa fa-google-plus"></i>
						</a>
						<a href="#">
							<i class="fa fa-instagram"></i>
							z
						</a>
						<a href="#">
							<i class="fa fa-youtube-play"></i> 
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