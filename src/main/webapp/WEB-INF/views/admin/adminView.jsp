<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/nunu2.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3></h3>
                    <div>
                        <a href="#" style="color: #ffffff;"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<style>

    .adminMenu {
        cursor: pointer;
   }

    .list {
        width: 840px;
   }


</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text">
                    <div class="dt-overall-rating">
                        <div class="or-heading">
                            <div class="or-item">
                                <div class="or-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                 <span class="circle-progress-2" data-cpid="id-5" data-cpvalue="60"
                                       data-cpcolor="#c20000"></span>
                                            <c:choose>
                                                <c:when test="${dayMap.month lt 10}">
                                                    <div class="review-point" style="top:55px;">
                                                        <div style="top: 60px;">${dayMap.month}월</div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="review-point" style="top:55px; left: 25px;">
                                                        <div style="top: 60px;">${dayMap.month}월</div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="or-text">
                                    <div class="">
                                        <div class="sidebar-option">
                                            <div class="social-media">
                                                <ul>
                                                    <li class="list">
                                                        <div class="sm-icon"><i class="far fa-user"></i></div>
                                                        <span class="adminMenu"
                                                              onclick="location.href='admin/adminMemberList'">멤버 관리</span>
                                                        <div class="follow">${UserCnt.allUserCnt}명</div>
                                                    </li>
                                                    <li class="list">
                                                        <div class="sm-icon"><i class="fas fa-bomb"></i></div>
                                                        <span class="adminMenu"
                                                              onclick="location.href='admin/adminReportList'">신고 내역</span>
                                                        <div class="follow">${reportCnt.reportUserCnt}건</div>
                                                    </li>
                                                    <li class="list">
                                                        <div class="sm-icon"><i class="fas fa-user-lock"></i></div>
                                                        <span class="adminMenu"
                                                              onclick="location.href='admin/adminBlackList'">블랙 리스트</span>
                                                        <div class="follow">${blackUserCnt.blackUserCnt}명</div>
                                                    </li>
                                                    <li class="list">
                                                        <div class="sm-icon"><i class="fas fa-comment-dots"></i></div>
                                                        <span class="adminMenu"
                                                              onclick="location.href='admin/adminBlackList'">채팅 내역</span>
                                                        <div class="follow">${chatCount.chatcount}명</div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="or-skill">
                                <div class="skill-item">
                                    <p>신규 가입자 수</p>
                                    <div id="bar-5" class="barfiller">
                                        <span class="fill" data-percentage="${todayUser.todayUser}"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point"> ${todayUser.todayUser}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 가입자 수</p>
                                    <div id="bar-6" class="barfiller">
                                        <span class="fill" data-percentage="${UserCnt.allUserCnt}"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${UserCnt.allUserCnt}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>신규 게시글 수</p>
                                    <div id="bar-3" class="barfiller">
                                        <span class="fill" data-percentage="${boardCnt.recentBoardCnt}"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${boardCnt.recentBoardCnt}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 게시글 수</p>
                                    <div id="bar-4" class="barfiller">
                                        <span class="fill" data-percentage="${boardCnt.allBoardCnt}"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${boardCnt.allBoardCnt}</span>
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
<!-- Details Post Section End -->

<c:import url="../layout/footer.jsp"/>