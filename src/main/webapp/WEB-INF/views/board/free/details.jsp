<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../../layout/header.jsp"/>
<script>
    function fn_report(Seq) {
        if(${boardVO.userId} == ${sessionScope.id}){
            alert("본인이 작성한 글은 신고할 수 없습니다.")
            return false;
        }
        window.open("/report/write?Seq=" + Seq , "REPORT", "width=660, height=500, left=250,top=200");
    }
    function fn_replyReport(Seq,boardSeq,userId) {
        if(userId == ${sessionScope.id}){
            alert("본인이 작성한 댓글은 신고할 수 없습니다.")
            return false;
        }
        window.open("/replyReport/write?Seq=" + Seq + "&boardSeq=" + boardSeq , "REPORT", "width=660, height=500, left=250,top=200");
    }
</script>

<style>
    h5 {
        margin-top: 10px;
    }

    .reply {
        color: #c4c4c4 !important;
    }

    .writerInfo {
        margin: 33px;
    }

    .writerInfoBox {
        height: 150px;
    }
</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <c:if test="${sessionScope.id eq boardVO.boardInUserId}">
                    <div class="actForBoard">
                        <input type="button" class="btn btn-outline-dark btn-sm text-white"
                               onclick="location.href='/free/modify/${boardVO.boardSeq}'"
                               value="수정"/>
                        <input type="button" onclick='if(confirm("정말 삭제하시겠습니까?"))boardDelete(${boardSeq})'
                               class="btn btn-outline-dark btn-sm text-danger" value="삭제"/>
                    </div>
                </c:if>
                <div class="details-text">
                    <div class="dt-quote">
                        <p>${boardVO.title}</p>
                    </div>
                    <div class="dp-text">
                        <p>${boardVO.content} </p>
                    </div>
                    <!-- 태그 -->
                    <div class="dt-tags">
                        <c:forTokens items="${boardVO.boardCategory}" delims="," var="tag">
                            <a href="#"><span>${tag}</span></a>
                        </c:forTokens>
                    </div>

                    <div class="dt-author writerInfoBox">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}${boardVO.image}">
                        </div>
                        <div class="da-text writerInfo">
                            <a href="/user/info/${boardVO.boardInUserId}"><h5>${boardVO.nickName}</h5></a>
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
                    btn-lg ml-3" onclick="boardLike(${boardSeq}, 0)">
                            <i class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}
                        </button>
                        <c:if test="${sessionScope.id != null}">
                            <button type="button" class="btn btn-outline-light btn-lg ml-5"
                                    onclick="fn_report(${boardVO.boardSeq})"><i
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
                                            <h6>${prevBoardVO.title}</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${prevBoardVO.boardInDateToString}</li>
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
                                            <h6>${nextBoardVO.title}</h6>
                                            <ul>
                                                <li><i class="far fa-clock"></i> ${nextBoardVO.boardInDateToString}</li>
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
                                    <img src="${pageContext.request.contextPath}${replyVO.image}"
                                         alt="">
                                </div>
                                <div class="dc-text">
                                    <a href="/user/info/${replyVO.replyInUserId}"><h5>${replyVO.nickName}</h5></a>
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
                                                    onclick="fn_replyReport(${replyVO.replySeq},${boardVO.boardSeq},'${replyVO.userId}')">
                                                <i class="fas fa-bomb"></i>
                                            </button>
                                        </c:if>
                                    </div>
                                    <p>${replyVO.replyContent}</p>
                                    <form>
                                        <c:if test="${sessionScope.id ne null and replyVO.lv < 3}">
                                            <button type="button"
                                                    onclick="commentReplyButton(${boardSeq}, ${replyVO.replySeq})"
                                                    class="reply-btn position-relative ml-3 mb-3"><span>Reply</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${sessionScope.id eq replyVO.replyInUserId}">
                                            <button type="button"
                                                    onclick='if(confirm("정말 삭제하시겠습니까?"))replyDelete(${boardSeq}, ${replyVO.replySeq})'
                                                    class="reply-btn position-relative ml-3 mb-3"><span>Delete</span>
                                            </button>
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="pagination-item"
                             style="justify-content: center; align-content: center; text-align: center;">
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
                        <div class="dt-leave-comment main_reply_form">
                            <h4>Leave a comment</h4>
                            <form>
                                <textarea name="replyContent" placeholder="Message" required class="reply"></textarea>
                                <button type="button" onclick="replyWrite(${boardSeq})">Submit</button>
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
                        <c:forEach var="boardVOOrderByLike" items="${boardVOListOrderByLike}" varStatus="status">
                            <div class="bp-item">
                                <div class="bp-loader">
                                    <div class="loader-circle-wrap">
                                        <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-1"
                                                  data-cpvalue="${boardVOOrderByLike.likeCnt}"
                                                  data-cpcolor="#c20000"></span>
                                            <div class="review-point"
                                                 style="text-align: center;">${boardVOOrderByLike.likeCnt}</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="bp-text">
                                    <h6>
                                        <a href="${pageContext.request.contextPath}/free/details/${boardVOOrderByLike.boardSeq}">${boardVOOrderByLike.title}</a>
                                    </h6>
                                    <ul>
                                        <li><i class="far fa-clock"></i>${boardVOOrderByLike.boardInDateToString}</li>
                                        <li><i class="far fa-comment"></i> ${boardVOOrderByLike.replyCnt}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- 사이드바 끝 -->
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>