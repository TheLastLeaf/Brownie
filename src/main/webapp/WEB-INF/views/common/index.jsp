<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Hero Section Begin -->
<section class="hero-section">
    <div class="container">
        <div class="row">
        </div>
    </div>
    <div class="hero-slider owl-carousel">
        <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/hero-1.jpg"></div>
        <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/hero-2.jpg"></div>
        <div class="hs-item set-bg" data-setbg="${pageContext.request.contextPath}/img/hero/hero-3.jpg"></div>
    </div>
</section>
<!-- Hero Section End -->

<div id=”banner” style="position: absolute; left: 100px;top: 300px; z-index: 99999; width:500px; height:300px; background: #000000; color: white;"> 님 정지됨ㅅㄱ </div>

<!-- 유튜브 영상 스크립트 시작 -->
<script>
	window.onload = function () {
		show_video(0);
	}

	function show_video(id){
		$(".youTubeList").hide();
		$(".youTubeList").eq(id).show();
	}
</script>
<!-- 유튜브 영상 스크립트 끝 -->

<!-- Videos Guide Section Begin -->
	<section class="video-guide-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h5>League of Legends</h5>
					</div>
				</div>
			</div>
			<div class="tab-elem">
				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#tabs-1" role="tab">LCK</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-2" role="tab">News</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-3" role="tab">League Member</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#tabs-4" role="tab">Calendar</a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">

				<!-- LCK 시작 -->
					<div class="tab-pane fade show active" id="tabs-1" role="tabpanel">
						<div class="row">
                            <div class="col-xl-6 col-md-12">
                                <c:forEach var="youTubeVo" items="${youTubeVoList}">
                                    <div class="vg-item large-vg youTubeList"
                                        data-setbg="${youTubeVo.snippetThumbnailsMediumUrl }">
                                        <iframe class="w-100 h-100" src="https://www.youtube.com/embed/${youTubeVo.idVideoid}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-xl-6 col-md-12">
                                <table class="w-100 text-white text-center border-white" border="1" style="margin-top: 20px;">
                                    <c:forEach var="youTubeVo" items="${youTubeVoList}" varStatus="status">
                                        <tr>
                                            <th>
                                                <span id="${status.index}" class="overflow-hidden" onclick="show_video(this.id)" style="cursor: pointer;">
                                                    ${youTubeVo.snippetTitle }
                                                </span>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
						</div>
					</div>
				<!-- LCK 끝 -->

				<!-- News 시작 -->
					<div class="tab-pane fade" id="tabs-2" role="tabpanel">
						<div class="row">
								<div class="col-lg-12">
									<div class="row">
										<div style="width: 100%; color: white; text-align: center;">
										여기다 공지사항 ㄷ
										</div>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="row">

									</div>
									<div class="row">

									</div>
								</div>
						</div>
					</div>
				<!-- News 끝 -->


				<!-- League Member 시작 -->
					<div class="tab-pane fade" id="tabs-3" role="tabpanel">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
										<table border="1" style="width: 100%; color: white; text-align: center;">
											<tr>
												<th colspan="6">여기에는 선수정보 긁어오면 되나? 이 페이지 뭔 역할 하는지 사실 잘 모르겠음</th>
											</tr>
											<tr>
												<th>이름</th>
												<th>소속</th>
												<th>주챔피언</th>
												<th>승률</th>
												<th>킬데스</th>
												<th>킬관여</th>
											</tr>
											<tr>
												<th>이상혁</th>
												<th>T1</th>
												<th>Faker</th>
												<th>66.1%</th>
												<th>4.4</th>
												<th>67%</th>
											</tr>
											<tr>
												<th>이상혁</th>
												<th>T1</th>
												<th>Faker</th>
												<th>66.1%</th>
												<th>4.4</th>
												<th>67%</th>
											</tr>
											<tr>
												<th>이상혁</th>
												<th>T1</th>
												<th>Faker</th>
												<th>66.1%</th>
												<th>4.4</th>
												<th>67%</th>
											</tr>
											<tr>
												<th>이상혁</th>
												<th>T1</th>
												<th>Faker</th>
												<th>66.1%</th>
												<th>4.4</th>
												<th>67%</th>
											</tr>
											<tr>
												<th>이상혁</th>
												<th>T1</th>
												<th>Faker</th>
												<th>66.1%</th>
												<th>4.4</th>
												<th>67%</th>
											</tr>
										</table>
								</div>
							</div>
							<div class="col-lg-12">
								<div class="row">

								</div>
							</div>
						</div>
					</div>
				<!-- League Member 끝 -->

				<!-- Calendar 시작-->
					<div class="tab-pane fade" id="tabs-4" role="tabpanel">
										<!-- https://esports.inven.co.kr/schedule/ 여기서 긁어오면 될 듯 -->
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<table border="1" style="width: 100%; color: white; text-align: center;">
										<tr>
											<th>날짜</th>
											<th style="width: 25%;">대회명</th>
											<th>시간</th>
											<th>경기 일정 및 결과</th>
										</tr>
										<tr>
											<td rowspan="4">2021.06.25.<br/>금</td>
											<td rowspan="4">2021 LoL 챔피언스 코리아 챌린저스 리그 서머</td>
											<td>17:00</td>
											<td>Fredit BRION <b>VS</b> Afreeca Freecs</td>
										</tr>
										<tr>
											<td>18:00</td>
											<td>NS Red Force <b>VS</b> Liiv Sandbox</td>
										</tr>
										<tr>
											<td>19:00</td>
											<td>kt Rolster <b>VS</b> Gen.G Esports</td>
										</tr>
										<tr>
											<td>20:00</td>
											<td>T1 VS <b>VS</b> DWG KIA</td>
										</tr>


									</table>
								</div>
							</div>
						</div>
					</div>
				<!-- Calendar 끝-->
				</div>
			<!-- Tab panes 끝-->
			</div>
		</div>
	</section>
<!-- Videos Guide Section End -->


<!-- Update News Section Begin -->
	<section class="update-news-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h5>
							<span>GALLERY</span>
						</h5>
					</div>
					<div class="tab-elem">
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								data-toggle="tab" href="#tabs-9" role="tab">Fanart</a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="tab"
								href="#tabs-10" role="tab">Gameplay</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane fade show active" id="tabs-9"
								role="tabpanel">
								<div class="row">
									<div class="un-slider owl-carousel">
										<div class="col-lg-12">
											<div class="row">
												<div class="col-lg-6">
													<div class="un-big-item set-bg"
													data-setbg="${pageContext.request.contextPath}/img/news/news-1.jpg">
														<div class="ub-text">
															<div class="label">
																<span>Best Art</span>
															</div>
															<h5>
																<a href="#">쓰레쉬 한번 그려봤습니ㅏ</a>
															</h5>
															<ul>
																<li>by <span>ㄹㄹㄹ</span></li>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-lg-6">
													<div class="un-big-item set-bg"
													data-setbg="${pageContext.request.contextPath}/img/news/news-1.jpg">
														<div class="ub-text">
															<div class="label">
																<span>Best Art</span>
															</div>
															<h5>
																<a href="#">징크스 귀여워</a>
															</h5>
															<ul>
																<li>by <span>351</span></li>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-3.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">ㅂ배고프고 졸리다</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-4.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">눕고싶다 눈이 시려워</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-2.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">낡고 지친 노인</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="un-big-item set-bg"
												data-setbg="${pageContext.request.contextPath}/img/news/news-1.jpg">
												<div class="ub-text">
													<div class="label">
														<span>Best of Best</span>
													</div>
													<h5>
														<a href="#">롤 팬아트 공모전 당선작</a>
													</h5>
													<ul>
														<li>by <span>ㅎㄱㄷㄴ</span></li>
														<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
														<li><i class="fa fa-comment-o"></i> 20</li>
													</ul>
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-3.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">꿔바로우</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-4.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">마라탕</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-2.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">굴국밥</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="tab-pane fade" id="tabs-10" role="tabpanel">
								<div class="row">
									<div class="un-slider owl-carousel">
										<div class="col-lg-12">
											<div class="un-big-item set-bg"
												data-setbg="${pageContext.request.contextPath}/img/news/news-1.jpg">
												<div class="ub-text">
													<div class="label">
														<span>A Play of the Game</span>
													</div>
													<h5>
														<a href="#">최고의 플레이;</a>
													</h5>
													<ul>
														<li>by <span>Faker</span></li>
														<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
														<li><i class="fa fa-comment-o"></i> 20</li>
													</ul>
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-3.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">정글러 명짤</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-4.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">말뚝딜오지는짤</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-2.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">롤 웃긴짤 모음</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-lg-12">
											<div class="un-big-item set-bg"
												data-setbg="${pageContext.request.contextPath}/img/news/news-1.jpg">
												<div class="ub-text">
													<h5>
														<a href="#">롤 웃긴짤 모음23123</a>
													</h5>
													<ul>
														<li>by <span>Admin</span></li>
														<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
														<li><i class="fa fa-comment-o"></i> 20</li>
													</ul>
												</div>
											</div>
											<div class="row">
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-3.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">ㅈㅁㄹㄴㅁㅈㅇ</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-4.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">롤과 히오스의 차이</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
												<div class="col-md-4">
													<div class="un-item">
														<div class="un_pic set-bg"
															data-setbg="${pageContext.request.contextPath}/img/news/news-2.jpg">
														</div>
														<div class="un_text">
															<h6>
																<a href="#">레스토랑스가 짱아니냐</a>
															</h6>
															<ul>
																<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
																<li><i class="fa fa-comment-o"></i> 20</li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- Update News Section End -->



<c:import url="../layout/footer.jsp"/>