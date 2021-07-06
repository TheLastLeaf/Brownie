<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<fmt:formatDate value="${noticeVO.upDate}" type="date" var="update" pattern="yyyy-mm-dd hh:mm:ss" />
<script>
    $(function(){
        $('.reply-btn').click(function(){
            $('.reply').focus();
        });
    });
</script>
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
                                    <li>by <span>Admin</span></li>
                                    <li class="fa fa-clock-o">${update}</li>
                                    <li><span onclick="location.href='/notice/list'" style="color:#666666; cursor: pointer;">목록</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr style="width: auto; background-color: white;">
                        <h3>제목</h3>
                        <div class="dp-pic">
                            <img src="${pageContext.request.contextPath}/img/details/dp-p1.jpg" alt="">
                        </div>
                    </div>
                    <div class="dt-desc">
                            ${noticeVO.content}
                    </div>
                    <div class="dt-author" style="border: 1px solid #666666;">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <a href="/user">
                                <h5>
                                    ${noticeVO.inUserId}
                                </h5>
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <div class="innerBox text-right">
                                <form action="/notice/delete" method="post">
                                <input type="button" class="btn btn-outline-dark btn-sm"
                                               onclick="location.href='/notice/update?boardSeq=${noticeVO.boardSeq}'" style="color:white; cursor: pointer;"
                                               value="수정">
                                    <input type="hidden" value="${noticeVO.boardSeq}" name="boardSeq">
                                    <input type="submit" class="btn btn-outline-dark btn-sm" style="color:#c20000; cursor: pointer;" value="삭제" onclick="return confirm('이 게시물을 삭제하시겠습니까?')">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="dt-comment" style="margin-top: 5%;">
                    <c:if test="${reply eq 'reply'}">
                        <div>
                            <h4>REPLY</h4>
                            <div class="dc-item">
                                <div class="dc-pic">
                                    <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
                                </div>
                                <div class="dc-text">
                                    <h5>Brandon Kelley</h5>
                                    <span class="c-date">15 Aug 2017</span>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                        dolore magnam.</p>
                                    <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                                </div>
                            </div>
                            <div class="dc-item reply-item">
                                <div class="dc-pic">
                                    <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
                                </div>
                                <div class="dc-text">
                                    <h5>Brandon Kelley</h5>
                                    <span class="c-date">15 Aug 2017</span>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                        dolore magnam.</p>
                                    <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                                </div>
                            </div>
                            <div class="dc-item">
                                <div class="dc-pic">
                                    <img src="${pageContext.request.contextPath}/img/details/comment/comment-3.jpg" alt="">
                                </div>
                                <div class="dc-text">
                                    <h5>Matthew Nelson</h5>
                                    <span class="c-date">15 Aug 2017</span>
                                    <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                        adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                        dolore magnam.</p>
                                    <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                                </div>
                            </div>
                        </div>
                        <form action="/notice/detail">
                            <div class="input-list">
                                <input type="text" placeholder="REPLY" class="reply" style="width: 91%;">
                                <input type="submit" value="등록" style="width: 5%; padding-left: 5px;">
                            </div>
                        </form>
                        </c:if>
                            <div class="innerBox text-center pagination-item" style="padding-bottom: 2%;">
                                <a href="#"><span>Prev</span></a>
                                <a href="#"><span>1</span></a>
                                <a href="#"><span>2</span></a>
                                <a href="#"><span>3</span></a>
                                <a href="#"><span>Next</span></a>
                            </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="contact-text">
                                        <div class="contact-form">
                                            <div class="dt-leave-comment">
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
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>