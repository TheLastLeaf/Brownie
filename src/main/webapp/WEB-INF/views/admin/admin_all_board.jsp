<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>


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
                                            <div class="review-point" style="justify-content: center; align-content: center; text-align: center;">
                                                <div>6월</div>
                                                <span>이 달의 통계</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="or-text">
                                    <div class="" style="justify-content: center; align-content: center; text-align: center;">
	                                    <h5>[ 관리자 메뉴 ]</h5>
	                                    <p><a href="#">게시판 관리</a></p>
	                                    <p><a href="#">유저 관리</a></p>
	                                    <p><a href="#">신고 접수 목록</a></p>
	                                    <p><a href="#">블랙리스트</a></p>
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
                                        <span class="fill" data-percentage="20"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">5</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 가입자 수</p>
                                    <div id="bar-6" class="barfiller">
                                        <span class="fill" data-percentage="80"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">4253</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>신규 게시글 수</p>
                                    <div id="bar-3" class="barfiller">
                                        <span class="fill" data-percentage="78"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">78</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="skill-item">
                                    <p>누적 게시글 수</p>
                                    <div id="bar-4" class="barfiller">
                                        <span class="fill" data-percentage="85"></span>
                                        <div class="tipWrap" style="display: inline;">
                                            <span class="tip"></span>
                                            <span class="bar-point">1251</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="or-qualities">
                            <div class="qualities-item">
                                <p>뭔가 쓰고싶음</p>
                                <ul>
                                    <li><i class="fa fa-check"></i> 근데 쓸 게 없네</li>
                                    <li><i class="fa fa-check"></i> 무지성편집으로 남겨두겠음
                                    </li>
                                </ul>
                            </div>
                            <div class="qualities-item bad-item">
                                <p>진짜 쓰고싶단말이지?ㄴ</p>
                                <ul>
                                    <li><i class="fa fa-close"></i> 이것도 나중에 쓸거면 쓰셈</li>
                                    <li><i class="fa fa-close"></i> 근데 무슨 데이터가 들어갈지 나도 모르겠네]
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="or-rating">
                            <p><span>여기다가도 뭘 쓸지 ? </span> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>