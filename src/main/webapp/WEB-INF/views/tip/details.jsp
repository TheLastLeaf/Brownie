<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../layout/header.jsp"/>
<!-- Details Hero Section Begin -->
<script>
    function commentReplyButton(replySeq) {
        $(".sub_reply_form").remove();

        const form =
            "<div class=\"dt-leave-comment sub_reply_form\">"
            + "<form method=\"POST\">"
            + "<input type=\"hidden\" name=\"headReplySeq\" value=\"" + replySeq + "\"/>"
            + "<textarea name=\"message\" placeholder=\"Message\" required></textarea>"
            + "<button type=\"submit\">Submit</button>"
            + "</form>"
            + "</div>"
        $("#" + replySeq).append(form);
    }

    function deleteReply(replySeq) {
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "${pageContext.request.contextPath}/tip/details/${boardSeq}/delete/" + replySeq;
        }
    }

    function boardLike(boardSeq, kind) {
        $.ajax({
            url: "/board/like/like.ajax",
            type: "POST",
            data: {
                boardSeq: boardSeq,
                kind: kind
            },
            dataType: "json",
            success: function (data) {
                if (data.status === "ng") {
                    alert(data.message);

                    return;
                }

                const likeButton = $(".board-like>.like");
                likeButton.html("<i class=\"far fa-thumbs-up\"></i> " + data.boardLikeCount.likeCnt);
                if (data.message === "1") {
                    likeButton.removeClass("btn-outline-primary").addClass("btn-primary");
                } else {
                    likeButton.addClass("btn-outline-primary").removeClass("btn-primary");
                }

                const unlikeButton = $(".board-like>.unlike");
                unlikeButton.html("<i class=\"far fa-thumbs-up fa-flip-vertical\"></i> " + data.boardLikeCount.unlikeCnt);
                if (data.message === "0") {
                    unlikeButton.removeClass("btn-outline-danger").addClass("btn-danger");
                } else {
                    unlikeButton.addClass("btn-outline-danger").removeClass("btn-danger");
                }
            },
            error: function () {
                alert("문제가 발생하였습니다.");
            }
        })
    }
</script>

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
                            <fmt:formatDate value="${boardVO.boardInDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
                            ${date}
                        </li>
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
                        <c:when test='${boardLikeVo != null and "1" eq boardLikeVo.kind}'>
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
                        <c:when test='${boardLikeVo != null and "0" eq boardLikeVo.kind}'>
                            btn-danger
                        </c:when>
                        <c:otherwise>
                            btn-outline-danger
                        </c:otherwise>
                    </c:choose>
                    btn-lg ml-3" onclick="boardLike(${boardSeq}, 0)"><i
                            class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}</button>
                    <c:if test="${sessionScope.id != null}">
                        <button type="button" class="btn btn-outline-light btn-lg ml-5"><i class="fas fa-bomb"></i>
                        </button>
                    </c:if>
                </div>

                <div class="dt-comment">
                    <h4>${boardVO.replyCnt} comment</h4>
                    <c:forEach var="replyVO" items="${replyPagingVO.replyVOList}">
                        <div id="${replyVO.replySeq}" class="dc-item"
                             style="margin-left: ${(replyVO.lv - 1) * 100}px;">
                            <div class="dc-pic">
                                <img src="/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>${replyVO.nickName}</h5>
                                <span class="c-date">${replyVO.replyInDate}</span>
                                <div class="float-right">
                                    <button type="button" class="btn btn-outline-primary mr-3"><i
                                            class="far fa-thumbs-up"></i> ${boardVO.likeCnt}</button>
                                    <button type="button" class="btn btn-outline-danger ml-3"><i
                                            class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}</button>
                                    <c:if test="${sessionScope.id != null}">
                                        <button type="button" class="btn btn-outline-light ml-5"><i
                                                class="fas fa-bomb"></i></button>
                                    </c:if>
                                </div>
                                <p>${replyVO.replyContent}</p>
                                <c:if test="${sessionScope.id ne null}">
                                    <a href="javascript:commentReplyButton(${replyVO.replySeq})"
                                       class="reply-btn position-relative ml-2 mb-2"><span>Reply</span></a>
                                </c:if>
                                <c:if test="${sessionScope.id eq replyVO.replyInUserId}">
                                    <a href="javascript:deleteReply(${replyVO.replySeq})"
                                       class="reply-btn position-relative ml-2 mb-2"><span>Delete</span></a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="pagination-item">
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
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>