<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marvel.css" type="text/css">


<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" style="height: 500px; padding-top:200px;"
         data-setbg="${pageContext.request.contextPath}/img/gallery/main/main${rnd}.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">

                <div class="breadcrumb-text" style="text-align: center">
                    <h3>
                        <div class="breadcrumb-text">
                            <h3>
                                <h1 data-heading="Brownie  Gallery" style="z-index: 5">
									<span data-heading="Brownie  Gallery" contenteditable>
										Brownie  Gallery </span>
                                </h1>
                                <span onclick="fn_click()" id="mouseC"><i class="fas fa-camera fa-3x"></i></span>
                            </h3>
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
                        <h3 style="color: white;">팬아트 공지사항</h3>
                        <br/><br/><br/>
                        <table class="table text-center text-white">
                            <tr>
                                <th>분류</th>
                                <th>제목</th>
                                <th>글쓴이</th>
                                <th>등록일</th>
                                <th>조회</th>
                                <th>추천</th>
                            </tr>
                            <c:forEach var="noticeVO" items="${noticeVOList}">
                                <tr>
                                    <td>[공지]</td>
                                    <td class="text-left"><a class="lef"
                                                             href="${pageContext.request.contextPath}/gallery/detail?boardSeq=${noticeVO.boardSeq}"><strong>${noticeVO.title}</strong></a>
                                    </td>
                                    <td>${noticeVO.inUserId}</td>
                                    <td>${noticeVO.inDate}</td>
                                    <td>${noticeVO.subSeq}</td>
                                    <td>${noticeVO.love}</td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>


                    <div class="col-lg-12">
                        <hr class="gallery_hr">
                        <h3 style="color: white;">오늘의 히트!</h3>
                        <br/><br/><br/>
                    </div>


                    <div class="col-lg-3">
                        <div class="cg-item">
                            <div class="cg-pic set-bg thumbnail"
                                 data-setbg="${pageContext.request.contextPath}/img/gallery/1.jpeg">
                                <div class="label">
                                    <span>웃긴짤</span>
                                </div>
                            </div>
                            <div class="cg-text">
                                <h5>
                                    <a href="#">치타는 웃고있다.</a>
                                </h5>
                                <ul>
                                    <li>by <span>${galleryVO.inUserId}</span></li>
                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                    <li><i class="far fa-comment"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="cg-item">
                            <div class="cg-pic set-bg thumbnail"
                                 data-setbg="${pageContext.request.contextPath}/img/gallery/2.jpg">
                                <div class="label">
                                    <span>귀여운짤</span>
                                </div>
                            </div>
                            <div class="cg-text">
                                <h5>
                                    <a href="#">고양인 울고있다.</a>
                                </h5>
                                <ul>
                                    <li>by <span>Admin</span></li>
                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                    <li><i class="far fa-comment"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="cg-item">
                            <div class="cg-pic set-bg thumbnail"
                                 data-setbg="${pageContext.request.contextPath}/img/gallery/funny39.JPG">
                                <div class="label">
                                    <span>귀여운짤</span>
                                </div>
                            </div>
                            <div class="cg-text">
                                <h5>
                                    <a href="#">강아진 짖고있다.</a>
                                </h5>
                                <ul>
                                    <li>by <span>Admin</span></li>
                                    <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                    <li><i class="far fa-comment"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3">
                        <div class="cg-item">
                            <div class="cg-pic set-bg thumbnail"
                                 data-setbg="${pageContext.request.contextPath}/img/gallery/sanak-20.jpg">
                                <div class="label">
                                    <span></span>
                                </div>
                            </div>
                            <div class="cg-text">
                                <h5>
                                    <a href="#">왜안떠</a>
                                </h5>
                                <ul>
                                    <li>by <span></span></li>
                                    <li><i class="fa fa-clock-o"></i></li>
                                    <li><i class="fa fa-comment-o">조회수</i> 20</li>
                                    <li><i class="fa fa-comment-o">추천수</i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <hr class="gallery_hr">
                    </div>

                    <div class="col-lg-12">

                        <select style="color: black; display: inline; float: left;">
                            <option value="">전체</option>
                            <option value="일러스트">일러스트</option>
                            <option value="카툰">카툰</option>
                            <option value="짤">짤</option>
                            <option value="장례식">장례식</option>
                            <option value="기타">기타</option>
                        </select>
                        <a href="" class="" style="margin-left: 3px;">오늘의 화제</a>
                        <a href="" class="" style="margin-left: 3px;">인기만점</a>
                        <a href="" class="" style="margin-left: 3px;">내가쓴글</a>
                        <input style="float: right; color: black;" type="button" value="글쓰기"
                               onclick="location.href='gallery/add'">
                    </div>

                    <div class="col-lg-12">
                        <hr class="gallery_hr">
                    </div>

                    <c:forEach var="galleryVO" items="${galleryVOList.content}">

                        <div class="col-lg-2">
                            <div class="cg-item">
                                <div class="cg-pic set-bg thumbnail"
                                     data-setbg="${pageContext.request.contextPath}${galleryVO.fileSeq}"
                                     onclick="location.href='${pageContext.request.contextPath}/gallery/detail?boardSeq=${galleryVO.boardSeq}'">
                                    <div class="label">
                                        <span>${galleryVO.boardCategory}</span>
                                    </div>
                                </div>
                                <div class="cg-text">
                                    <h5>
                                        <a href="${pageContext.request.contextPath}/gallery/detail?boardSeq=${galleryVO.boardSeq}">${galleryVO.title}</a>
                                    </h5>
                                    <ul>
                                        <li><span>${galleryVO.inUserId}</span></li>
                                        <li><i class="far fa-clock"></i> ${galleryVO.inDate} </li>
                                        <li><i class="far fa-comment">조회</i> ${galleryVO.subSeq}</li>
                                        <li><i class="far fa-comment">추천</i> ${galleryVO.love}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                    </c:forEach>


                    <hr class="gallery_hr">

                    <div class="col-lg-12" style="text-align: center;">
					<span> <select name="gallery"
                                   style="height: 30px; background: white; color: black;">
							<option value="" selected="selected">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
					</select> <input type="text" value=""
                                     style="background: black; color: #666666">
					</span> <input id="keyword" type="button" class="btn btn-outline-dark" value="조회"
                                   style="color: #666666">
                    </div>

                    <br/><br/><br/>

                    <c:if test="${galleryVOList.hasArticles()}">
                        <div class="innerBox text-center pagination-item col-lg-12">
                            <c:if test="${galleryVOList.startPage>5}">
                                <a href="/gallery/list?pageNum=${galleryVOList.startPage-5}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageno" begin="${galleryVOList.startPage}"
                                       end="${galleryVOList.endPage}">
                                <a href="/gallery/list?pageNum=${pageno}"><span>${pageno}</span></a>
                            </c:forEach>
                            <c:if test="${galleryVOList.endPage<galleryVOList.totalPages}">
                                <a href="/gallery/list?pageNum=${galleryVOList.startPage+5}"><span>Next</span></a>
                            </c:if>
                        </div>
                    </c:if>

                </div>
            </div>
            <!-- 갤러리끝 -->
        </div>
    </div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>