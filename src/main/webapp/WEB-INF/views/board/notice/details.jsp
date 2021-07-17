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
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../../layout/footer.jsp"/>