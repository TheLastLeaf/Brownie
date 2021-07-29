<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/nunu.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>멤버 목록</h3>
                    <div>
                        <a href="/admin" style="color: #ffffff;">[돌아가기]</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<style>
    .UserPageBottom {
        padding-top: 50px;
    }
</style>
<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12"
                 style="justify-content: center; align-content: center; text-align: center; color:white;">
                <div class="">
                    <table border="1px solid #d2d2d2" style="margin: auto; width: 100%; cursor: default;">
                        <tr>
                            <th>아이디</th>
                            <th>롤 닉네임</th>
                            <th>브라우니 닉네임</th>
                            <th>브라우니 레벨</th>
                            <th>가입일자</th>
                            <th>권한 레벨</th>
                            <th>상태</th>
                        </tr>
                        <c:forEach var="userList" items="${UserPagingVO.userVOList}" varStatus="status">
                            <tr>
                                <th onclick="location.href='/user/info/${userList.userId}'"
                                    style="cursor: pointer">${userList.userId }</th>
                                <th>${userList.lolId }</th>
                                <th>${userList.nickName }</th>
                                <th>Lv. ${userList.userLevel }</th>
                                <th>${userList.inDate }</th>
                                <th>${userList.permitLevel }</th>
                                <c:set var="userStatus" value="${userList.status }"/>
                                <c:choose>
                                    <c:when test="${userStatus eq 'Y'}">
                                        <th>활동</th>
                                    </c:when>
                                    <c:when test="${userStatus eq 'N'}">
                                        <th>탈퇴</th>
                                    </c:when>
                                    <c:when test="${userStatus eq 'B'}">
                                        <th>정지</th>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="UserPageBottom">
                        <div class="pagination-item">
                            <c:if test="${1 < UserPagingVO.startPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminMemberList?pageNum=${UserPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageNumber" begin="${UserPagingVO.startPageNumber}"
                                       end="${UserPagingVO.endPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminMemberList?pageNum=${pageNumber}"><span>${pageNumber}</span></a>
                            </c:forEach>
                            <c:if test="${UserPagingVO.endPageNumber < UserPagingVO.totalPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminMemberList?pageNum=${UserPagingVO.endPageNumber + 1}"><span>Next</span></a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>