<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<fmt:formatDate value="${noticeVO.upDate}" type="both" var="update" pattern="yyyy-MM-dd hh:mm:ss" />
<style>
    form{
        display: inline;
    }
    .list{
        color:#666666;
        cursor: pointer;
    }
    hr{
        width: auto;
        background-color: white;
    }
    .border{
        border: 1px solid white;
    }
    .modify{
        color:white;
    }
    .delete{
        color:#c20000;
    }
    .title{
        font-family: MapleBold;
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
                                    <li>by <span>${nickName}</span></li>
                                    <li>${update}</li>
                                    <li class="list" onclick="location.href='/notice/list'">목록</li>
                                </ul>
                            </div>
                        </div>
                        <hr>
                        <h4 class="title">${noticeVO.title}</h4>
<%--                        <div class="dp-pic">--%>
<%--                            <img src="${pageContext.request.contextPath}/img/details/dp-p1.jpg" alt="">--%>
<%--                        </div>--%>
                    </div>
                    <div class="dt-desc">
                            ${noticeVO.content}
                    </div>
                    <div class="dt-author border">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <a href="/user/userInfo?id=${noticeVO.inUserId}">
                                <h5>
                                    ${nickName}
                                </h5>
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <c:if test="${sessionScope.permit_level== 9}">
                                <div class="innerBox text-right">
                                        <input type="button" class="btn btn-outline-dark btn-sm modify"
                                                       onclick="location.href='/notice/update?boardSeq=${noticeVO.boardSeq}'"
                                                       value="수정" >
                                        <form action="/notice/delete" method="post">
                                            <input type="hidden" value="${noticeVO.boardSeq}" name="boardSeq">
                                            <input type="submit" class="btn btn-outline-dark btn-sm delete" value="삭제" onclick="return confirm('이 게시물을 삭제하시겠습니까?')">
                                        </form>
                                </div>
                            </c:if>
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