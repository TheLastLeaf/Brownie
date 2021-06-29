<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="../layout/header.jsp">
	<c:param name="path" value="${path}" />
</c:import>
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
}

.outBox {
	border: none;
}

.profileBox {
	border: 2px solid red;
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
	border-radius: 0px 15px 0px 0px;
}

button {
	margin: 10px;
}

.sync {
	display: flex;
	justify-content: center;
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
hr{
	background: white; 
 	margin: 8px; 
}
</style>

<script type="text/javascript">
	
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
							<img class="profile" id="profile" src="${path}/img/userInfo/sana1.gif">
						</div>
						<div style="color: white;">
							<div class="Hierarchy">
								<i>일반회원</i>
							</div>
							<div class="nameLv">
								<h3>ririnto | Lv.68 | ☆☆☆★★</h3> 
							</div>
						</div>
					</div>
				</div>

<!-- 연동/게시글/같이플레이한놈 begin -->
				<div class="row" style="color: white;">
					<!-- 뭉태기1 -->
					<div class="userInfoBox col-sm-4">
						<div class="sync">
							<button>연동</button>
						</div>
						<div class="sync">
							<!-- 연동이 되었다는 가정하에 만들어짐 default 는 ??? | ??? | ??? -->
							ririnto | Lv:98 | Bronze !!!
						</div>
						<div class="sync">[메인포지션] : 기입(ex. 미드)</div>
					</div>

					<!-- 뭉태기2 -->
					<div class="userInfoBox col-sm-4">
						<div>
							<div class="infoDetail">게시글 갯수: 20</div>
							<div class="infoDetail">댓글 갯수: 400</div>
							<div class="infoDetail">좋아요: 395</div>
							<div class="infoDetail">싫어요: 312</div>
						</div>
						<hr/>
						<div class="infoDetail">
							최근 게시글 내역
						</div>
						<div>1. 무지성에 관한 고찰</div>
						<div>2. 팀원의 성향에 대한 고찰</div>
						<div>3. 진짜 프로젝트를 2주면 완성이 될까?</div>
					</div>

					<!-- 뭉태기3 -->
					<div class="userInfoBox col-sm-4">
						<div>
							최근 플레이한 커뮤니티 닉네임<br />[이동해서 별점주세요!!!]
						</div>
					</div>
				</div>
<!-- 연동/게시글/같이플레이한놈 end -->
				<br />
				
				<div style="border:1px solid white; color:white;">
					<div class="">
					<div style="display: flex; justify-content: flex-start;">이사람은 어떤가요?</div>
					<div style="display: flex; justify-content: flex-end;">후기작성</div>
					</div>
				
					<!-- 다른사람이 쓴 후기 -->
					<div>
						<div></div>
					</div>
				
				</div>
				
				
				<!-- share box begin -->
				<div style="border: 1px solid black; display: block;" class="dt-share">
					<div class="ds-title">??</div>
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