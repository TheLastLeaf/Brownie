<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../../layout/header.jsp"/>
<fmt:formatDate value="${boardVO.boardInDate}" type="both" var="indate" pattern="yyyy-MM-dd hh:mm:ss"/>
<style>
    .dt-desc {
        color: #666666;
    }
</style>
<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text typography-page">
                    <div class="dt-breadcrumb">
                        <div class="dt-bread-option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <span>Typography</span>
                        </div>
                        <div class="innerBox text-right">
                            <div class="details-hero-text">
                                <ul>
                                    <li>by <span>${boardVO.nickName}</span></li>
                                    <li>${indate}</li>
                                    <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                                    <li class="text-secondary cursor-pointer" onclick="location.href='/notice/list'">
                                        목록
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr class="w-auto bg-white">
                        <h4 class="text-secondary font-family-maple-bold">${boardVO.title}</h4>
                    </div>
                    <div class="dt-desc">
                        ${boardVO.content}
                    </div>
                    <div class="dt-author border">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <a href="/user/userInfo/${boardVO.boardUpUserId}">
                                <h5>
                                    ${boardVO.nickName}
                                </h5>
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <c:if test="${sessionScope.permit_level== 9}">
                                <div class="innerBox text-right">
                                    <form action="${pageContext.request.contextPath}/notice/delete" method="POST"
                                          class="d-inline">
                                        <input type="button" class="btn btn-outline-dark btn-sm text-white"
                                               onclick="location.href='/notice/modify/${boardVO.boardSeq}'"
                                               value="수정"/>
                                        <input type="hidden" name="boardSeq" value="${boardSeq}"/>
                                        <input type="submit" class="btn btn-outline-dark btn-sm text-danger"
                                               value="삭제"/>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <c:forEach items="${prevNextBoardVO}" var="boardVO">
                        <c:if test="${boardVO.boardSeq < boardSeq}">
                            <c:set var="prevBoardVO" value="${boardVO}"/>
                        </c:if>
                        <c:if test="${boardSeq < boardVO.boardSeq}">
                            <c:set var="nextBoardVO" value="${boardVO}"/>
                        </c:if>
                    </c:forEach>

                    <div class="dt-related-post">
                        <div class="row">

                            <!-- 이전 게시글 안내 -->
                            <div class="col-lg-6">
                                <c:if test="${prevBoardVO ne null}">
                                    <a href="./${prevBoardVO.boardSeq}"
                                       class="rp-prev">
                                        <span>Prev</span>
                                        <div class="rp-pic">
                                            <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png"
                                                 alt="">
                                        </div>
                                        <div class="rp-text">
                                            <h6>${prevBoardVO.title }</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${prevBoardVO.boardInDate}</li>
                                                <li><i class="far fa-comment"></i> ${prevBoardVO.replyCnt}
                                                </li>
                                            </ul>
                                        </div>
                                    </a>
                                </c:if>
                            </div>

                            <!-- 다음 게시글 안내 -->
                            <div class="col-lg-6">
                                <c:if test="${nextBoardVO ne null}">
                                    <a href="./${nextBoardVO.boardSeq}"
                                       class="rp-next">
                                        <span>Next</span>
                                        <div class="rp-pic">
                                            <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png"
                                                 alt="">
                                        </div>
                                        <div class="rp-text">
                                            <h6>${nextBoardVO.title }</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${nextBoardVO.boardInDate}</li>
                                                <li><i class="far fa-comment"></i> ${nextBoardVO.replyCnt}</li>
                                            </ul>
                                        </div>
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>