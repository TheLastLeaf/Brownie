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
</script>

<section class="details-hero-section set-bg"
         data-setbg="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${tipVO.boardCategory}_0.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="details-hero-text">
                    <div class="label"><span>${tipVO.boardCategory}</span></div>
                    <h3>${tipVO.title}</h3>
                    <ul>
                        <li>by <span>${tipVO.nickName}</span></li>
                        <li>
                            <i class="far fa-clock"></i>
                            <fmt:formatDate value="${tipVO.inDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
                            ${date}
                        </li>
                        <li><i class="far fa-comment"></i> ${tipVO.replyCnt}</li>
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
                    ${tipVO.content}
                </div>
                <div class="dt-author">
                    <div class="da-pic">
                        <img src="/img/details/author-pic.jpg" alt="">
                    </div>
                    <div class="da-text">
                        <h5>${tipVO.nickName}</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                </div>
                <div class="dt-comment">
                    <h4>${tipVO.replyCnt} comment</h4>
                    <c:forEach var="tipReplyVO" items="${tipReplyPagingVO.tipReplyVOList}">
                        <div id="${tipReplyVO.replySeq}" class="dc-item"
                             style="margin-left: ${(tipReplyVO.lv - 1) * 100}px;">
                            <div class="dc-pic">
                                <img src="/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>${tipReplyVO.nickName}y</h5>
                                <span class="c-date">${tipReplyVO.inDate}</span>
                                <p>${tipReplyVO.replyContent}</p>
                                <c:if test="${sessionScope.id ne null}">
                                    <a href="javascript:commentReplyButton(${tipReplyVO.replySeq})"
                                       class="reply-btn d-inline-block"><span>Reply</span></a>
                                </c:if>
                                <c:if test="${sessionScope.id eq tipReplyVO.inUserId}">
                                    <a href="/tip/details/${board_seq}/delete/${tipReplyVO.replySeq}"
                                       class="reply-btn d-inline-block"><span>Delete</span></a>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="pagination-item">
                        <c:if test="${1 < tipReplyPagingVO.startPageNumber}">
                            <a href="?currentReplyPageNumber=${tipReplyPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                        </c:if>
                        <c:forEach var="pageNumber" begin="${tipReplyPagingVO.startPageNumber}"
                                   end="${tipReplyPagingVO.endPageNumber}">
                            <a href="?currentReplyPageNumber=${pageNumber}"><span>${pageNumber}</span></a>
                        </c:forEach>
                        <c:if test="${tipReplyPagingVO.endPageNumber < tipReplyPagingVO.totalPageNumber}">
                            <a href="?currentReplyPageNumber=${tipReplyPagingVO.endPageNumber + 1}"><span>Next</span></a>
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