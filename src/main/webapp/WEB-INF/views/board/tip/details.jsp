<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../../layout/header.jsp"/>
<style>
    .skewXButton {
        display: inline-block;
        padding: 4px 12px 4px 12px;
        background: #252525;
        -webkit-transform: skewX(-10deg);
        -ms-transform: skewX(-10deg);
        transform: skewX(-10deg);
        position: absolute;
        right: 6px;
        top: 0;
    }

    .skewXButton span {
        -webkit-transform: skewX(10deg);
        -ms-transform: skewX(10deg);
        transform: skewX(10deg);
        display: inline-block;
        font-size: 12px;
        color: #ffffff;
        font-weight: 500;
        text-transform: uppercase;
    }
</style>

<script>
    function fn_report(userId, log) {
        if(userId == ${sessionScope.id}){
            alert("본인이 작성한 글은 신고할 수 없습니다.")
            return false;
        }
        window.open("/report/write?userId=" + userId + "&log=" + log, "REPORT", "width=660, height=500, left=250,top=200");
    }
</script>

<!-- Details Hero Section Begin -->
<section class="details-hero-section set-bg"
         data-setbg="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${boardVO.boardCategory}_0.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-6" style="background-color: rgba(0, 0, 0, 0.75);">
                <div class="details-hero-text m-5">
                    <div class="label"><span>${boardVO.boardCategory}</span></div>
                    <h3>${boardVO.title}</h3>
                    <ul>
                        <li>by <span>${boardVO.nickName}</span></li>
                        <li>
                            <i class="far fa-clock"></i>
                            ${boardVO.boardInDateToString}
                        </li>
                        <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                        <li><i class="far fa-comment"></i> ${boardVO.replyCnt}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Hero Section End -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="p-0">
            <div class="details-text">
                <div class="dt-desc">
                    ${boardVO.content}
                    <c:if test="${sessionScope.id != null and sessionScope.id == boardVO.boardInUserId}">
                        <div class="d-flex flex-row-reverse">
                            <form>
                                <input type="hidden" name="boardSeq" value="${boardSeq}"/>
                                <button type="button" onclick="location.href='/tip/modify/${boardSeq}'"
                                        class="skewXButton position-relative ml-3 mb-3"><span>Modify</span>
                                </button>
                                <button type="button" class="skewXButton position-relative ml-3 mb-3"
                                        onclick='if(confirm("정말 삭제하시겠습니까?"))boardDelete(${boardSeq})'>
                                    <span>Delete</span>
                                </button>
                            </form>
                        </div>
                    </c:if>
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
                                        <h6>${nextBoardVO.title }</h6>
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
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
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
                                            class="far fa-thumbs-up fa-flip-vertical"></i> ${replyVO.unlikeCnt}</button>
                                    <c:if test="${sessionScope.id != null}">
                                        <button type="button" class="btn btn-outline-light ml-5"
                                                onclick="fn_report('${replyVO.replyUpUserId}','${replyVO.replyContent}')">
                                            <i
                                                    class="fas fa-bomb"></i></button>
                                    </c:if>
                                </div>
                                <p>${replyVO.replyContent}</p>
                                <c:if test="${sessionScope.id ne null and replyVO.lv < 3}">
                                    <button type="button" onclick="commentReplyButton(${boardSeq}, ${replyVO.replySeq})"
                                            class="reply-btn position-relative ml-3 mb-3"><span>Reply</span>
                                    </button>
                                </c:if>
                                <c:if test="${sessionScope.id eq replyVO.replyInUserId}">
                                    <button type="button" onclick='if(confirm("정말 삭제하시겠습니까?"))replyDelete(${boardSeq}, ${replyVO.replySeq})'
                                            class="reply-btn position-relative ml-3 mb-3"><span>Delete</span>
                                    </button>
                                </c:if>
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
                        </c:if>
                    </div>
                </div>
                <c:if test="${sessionScope.id ne null}">
                    <div class="dt-leave-comment main_reply_form">
                        <h4>Leave a comment</h4>
                        <form>
                            <textarea name="replyContent" placeholder="Message" required></textarea>
                            <button type="button" onclick="replyWrite(${boardSeq})">Submit</button>
                        </form>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>