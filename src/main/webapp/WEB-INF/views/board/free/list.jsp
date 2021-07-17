<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/ariwitheveryone.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>자유게시판</h3>
                    <div>
                        <%--                 <c:if test="${sessionScope.id ne null} "> --%>
                        <a href="${pageContext.request.contextPath}/free/write" style="color: #ffffff;">[글쓰기]</a>
                        <%--                 </c:if> --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Categories list Section Begin -->
<section class="categories-list-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <c:forEach var="boardVO" items="${boardPagingVO.boardVOList}" varStatus="status">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png"
                                 style="height: 70px;" alt="">
                        </div>
                        <div class="cl-text">
                            <h5>
                                <a href="${pageContext.request.contextPath}/free/details/${boardVO.boardSeq}">${boardVO.title}</a>
                            </h5>
                            <ul>
                                <li>by <span>${boardVO.nickName}</span></li>
                                <li><i class="far fa-clock"></i> ${boardVO.boardInDate}</li>
                                <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                                <li><i class="far fa-comment"></i> ${boardVO.replyCnt}</li>
                                <li><i class="far fa-thumbs-up"></i> ${boardVO.likeCnt}</li>
                                <li><i class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}</li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="col-lg-4 col-md-7 p-0">
                <div class="sidebar-option">
                    <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of Best</h5>
                        </div>

                        <%--                        <c:forEach var="freeFamousList" items="${freeFamousList}" varStatus="status">--%>

                        <%--                            <div class="bp-item">--%>
                        <%--                                <div class="bp-loader">--%>
                        <%--                                    <div class="loader-circle-wrap">--%>
                        <%--                                        <div class="loader-circle">--%>
                        <%--	                                            <span class="circle-progress-1" data-cpid="id-1"--%>
                        <%--                                                      data-cpvalue="${freeFamousList.likeCnt}"--%>
                        <%--                                                      data-cpcolor="#c20000"></span>--%>
                        <%--                                            <div class="review-point"--%>
                        <%--                                                 style="text-align: center;">${freeFamousList.likeCnt}</div>--%>
                        <%--                                        </div>--%>
                        <%--                                    </div>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="bp-text">--%>
                        <%--                                    <h6>--%>
                        <%--                                        <a href="${pageContext.request.contextPath}/free/details/${freeFamousList.boardSeq}">${freeFamousList.title}</a>--%>
                        <%--                                    </h6>--%>
                        <%--                                    <ul>--%>
                        <%--                                        <li><i class="far fa-clock"></i>${freeFamousList.inDate}</li>--%>
                        <%--                                        <li><i class="far fa-comment"></i> 20</li>--%>
                        <%--                                    </ul>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                        <%--                        </c:forEach>--%>

                    </div>
                </div>
            </div>

            <div class="col-lg-12" style="justify-content: center; align-content: center; text-align: center;">
                <div class="board-search" style="margin-bottom: 30px;">
                    <select name="type"
                            style="border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;">
                        <option value="title"
                                <c:if test='${type ne null and type eq "title"}'>
                                    selected
                                </c:if>
                        >제목
                        </option>
                        <option value="content"
                                <c:if test='${type ne null and type eq "content"}'>
                                    selected
                                </c:if>
                        >내용
                        </option>
                        <option value="nickName"
                                <c:if test='${type ne null and type eq "nickName"}'>
                                    selected
                                </c:if>
                        >작성자
                        </option>
                    </select>
                    <input type="text" name="query"
                           style="width: 200px; border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;"
                           placeholder="search"
                           value="${query}"/>
                    <input type="button" onclick="searchList()"
                           style="border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;"
                           value="search"/>
                </div>
                <div class="pagination-item">
                    <c:choose>
                        <c:when test='${type eq null || type eq "" || query eq null || query eq ""}'>
                            <c:set var="paginationLink" value="?pageNum="/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="paginationLink" value="?type=${type}&query=${query}&pageNum="/>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${1 < boardPagingVO.startPageNumber}">
                        <a href="${paginationLink}${boardPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                    </c:if>
                    <c:forEach var="pageNum" begin="${boardPagingVO.startPageNumber}"
                               end="${boardPagingVO.endPageNumber}">
                        <a href="${paginationLink}${pageNum}"><span>${pageNum}</span></a>
                    </c:forEach>
                    <c:if test="${boardPagingVO.endPageNumber < boardPagingVO.totalPageNumber}">
                        <a href="${paginationLink}${boardPagingVO.endPageNumber + 1}"><span>Next</span></a>
                    </c:if>
                </div>
            </div>

        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../../layout/footer.jsp"/>