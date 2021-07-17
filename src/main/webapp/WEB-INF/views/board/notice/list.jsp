<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../../layout/header.jsp"/>
<style>
    .notice-img {
        width: 195px;
        height: 130px;
    }

    .cl-item .cl-text h5 {
        margin-bottom: 8px;
        margin-top: 4px;
    }

    .cl-text {
        margin-top: 4px;
        height: 130px;
    }

    .cl-text > .content-text {
        display: block;
        text-overflow: ellipsis;
        width: auto;
        height: 100px;
    }

    .spad {
        padding-top: 150px;
        padding-bottom: 120px;
        height: 400px;
    }

    .cate-spad {
        padding-top: 50px;
        padding-bottom: 50px;
    }

    .main {
        color: white;
        cursor: pointer;
    }

    .last-post {
        color: red;
        cursor: pointer;
    }

    .notiadd {
        color: white;
    }

    .hr {
        background-color: white;
        width: 76%;
    }

    .selectBox {
        padding-bottom: 3%;
    }

    .notice {
        margin-top: 1px;
        height: 30px;
        background: black;
        color: #666666;
    }

    .keyword {
        background: black;
        height: 31px;
        color: #666666;
    }

    .submit {
        color: #666666;
        height: 33px;
        font-size: 15px;
    }

    .slash {
        color: #666666;
    }

    .title {
        color: white;
        font-family: MapleLight;
    }

    .con {
        font-family: MapleLight;
    }

    .margin-le {
        margin-left: 83.5%;
    }

    .margin-bot {
        margin-bottom: 2%;
    }

    .margin-p {
        margin-left: 77%;
    }
</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/Ari.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>공지사항</h3>
                    <div>
                        <span class="main" onclick="location.href='/index'">Home</span>
                        <span class="slash"> / </span>
                        <span class="last-post"
                              onclick="location.href='/notice/list?pageNum=${boardPagingVO.startPageNumber}'">Latest posts</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Categories list Section Begin -->
<section class="categories-list-section cate-spad">
    <c:choose>
        <c:when test="${sessionScope.id ne null and sessionScope.permit_level == 9}">
            <div class="margin-le">
                <input type="button" class="btn btn-outline-dark btn-sm notiadd" value="글쓰기"
                       onclick="location.href='/notice/write'">
            </div>
        </c:when>
        <c:otherwise>
            <div class="margin-p">
                <p class="notiadd">관리자만 등록할 수 있습니다.</p>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="margin-bot">
        <hr class="innerBox text-center hr">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <c:forEach var="boardVO" items="${boardPagingVO.boardVOList}">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img class="notice-img img-fluid"
                            <c:choose>
                            <c:when test="${fn:startsWith(boardVO.imgSrc, '/')}">
                                 src="${pageContext.request.contextPath}${boardVO.imgSrc}"
                            </c:when>
                            <c:otherwise>
                                 src="${boardVO.imgSrc}"
                            </c:otherwise>
                            </c:choose>
                                 alt="">
                        </div>
                        <div class="cl-text">
                            <h5 class="title"><a
                                    href="${pageContext.request.contextPath}/notice/details/${boardVO.boardSeq}">${boardVO.title}</a>
                            </h5>
                            <ul>
                                <li>by <span>${boardVO.nickName}</span></li>
                                <li><i class="far fa-clock"></i> ${boardVO.boardInDate}</li>
                                <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                            </ul>
                            <p class="content-text con"
                               style="overflow: hidden; text-overflow: ellipsis; white-space:nowrap;">${boardVO.preview}</p>
                        </div>
                    </div>
                </c:forEach>
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