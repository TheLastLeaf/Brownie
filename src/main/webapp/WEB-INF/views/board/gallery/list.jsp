<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../../layout/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marvel.css" type="text/css">


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" style="height: 500px; padding-top:200px;"
         data-setbg="${pageContext.request.contextPath}/img/gallery/main/main${randomImageNumber}.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text text-center">
                    <h3>
                        <div class="breadcrumb-text">
                            <h1 data-heading="Brownie  Gallery" style="z-index: 5">
									<span data-heading="Brownie  Gallery" contenteditable>
										Brownie  Gallery </span>
                            </h1>
                            <span onclick="fn_click()" id="mouseC"><i class="fas fa-camera fa-3x"></i></span>
                            <div class="bt-option"></div>
                        </div>
                    </h3>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<style>
    .gallery_notice {
        color: black;
        width: 100%;
        background: white;
    }

    .gallery_notice th {
        border: 2px solid white;
        text-align: center;
    }

    .gallery_notice td {
    }

    .gallery_hr {
        background-color: white;
        width: 100%;
        text-align: center;
    }

    #preview {
        z-index: 9998;
        position: absolute;
        border: 0px solid #ccc;
        background: #333;
        padding: 1px;
        display: none;
        color: #fff;
    }

    #mouseC {
        z-index: 9999;
        visibility: hidden;
    }

    .lef {
        margin-left: 30px;
    }

</style>
<script>
    var flag = false;

    function fn_click() {
        flag = true;
        //var base = $('.fas');
        //base.addClass('fa-spin');
        $("#mouseC").css("position", "absolute");
        $("#mouseC").css("visibility;", "visible");
    }

    $(document).ready(
        function () {
            $(document).on(
                "mousemove",
                function (e) { //마우스 이동시
                    if (flag) {
                        $("#mouseC")
                            .css("top", (e.pageY - 365) + "px")
                            .css("left", (e.pageX - 325) + "px");
                    }
                });
            var xOffset = 10;
            var yOffset = 30;

            var mxOffset = 0;
            var myOffset = 0;

            $(document).on(
                "mouseover",
                ".thumbnail",
                function (e) { //마우스 오버시
                    $("body").append(
                        "<p id='preview'><img src='"
                        + $(this).attr("data-setbg")
                        + "' width='400px' /></p>"); //보여줄 이미지를 선언
                    $("#preview")
                        .css("top", (e.pageY - xOffset) + "px")

                        .css("left", (e.pageX + yOffset) + "px")

                        .fadeIn("fast"); //미리보기 화면 설정 셋팅
                });

            $(document).on(
                "mousemove",
                ".thumbnail",
                function (e) { //마우스 이동시
                    $("#preview")
                        .css("top", (e.pageY - xOffset) + "px")
                        .css("left", (e.pageX + yOffset) + "px");

                });

            $(document).on("mouseout", ".thumbnail", function () { //마우스 아웃시
                $("#preview").remove();

            });

        });
</script>
<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">

                <div class="row">
                    <div class="col-lg-12">
                        <hr class="gallery_hr">
                        <h3 class="text-white">이주의 베스트</h3>
                    </div>

                    <c:forEach var="boardVO" items="${hitBoardPagingVO.boardVOList}">
                        <div class="col-lg-3">
                            <div class="cg-item">
                                <div class="cg-pic set-bg thumbnail"
                                     data-setbg="${boardVO.imgSrc}">
                                    <c:if test='${boardVO.boardCategory != null and boardVO.boardCategory != ""}'>
                                        <div class="label">
                                            <span>${boardVO.boardCategory}</span>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="cg-text">
                                    <h5>
                                        <a href="#">${boardVO.title}</a>
                                    </h5>
                                    <ul>
                                        <li>by <span>${boardVO.nickName}</span></li>
                                        <li><i class="far fa-clock"></i> ${boardVO.boardInDateToString}</li>
                                        <li><i class="far fa-comment"></i> ${boardVO.replyCnt}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <div class="col-lg-12">
                        <hr class="gallery_hr">
                        <c:if test="${sessionScope.id ne null}">
                    </div>
                    <div class="col-lg-12">
                        <div class="pagination-item d-flex flex-row-reverse">
                            <a href="${pageContext.request.contextPath}/gallery/write"><span>Write</span></a>
                        </div>
                        <hr class="gallery_hr">
                        </c:if>
                        <h3 class="text-white">전체 글</h3>
                    </div>
                    <div class="col-lg-12 p-0">
                        <c:forEach var="boardVO" items="${boardPagingVO.boardVOList}">
                            <div class="col-lg-2">
                                <div class="cg-item">
                                    <div class="cg-pic set-bg thumbnail"
                                         data-setbg="${boardVO.imgSrc}"
                                         onclick="location.href='${pageContext.request.contextPath}/gallery/details/${boardVO.boardSeq}'">
                                        <c:if test='${boardVO.boardCategory != null and boardVO.boardCategory != ""}'>
                                            <div class="label">
                                                <span>${boardVO.boardCategory}</span>
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="cg-text">
                                        <h5>
                                            <a href="${pageContext.request.contextPath}/gallery/details/${boardVO.boardSeq}">${boardVO.title}</a>
                                        </h5>
                                        <ul>
                                            <li>by <span>${boardVO.nickName}</span></li>
                                            <li><i class="far fa-clock"></i> ${boardVO.boardInDateToString}</li>
                                            <li><i class="fas fa-eye"></i> ${boardVO.hitCnt}</li>
                                            <li><i class="far fa-comment"></i> ${boardVO.replyCnt}</li>
                                            <li><i class="far fa-thumbs-up"></i> ${boardVO.likeCnt}</li>
                                            <li><i class="far fa-thumbs-up fa-flip-vertical"></i> ${boardVO.unlikeCnt}
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>


                    <hr class="gallery_hr">

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
        </div>
    </div>
</section>
<c:import url="../../layout/footer.jsp"/>