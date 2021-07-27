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

<c:if test="${blackUserVO != null}">
    <fmt:formatDate value="${blackUserVO.endDate}" var="endDate" pattern="yyyy-MM-dd hh:mm:ss" type="both"/>
    <div id="banner">
        <span class="deletepop" onclick="fn_out()"><i class="fas fa-times"></i></span>
        <p><h4 class="head"><b>홈페이지 사용 일시 중지</b></h4></p>
        <p class="bcontent">${blackUserVO.nickName}님은
            <c:choose>
                <c:when test="${blackUserVO.reasonkind eq '광고'}">
                    <b>[불법 광고 도배]</b>
                </c:when>
                <c:when test="${blackUserVO.reasonkind eq '사칭'}">
                    <b>[타인을 사칭]</b>
                </c:when>
                <c:when test="${blackUserVO.reasonkind eq '욕설'}">
                    <b>[공격적인 언어 사용]</b>
                </c:when>
                <c:otherwise>
                    <b>[타인에게 불쾌감을 주거나 부적절한 이름 사용]</b>
                </c:otherwise>
            </c:choose>
            행위로 타인에게 신고되어</p>
        <p class="bcontent">계정이 정지기간 동안 정지되었음을 알려드립니다</p>
        <p></p>
        <p class="bcontent">정지기간동안 로그인이 불가능합니다.</p>
        <p class="endDate">정지기간 : ~ ${endDate}</p>
    </div>
</c:if>

<!-- 유튜브 영상 스크립트 시작 -->
<style>
    #youtube_video {
        height: 350px;
    }

    #banner {
        position: absolute;
        left: calc(50% - 250px);
        top: calc(50% - 150px);
        z-index: 99999;
        width: 500px;
        height: 300px;
        background: #000000;
        color: white;
        border: 1px solid #c4c4c4;
    }

    .endDate {
        margin-top: 20px;
        text-align: center;
    }

    .head {
        color: #c4c4c4;
        text-align: center;
        margin-bottom: 40px;
    }

    .bcontent {
        text-align: center;
    }

    .deletepop {
        margin-left: 3px;
    }
</style>
<script>
    function show_video(video_id) {
        $("#youtube_video").attr("src", "https://www.youtube.com/embed/" + video_id);
    }

    function fn_out() {
        $("#banner").hide();
    }
</script>
<!-- 유튜브 영상 스크립트 끝 -->

<!-- Videos Guide Section Begin -->
<section class="video-guide-section">
    <div class="container">
        <div class="row">
            <div class="col-12">
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
                                        href="#tabs-3" role="tab">Season Rank</a></li>
                <li class="nav-item"><a class="nav-link" data-toggle="tab"
                                        href="#tabs-4" role="tab">Calendar</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">

                <!-- LCK 시작 -->
                <div class="tab-pane fade show active" id="tabs-1" role="tabpanel">
                    <div class="row">
                        <div class="col-xl-6 col-12">
                            <iframe id="youtube_video" class="w-100"
                                    src="https://www.youtube.com/embed/${youTubeVoList[0].idVideoid}"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                    allowfullscreen></iframe>
                        </div>
                        <div class="col-xl-6 col-12">
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
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12 text-white text-center">
                                    <table class="table text-white text-center">
                                        <thead>
                                        <th scope="col">제목</th>
                                        <th scope="col">게시판</th>
                                        <th scope="col">작성일</th>
                                        <th scope="col">작성자</th>
                                        </thead>
                                        <c:forEach items="${boardPagingVO.boardVOList}" var="boardVO" begin="0"
                                                   end="10">
                                            <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <span class="overflow-hidden text-nowrap"
                                                          onclick="location.href='${boardVO.boardKind}/details/${boardVO.boardSeq}'"
                                                          style="cursor: pointer; text-overflow: ellipsis;">
                                                            ${boardVO.title}
                                                    </span>
                                                </th>
                                                <th>${fn:toUpperCase(boardVO.boardKind)}</th>
                                                <th>${boardVO.boardInDateToString}</th>
                                                <th>${boardVO.nickName}</th>
                                            </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
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
                        <div class="col-12 row text-center text-white row">
                            <div class="col-12 row mt-2 mb-2">
                                <div class="col-6 m-auto">팀 순위</div>
                                <div class="col-1 m-auto">승</div>
                                <div class="col-1 m-auto">패</div>
                                <div class="col-2 m-auto">득실차</div>
                                <div class="col-2 m-auto">승률</div>
                            </div>
                            <c:forEach var="teamInfo" items="${teamInfoList}">
                                <div class="col-12 row mt-2 mb-2">
                                    <div class="col-1 m-auto">
                                        <strong>${teamInfo.rank}</strong>
                                    </div>
                                    <div class="col-2 m-auto">
                                        <img width="auto" style="max-height: 60px;" src="${teamInfo.imageUrl}" alt=""/>
                                    </div>
                                    <div class="col-3 m-auto">${teamInfo.nameAcronym}</div>
                                    <div class="col-1 m-auto">${teamInfo.wins}</div>
                                    <div class="col-1 m-auto">${teamInfo.loses}</div>
                                    <div class="col-2 m-auto">${teamInfo.score}</div>
                                    <div class="col-2 m-auto">${teamInfo.winRate}</div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <!-- League Member 끝 -->

                <!-- Calendar 시작-->
                <div class="tab-pane fade" id="tabs-4" role="tabpanel">
                    <!-- https://esports.inven.co.kr/schedule/ 여기서 긁어오면 될 듯 -->
                    <div class="row">
                        <div class="col-12">
                            <table id="leagueCalendar" class="w-100 text-white" border="1" style="table-layout: fixed">
                                <tr>
                                    <th class="text-center">SUN</th>
                                    <th class="text-center">MON</th>
                                    <th class="text-center">TUE</th>
                                    <th class="text-center">WED</th>
                                    <th class="text-center">THU</th>
                                    <th class="text-center">FRI</th>
                                    <th class="text-center">SAT</th>
                                </tr>
                            </table>
                            <script>
                                const today = new Date();
                                const lastDay = new Date(today.getFullYear(), today.getMonth() + 1, 0);
                                let data = "<tr>";
                                for (let i = 0; i < new Date(today.getFullYear(), today.getMonth(), 1).getDay(); i++) {
                                    data += "<td></td>";
                                }
                                for (let i = 1; i <= lastDay.getDate(); i++) {
                                    data += "<td id='" + (today.getMonth() + 1) + "-" + i + "' class='align-top'>";
                                    data += i;
                                    data += "</td>";

                                    const date = new Date(today.getFullYear(), today.getMonth(), i);
                                    if (date.getDay() === 6) {
                                        if (i === lastDay.getDate()) {
                                            data += "</tr>";
                                        } else {
                                            data += "</tr>";
                                            data += "<tr>";
                                        }
                                    }
                                }
                                $("#leagueCalendar").append(data);
                                <c:forEach var="leagueCalendar" items="${leagueCalendarList}">
                                <fmt:formatDate var="date" type="date" value="${leagueCalendar.date}" pattern="M-d"/>
                                <fmt:formatDate var="time" type="time" value="${leagueCalendar.date}" pattern="HH:mm"/>
                                data = "<div>"
                                data += "<div><span class='badge badge-dark'>${time}</span></div>";
                                data += "<div class='text-right'>${leagueCalendar.ATeam} vs ${leagueCalendar.BTeam}<div>";
                                data += "</div>";

                                $("#${date}").append(data);
                                </c:forEach>
                            </script>
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
            <div class="col-12">
                <div class="section-title">
                    <h5>
                        <span>GALLERY</span>
                    </h5>
                </div>
                <div>
                    <div class="row">
                        <div class="un-slider owl-carousel">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="un-big-item set-bg"
                                             data-setbg="${galleryBoardVOList[0].imgSrc}">
                                            <div class="ub-text">
                                                <div class="label">
                                                    <span>Best Art</span>
                                                </div>
                                                <h5>
                                                    <a href="${pageContext.request.contextPath}/gallery/details/${galleryBoardVOList[0].boardSeq}">${galleryBoardVOList[0].title}</a>
                                                </h5>
                                                <ul>
                                                    <li>by <span>${galleryBoardVOList[0].nickName}</span></li>
                                                    <li><i class="far fa-clock"></i> ${galleryBoardVOList[0].boardInDateToString}</li>
                                                    <li><i class="far fa-comment"></i> ${galleryBoardVOList[0].replyCnt}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="un-big-item set-bg"
                                             data-setbg="${galleryBoardVOList[1].imgSrc}">
                                            <div class="ub-text">
                                                <div class="label">
                                                    <span>Best Art</span>
                                                </div>
                                                <h5>
                                                    <a href="${pageContext.request.contextPath}/gallery/details/${galleryBoardVOList[1].boardSeq}">${galleryBoardVOList[0].title}</a>
                                                </h5>
                                                <ul>
                                                    <li>by <span>${galleryBoardVOList[1].nickName}</span></li>
                                                    <li><i class="far fa-clock"></i> ${galleryBoardVOList[1].boardInDateToString}</li>
                                                    <li><i class="far fa-comment"></i> ${galleryBoardVOList[1].replyCnt}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4">
                                        <div class="un-item">
                                            <div class="un_pic set-bg"
                                                 data-setbg="${galleryBoardVOList[2].imgSrc}">
                                            </div>
                                            <div class="un_text">
                                                <h6>
                                                    <a href="${pageContext.request.contextPath}/gallery/details/${galleryBoardVOList[2].boardSeq}">${galleryBoardVOList[2].title}</a>
                                                </h6>
                                                <ul>
                                                    <li><i class="far fa-clock"></i> ${galleryBoardVOList[2].boardInDateToString}</li>
                                                    <li><i class="far fa-comment"></i> ${galleryBoardVOList[2].replyCnt}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="un-item">
                                            <div class="un_pic set-bg"
                                                 data-setbg="${galleryBoardVOList[3].imgSrc}">
                                            </div>
                                            <div class="un_text">
                                                <h6>
                                                    <a href="${pageContext.request.contextPath}/gallery/details/${galleryBoardVOList[3].boardSeq}">${galleryBoardVOList[3].title}</a>
                                                </h6>
                                                <ul>
                                                    <li><i class="far fa-clock"></i> ${galleryBoardVOList[3].boardInDateToString}</li>
                                                    <li><i class="far fa-comment"></i> ${galleryBoardVOList[3].replyCnt}</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="un-item">
                                            <div class="un_pic set-bg"
                                                 data-setbg="${galleryBoardVOList[4].imgSrc}">
                                            </div>
                                            <div class="un_text">
                                                <h6>
                                                    <a href="${pageContext.request.contextPath}/gallery/details/${galleryBoardVOList[4].boardSeq}">${galleryBoardVOList[4].title}</a>
                                                </h6>
                                                <ul>
                                                    <li><i class="far fa-clock"></i> ${galleryBoardVOList[4].boardInDateToString}</li>
                                                    <li><i class="far fa-comment"></i> ${galleryBoardVOList[4].replyCnt}</li>
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
</section>
<!-- Update News Section End -->


<c:import url="../layout/footer.jsp"/>