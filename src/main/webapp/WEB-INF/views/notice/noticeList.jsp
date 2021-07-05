<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<style>
    .notice-img{
        height: 130px;
    }
    .cl-item .cl-text h5 {
        margin-bottom: 8px;
        margin-top: 4px;
    }
    .cl-text{
        margin-top: 4px;
        height: 130px;
    }
    .cl-text > .content-text{
        display: block;
        text-overflow: ellipsis;
        width: auto;
        height: 100px;
    }
    .spad{
        padding-top: 150px;
        padding-bottom: 100px;
    }
    .cate-spad{
        padding-top: 50px;
        padding-bottom: 50px;
    }

</style>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/Ari.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>공지사항</h3>
                    <div class="">
                        <span onclick="location.href='/index'" style="color: white; cursor: pointer;">Home</span>
                        <span style="color: #666666"> / </span>
                        <span onclick="location.href='/index'" style="color: red; cursor: pointer;">Latest posts</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

    <!-- Categories list Section Begin -->
    <section class="categories-list-section cate-spad">
        <div style="margin-left: 83.5%;  ">
            <input type="button" class="btn btn-outline-dark btn-sm" value="글쓰기" style="color: white;" onclick="location.href='/notice/add'">
        </div>
        <div style="margin-bottom: 2%">
            <hr class="innerBox text-center" style="background-color: white; width: 76%;">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-0">
                    <c:forEach var="noticeVO" items="${noticeVOList.content}">
                        <div class="cl-item">
                            <div class="cl-pic">
                                <img class="notice-img" src="${pageContext.request.contextPath}/img/categories-list/cl-1.jpg" alt="">
                            </div>
                            <div class="cl-text">
                                <h5><a href="${pageContext.request.contextPath}/notice/detail?boardSeq=${noticeVO.boardSeq}">${noticeVO.title}</a></h5>
                                <ul>
                                    <li>by <span>${noticeVO.inUserId}</span></li>
                                </ul>
                                <p class="content-text">${noticeVO.content}</p>
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
                        <div class="innerBox text-center" style="padding-bottom: 3%;">
                            <form method="get">
                                    <span>
                                        <select name="notice" id="notice" style="height:30px; background: black; color: #666666;">
                                            <option value="" selected="selected">선택</option>
                                            <option value="title" <c:if test="${notice=='title'}">selected</c:if>>제목</option>
                                            <option value="content" <c:if test="${notice=='content'}">selected</c:if>>내용</option>
                                            <option value="inUserId" <c:if test="${notice=='inUserId'}">selected</c:if>>작성자</option>
                                        </select>
                                        <input type="text" placeholder="검색" id="keyword" name="keyword" value="" style="background: black; color: #666666" onclick="document.getElementById('spanKeyword').value='';"/>
                                        <span id="spanKeyword"></span>
                                    </span>
                                     <input type="submit" class="btn btn-outline-dark" value="조회" style="color: #666666">
                            </form>
                        </div>
                    </form>
                    <c:if test="#{noticeVOList.hasArticles()}">
                        <div class="pagination-item">
                            <c:if test="${noticeVOList.startPage>5}">
                                <a href="/notice/list?pageNum=${noticeVOList.startPage-5}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageno" begin="${noticeVOList.startPage}" end="${noticeVOList.endPage}">
                                <a href="/notice/list?pageNum=${pageno}"><span>${pageno}</span></a>
                            </c:forEach>
                            <c:if test="${noticeVOList.startPage>5}">
                                <a href="/notice/list?pageNum=${noticeVOList.startPage+5}"><span>Next</span></a>
                            </c:if>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp"/>