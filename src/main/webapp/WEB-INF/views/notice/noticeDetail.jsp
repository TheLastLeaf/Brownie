<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<fmt:formatDate value="${noticeVO.upDate}" type="both" var="update" pattern="yyyy-MM-dd hh:mm:ss" />
<style>
    form{
        display: inline;
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
                                    <li>by <span>${nickName}</span></li>
                                    <li>${update}</li>
                                    <li onclick="location.href='/notice/list'" style="color:#666666; cursor: pointer;">목록</li>
                                </ul>
                            </div>
                        </div>
                        <hr style="width: auto; background-color: white;">
                        <h3>${noticeVO.title}</h3>
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
                            <a href="/user/userInfo?id=${id}">
                                <h5>
                                    ${nickName}
                                </h5>
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <div class="innerBox text-right">
                                    <c:if test="${id eq noticeVO.inUserId or level== 9}">
                                    <input type="button" class="btn btn-outline-dark btn-sm"
                                                   onclick="location.href='/notice/update?boardSeq=${noticeVO.boardSeq}'" style="color:white; cursor: pointer;"
                                                   value="수정" >
                                    <form action="/notice/delete" method="post">
                                        <input type="hidden" value="${noticeVO.boardSeq}" name="boardSeq">
                                        <input type="submit" class="btn btn-outline-dark btn-sm" style="color:#c20000; cursor: pointer;" value="삭제" onclick="return confirm('이 게시물을 삭제하시겠습니까?')">
                                    </form>
                                    </c:if>
                            </div>
                        </div>
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