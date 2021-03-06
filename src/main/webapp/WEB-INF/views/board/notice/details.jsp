<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../../layout/header.jsp"/>
<style>
    .dt-desc {
        color: #666666;
    }

    .writerInfo {
        margin: 33px;
    }

    .writerInfoBox {
        height: 150px;
    }
    #title{
        color: whitesmoke !important;
    }
    #content > p{
        color: white !important;
    }
    .dt-desc{
        word-break: break-word;
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
                                    <li>${boardVO.boardInDateToString}</li>
                                    <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                                    <li class="text-secondary cursor-pointer" onclick="location.href='/notice/list'">
                                        목록
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr class="w-auto bg-white">
                        <h4 class="text-secondary font-family-maple-bold" id="title">${boardVO.title}</h4>
                    </div>
                    <div class="dt-desc" id="content">
                        ${boardVO.content}
                    </div>
                    <div class="dt-author border writerInfoBox">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}${boardVO.image}">
                        </div>
                        <div class="da-text writerInfo">
                            <a href="/user/info/${boardVO.boardUpUserId}">
                                <h5>
                                    ${boardVO.nickName}
                                </h5>
                            </a>
                            <c:if test="${sessionScope.id == boardVO.userId}">
                                <div class="innerBox text-right">
                                    <input type="button" class="btn btn-outline-dark btn-sm text-white"
                                           onclick="location.href='/notice/modify/${boardVO.boardSeq}'"
                                           value="수정"/>
                                    <input type="button" onclick='if(confirm("정말 삭제하시겠습니까?"))boardDelete(${boardSeq})'
                                           class="btn btn-outline-dark btn-sm text-danger" value="삭제"/>
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
                                                <li><i class="far fa-clock"></i> ${prevBoardVO.boardInDateToString}</li>
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
                                                <li><i class="far fa-clock"></i> ${nextBoardVO.boardInDateToString}</li>
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