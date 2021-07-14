<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:import url="../layout/header.jsp"/>
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
                              onclick="location.href='/notice/list?pageNum=${PagingVO.startPageNumber}'">Latest posts</span>
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
                       onclick="location.href='/notice/add'">
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
                <c:forEach var="noticeVO" items="${PagingVO.noticeVOList}">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img class="notice-img img-fluid"
                            <c:choose>
                            <c:when test="${fn:startsWith(noticeVO.imgSrc, '/')}">
                                 src="${pageContext.request.contextPath}${noticeVO.imgSrc}"
                            </c:when>
                            <c:otherwise>
                                 src="${noticeVO.imgSrc}"
                            </c:otherwise>
                            </c:choose>
                                 alt="">
                        </div>
                        <div class="cl-text">
                            <h5 class="title"><a
                                    href="${pageContext.request.contextPath}/notice/detail/${noticeVO.boardSeq}">${noticeVO.title}</a>
                            </h5>
                            <ul>
                                <li>by <span>${noticeVO.nickName}</span></li>
                            </ul>
                            <ul>
                                <p class="content-text con">${noticeVO.preview}</p>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <form>
                    <div class="innerBox text-center selectBox">
                        <form method="get">
                            <span>
                                <select name="notice" id="notice" class="notice">
                                    <option value="" selected="selected">선택</option>
                                    <option value="title">제목</option>
                                </select>
                                <input type="text" placeholder="검색" id="keyword" name="keyword" value="${keyword}"
                                       class="keyword"/>
                            </span>
                            <input type="submit" class="btn btn-outline-dark submit" value="조회">
                        </form>
                    </div>
                </form>
                <div class="innerBox text-center pagination-item">
                    <c:if test="${1 < PagingVO.startPageNumber}">
                        <a href="${pageContext.request.contextPath}/notice/list?pageNum=${PagingVO.startPageNumber - 1}"><span>Prev</span></a>
                    </c:if>
                    <c:forEach var="pageNumber" begin="${PagingVO.startPageNumber}" end="${PagingVO.endPageNumber}">
                        <a href="${pageContext.request.contextPath}/notice/list?pageNum=${pageNumber}&notice=${param.notice}&keyword=${param.keyword}"><span>${pageNumber}</span></a>
                    </c:forEach>
                    <c:if test="${PagingVO.endPageNumber < PagingVO.totalPageNumber}">
                        <a href="${pageContext.request.contextPath}/notice/list?pageNum=${PagingVO.endPageNumber + 1}"><span>Next</span></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp"/>