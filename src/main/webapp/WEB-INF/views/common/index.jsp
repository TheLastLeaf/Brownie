<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<c:if test="${sessionScope.id ne null and sessionScope.id eq sessionScope.blackUserVO.userId}">
<div id="banner">
    <span class="deletepop" onclick="fn_out()"><i class="fas fa-times"></i></span>
    <p><h4 class="head"><b>홈페이지 사용 일시 중지</b></h4></p>
    <p class="bcontent">${sessionScope.blackUserVO.nickName}님은 타인에게 불쾌감을 주는 행동으로 신고되어</p>
    <p class="bcontent">이는 관리자 판단 후 계정이 정지기간 동안 정지되었음을 알려드립니다</p>
    <p class="bcontent">정지기간동안 게시글과 댓글 작성이 불가능합니다.</p>
    <p class="endDate">정지기간 : ${sessionScope.blackUserVO.endDate}</p>
</div>
</c:if>

<!-- 유튜브 영상 스크립트 시작 -->
<style>
    #youtube_video {
        height: 350px;
    }
    #banner{
        position: absolute;
        left: 600px;
        top: 300px;
        z-index: 99999;
        width:500px;
        height:300px;
        background: #000000;
        color: white;
        border: 1px solid #c4c4c4;
    }

    .endDate{
        margin-top: 20px;
        text-align: center;
    }
    .head{
        color: #c4c4c4;
        text-align: center;
        margin-bottom: 40px;
    }
    .bcontent{
        text-align: center;
    }
    .deletepop{
        margin-left: 3px;
    }
</style>
<script>
    function show_video(video_id) {
        $("#youtube_video").attr("src", "https://www.youtube.com/embed/" + video_id);
    }
    function fn_out(){
        $("#banner").hide();
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
                            <iframe id="youtube_video" class="w-100"
                                    src="https://www.youtube.com/embed/${youTubeVoList[0].idVideoid}"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>
                        </div>
                        <div class="col-xl-6 col-md-12">
                            <c:forEach var="youTubeVo" items="${youTubeVoList}">
                                <div class="p-1"
                                     style="border-width: 1px 0 1px 0; border-color: white; border-style: solid">
                                    <p class="m-0 font-weight-bold" onclick="show_video('${youTubeVo.idVideoid}')"
                                       style="cursor: pointer; overflow: hidden; text-overflow: ellipsis; white-space:nowrap;">
                                            ${youTubeVo.snippetTitle}
                                    </p>
                                </div>
                            </c:forEach>
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
                                    <table border="1" style="width: 100%; color: white; text-align: center;">
                                        <tr>
                                            <th style="width: 20%">제목</th>
                                            <th style="width: 20%">게시판</th>
                                            <th style="width: 30%">작성일</th>
                                            <th style="width: 20%">작성자</th>
                                        </tr>
                                        <c:forEach items="${boardPagingVO.boardVOList}" var="boardVO" begin="0"
                                                   end="10">
                                            <tr>
                                                <th><span
                                                        onclick="location.href='${boardVO.boardKind}/details/${boardVO.boardSeq}'"
                                                        style="cursor: pointer">${boardVO.title}</span></th>
                                                <th>${fn:toUpperCase(boardVO.boardKind)}</th>
                                                <th>${boardVO.boardInDateToString}</th>
                                                <th>${boardVO.nickName}</th>
                                            </tr>
                                        </c:forEach>
                                    </table>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                    <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                    <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                    <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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
                                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                                            <li><i class="far fa-comment"></i> 20</li>
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