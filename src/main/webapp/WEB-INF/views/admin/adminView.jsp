<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/nunu2.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3> </h3>
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

.adminMenu{
	cursor: pointer;
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
                                            	<c:when test="${dayMap.get('month') lt 10}">
		                                            <div class="review-point" style="top:55px;">
		                                                <div style="top: 60px;">${dayMap.get("month")}월</div>
		                                            </div>
	                                           </c:when>
                                            	<c:otherwise>
	                                            	<div class="review-point" style="top:55px; left: 25px;">
	                                                	<div style="top: 60px;">${dayMap.get("month")}월</div>
	                                            	</div>
	                                            </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>
                                <div class="or-text">
                                    <div class="" >
	                                    <div class="sidebar-option">
                    <div class="social-media">
                        <ul>
                            <li>
                                <div class="sm-icon"><i class="fas fa-pen-square"></i></div>
                                	<span class="adminMenu">게시판 관리</span>
                                <div class="follow">5개</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="far fa-user"></i></div>
                                	<a href="admin/adminMemberList"><span class="adminMenu">멤버 관리</span></a>
                                <div class="follow">${UserCnt.allUserCnt }명</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="fas fa-address-card"></i></div>
                                	<a href="admin/adminReportList"><span class="adminMenu">신고 내역</span></a>
                                <div class="follow">${reportCnt.reportUserCnt }건</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="far fa-circle"></i></div>
                                	<span class="adminMenu">블랙 리스트</span>
                                <div class="follow">52명</div>
                            </li>
                        </ul>
                    </div>
                </div>
                                    </div>
                                </div>
                            </div>
                            <div class="or-skill">
                                <div class="skill-item">
                                    <p>오늘의 방문자 수</p>
                                    <div id="bar-1" class="barfiller">
                                        <span class="fill" data-percentage="40"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">43</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 방문자 수</p>
                                    <div id="bar-2" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">12412</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>신규 가입자 수</p>
                                    <div id="bar-5" class="barfiller">
                                        <span class="fill" data-percentage="${UserCnt.recentUserCnt }"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point"> ${UserCnt.recentUserCnt }</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 가입자 수</p>
                                    <div id="bar-6" class="barfiller">
                                        <span class="fill" data-percentage="${UserCnt.allUserCnt }"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${UserCnt.allUserCnt }</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>신규 게시글 수</p>
                                    <div id="bar-3" class="barfiller">
                                        <span class="fill" data-percentage="${boardCnt.recentBoardCnt }"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${boardCnt.recentBoardCnt }</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 게시글 수</p>
                                    <div id="bar-4" class="barfiller">
                                        <span class="fill" data-percentage="${boardCnt.allBoardCnt }"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">${boardCnt.allBoardCnt }</span>
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