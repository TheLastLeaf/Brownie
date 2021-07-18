<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../../layout/header.jsp"/>

<style>
    h5 {
        margin-top: 10px;
    }

    .actForReply, .actForBoard {
        font-size: 10px;
        margin-top: 3px;
        margin-bottom: 5px;
        justify-content: right;
        text-align: right;
    }

    .replyHate {
        border: 1px solid #336666;
        padding: 2px;
        cursor: pointer;
        margin: 3px;
        color: #336666;
    }

    .replyLike {
        border: 1px solid #ffffcc;
        padding: 2px;
        cursor: pointer;
        margin: 3px;
        color: #ffffcc;
    }

    .reReply {
        border: 1px solid #007bff;
        padding: 2px;
        cursor: pointer;
        margin: 3px;
        color: #007bff;
    }

    .replyCall, #freeModify, #freeDelete {
        border: 1px solid #DC143C;
        padding: 2px;
        cursor: pointer;
        margin: 3px;
        color: #DC143C;
    }

    .blackReplys {
        height: 5px;
        color: #5d5d5d;
        font-size: 12px;
        visibility: hidden;
    }

    .blackClick {
        font-size: 12px;
        color: #e57373;
    }

    .userReplys {
        font-size: 12px;
        word-break: break-word;
    }

    .blackReplysId {
        visibility: hidden;
    }


    .replyMod, .reReplyToUser {
        width: 100%;
        background-color: black;
        font-size: 12px;
        color: #666666;
    }

    .replyModArea, .reModComBut, .reReplyBox {
        display: none;
    }

    .modReplyBut {
        border: 1px solid #ffffff;
        padding: 2px;
        cursor: pointer;
        margin: 3px;
        color: #ffffff;
    }

    .reReplyBox {
        margin-bottom: 20px;
    }
</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <c:if test="${sessionScope.id eq boardVO.boardInUserId }">
                    <div class="actForBoard">
                        <form action="${pageContext.request.contextPath}/free/delete" method="POST"
                              class="d-inline">
                            <input type="button" class="btn btn-outline-dark btn-sm text-white"
                                   onclick="location.href='/free/modify/${boardVO.boardSeq}'"
                                   value="수정"/>
                            <input type="hidden" name="boardSeq" value="${boardSeq}"/>
                            <input type="submit" class="btn btn-outline-dark btn-sm text-danger"
                                   value="삭제"/>
                        </form>
                    </div>
                </c:if>
                <div class="details-text">
                    <div class="dt-quote">
                        <p>${boardVO.title }</p>
                    </div>
                    <div class="dp-text">
                        <p>${boardVO.content } </p>
                    </div>
                    <!-- 태그 -->
                    <div class="dt-tags">
                        <c:forTokens items="${boardVO.boardCategory }" delims="," var="tag">
                            <a href="#"><span>${tag }</span></a>
                        </c:forTokens>
                    </div>

                    <div class="dt-author">
                        <div class="da-pic">
                            <img src="/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <h5>${boardVO.nickName}</h5>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                    </div>

                    <!-- 좋아요 싫어요 -->
                    <div class="text-center board-like">
                        <button type="button" class="like btn
                    <c:choose>
                        <c:when test='${boardVO.likeKind != null and boardVO.likeKind eq "1"}'>
                            btn-primary
                        </c:when>
                        <c:otherwise>
                            btn-outline-primary
                        </c:otherwise>
                    </c:choose>
                    btn-lg mr-3" onclick="boardLike(${boardSeq}, 1)"><i class="far fa-thumbs-up"></i> ${boardVO.likeCnt}
                        </button>
                        <button type="button" class="unlike btn
                    <c:choose>
                        <c:when test='${boardVO.likeKind != null and boardVO.likeKind eq "0"}'>
                            btn-danger
                        </c:when>
                        <c:otherwise>
                            btn-outline-danger
                        </c:otherwise>
                    </c:choose>
                    btn-lg ml-3" onclick="boardLike(${boardSeq}, 0)"><i
                                class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}</button>
                        <c:if test="${sessionScope.id != null}">
                            <button type="button" class="btn btn-outline-light btn-lg ml-5"
                                    onclick="fn_report('${boardVO.boardUpUserId}','${boardVO.content}')"><i
                                    class="fas fa-bomb"></i>
                            </button>
                        </c:if>
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

                    <div class="dt-comment">
                        <h4>${boardVO.replyCnt} comment</h4>
                        <c:forEach var="replyVO" items="${replyPagingVO.replyVOList}">
                            <div id="${replyVO.replySeq}" class="dc-item"
                                 style="margin-left: ${(replyVO.lv - 1) * 100}px;">
                                <div class="dc-pic">
                                    <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg"
                                         alt="">
                                </div>
                                <div class="dc-text">
                                    <h5>${replyVO.nickName}</h5>
                                    <span class="c-date">${replyVO.replyInDate}</span>
                                    <div class="float-right">
                                        <button type="button" class="like btn
                                    <c:choose>
                                        <c:when test='${replyVO.likeKind != null and replyVO.likeKind eq "1"}'>
                                            btn-primary
                                        </c:when>
                                        <c:otherwise>
                                            btn-outline-primary
                                        </c:otherwise>
                                    </c:choose>
                                    mr-3" onclick="replyLike(${replyVO.replySeq}, 1)"><i
                                                class="far fa-thumbs-up"></i> ${replyVO.likeCnt}</button>
                                        <button type="button" class="unlike btn
                                    <c:choose>
                                        <c:when test='${replyVO.likeKind != null and replyVO.likeKind eq "0"}'>
                                            btn-danger
                                        </c:when>
                                        <c:otherwise>
                                            btn-outline-danger
                                        </c:otherwise>
                                    </c:choose>
                                    ml-3" onclick="replyLike(${replyVO.replySeq}, 0)"><i
                                                class="far fa-thumbs-up fa-flip-vertical"></i> ${replyVO.unlikeCnt}
                                        </button>
                                        <c:if test="${sessionScope.id != null}">
                                            <button type="button" class="btn btn-outline-light ml-5"
                                                    onclick="fn_report('${replyVO.replyUpUserId}','${replyVO.replyContent}')">
                                                <i
                                                        class="fas fa-bomb"></i></button>
                                        </c:if>
                                    </div>
                                    <p>${replyVO.replyContent}</p>
                                    <form action="${pageContext.request.contextPath}/tip/details/${boardSeq}/reply/delete"
                                          method="POST"
                                          onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                        <input type="hidden" name="replySeq" value="${replyVO.replySeq}"/>
                                        <c:if test="${sessionScope.id ne null and replyVO.lv < 3}">
                                            <button type="button" onclick="commentReplyButton(${replyVO.replySeq})"
                                                    class="reply-btn position-relative ml-3 mb-3"><span>Reply</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${sessionScope.id eq replyVO.replyInUserId}">
                                            <button type="submit"
                                                    class="reply-btn position-relative ml-3 mb-3"><span>Delete</span>
                                            </button>
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="pagination-item" style="justify-content: center; align-content: center; text-align: center;">
                            <c:if test="${1 < replyPagingVO.startPageNumber}">
                                <a href="?pageNum=${replyPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageNum" begin="${replyPagingVO.startPageNumber}"
                                       end="${replyPagingVO.endPageNumber}">
                                <a href="?pageNum=${pageNum}"><span>${pageNum}</span></a>
                            </c:forEach>
                            <c:if test="${replyPagingVO.endPageNumber < replyPagingVO.totalPageNumber}">
                                <a href="?pageNum=${replyPagingVO.endPageNumber + 1}"><span>Next</span></a>
                            </c:if>.
                        </div>
                    </div>
                    <c:if test="${sessionScope.id ne null}">
                        <div class="dt-leave-comment">
                            <h4>Leave a comment</h4>
                            <form method="POST">
                                <textarea name="message" placeholder="Message" required></textarea>
                                <button type="submit">Submit</button>
                            </form>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- 사이드바 시작 -->
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                    <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of Best</h5>
                        </div>

                        <%--                        <c:forEach var="freeFamousList" items="${freeFamousList }" varStatus="status">--%>

                        <%--                            <div class="bp-item">--%>
                        <%--                                <div class="bp-loader">--%>
                        <%--                                    <div class="loader-circle-wrap">--%>
                        <%--                                        <div class="loader-circle">--%>
                        <%--	                                            <span class="circle-progress-1" data-cpid="id-1"--%>
                        <%--                                                      data-cpvalue="${freeFamousList.likeCnt }"--%>
                        <%--                                                      data-cpcolor="#c20000"></span>--%>
                        <%--                                            <div class="review-point"--%>
                        <%--                                                 style="text-align: center;">${freeFamousList.likeCnt }</div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="bp-text">--%>
                        <%--                                    <h6>--%>
                        <%--                                        <a href="${pageContext.request.contextPath}/free/details/${freeFamousList.boardSeq}">${freeFamousList.title }</a>--%>
                        <%--                                    </h6>--%>
                        <%--                                    <ul>--%>
                        <%--                                        <li><i class="far fa-clock"></i>${freeFamousList.inDate }</li>--%>
                        <%--                                        <li><i class="far fa-comment"></i> 20</li>--%>
                        <%--                                    </ul>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </c:forEach>--%>

                    </div>
                </div>
            </div>
            <!-- 사이드바 끝 -->

        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>