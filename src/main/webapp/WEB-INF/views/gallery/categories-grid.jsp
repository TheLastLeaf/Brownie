<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>팬아트 게시판<span>❤</span></h3>
                    <div class="bt-option">
                        <a href="#">인기글</a>
                        <a href="#">Latest posts</a>
                        <span>Hardware</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<style>
    .sub_photo li {
        float: left;
        position: relative;
        width: 240px;
        margin-right: 8px;
        margin-bottom: 30px;
        display: block;
    }

    .sub_photo li.last {
        margin-right: 0
    }

    .sub_photo li a strong {
        display: block;
        overflow: hidden;
        padding-right: 8px;
        white-space: nowrap;
        text-overflow: ellipsis;
        font-size: 14px;
    }

    .sub_photo li img {
        width: 240px;
        height: 160px;
    }

    .sub_photo p.thmb {
        margin-bottom: 3px
    }

    .sub_photo .tx_brief {
        margin-top: 2px;
        padding-right: 13px
    }

    .sub_photo .tx_brief a {
        color: #666
    }

    .paginate {
        padding: 16px 0 0;
        text-align: center;
    }

    .paginate a, .paginate strong {
        display: inline-block;
        position: relative;
        _width /**/: 17px;
        margin-right: 1px;
        padding: 2px 4px 3px;
        border: 1px solid #f5f2ed;
        color: #666;
        font-family: Verdana;
        font-size: 11px;
        font-weight: bold;
        line-height: normal;
        text-decoration: none
    }

    .paginate strong {
        border: 1px solid #928070;
        color: #f52d2d !important
    }

    .paginate .pre {
        margin-right: 6px;
        padding: 5px 6px 2px 14px;
        _padding-bottom: 1px;
        background: url(http://static.naver.com/common/paginate/bu_pg3_l_off.gif) no-repeat 6px 5px !important;
        letter-spacing: -1px
    }

    .paginate .next {
        margin-left: 4px;
        padding: 5px 14px 2px 6px;
        _padding-bottom: 1px;
        background: url(http://static.naver.com/common/paginate/bu_pg3_r_off.gif) no-repeat 62px 5px !important;
        letter-spacing: -1px
    }

    .paginate a.pre {
        background: url(http://static.naver.com/common/paginate/bu_pg3_l_on.gif) no-repeat 6px 6px !important
    }

    .paginate a.next {
        background: url(http://static.naver.com/common/paginate/bu_pg3_r_on.gif) no-repeat 33px 6px !important
    }

    .paginate .pre, .paginate .next {
        display: inline-block;
        position: relative;
        top: 0;
        _top: -2px;
        _width: 75px;
        border: 1px solid #b4b4b4;
        color: #ccc;
        font-family: '돋움', Dotum;
        font-size: 11px;
        line-height: normal
    }

    .paginate a.pre, .paginate a.next {
        color: #565656
    }

    .paginate a:hover {
        border: 1px solid #e9e9e9;
        color: #FFF;
        background-color: #939393 !important
    }

    .todayHot p.thmb {
        margin-bottom: 3px;
    }

    .todayHot li {
        float: left;
        position: relative;
        width: 240px;
        margin-right: 8px;
        margin-bottom: 30px;
        display: block;
    }

    .todayHot li.last {
        margin-right: 0
    }

    .todayHot li a strong {
        display: block;
        overflow: hidden;
        padding-right: 8px;
        white-space: nowrap;
        text-overflow: ellipsis;
        font-size: 14px;
    }

    .todayHot li img {
        width: 240px;
        height: 160px;
    }

    .todayHot p.thmb {
        margin-bottom: 3px
    }

    .todayHot .tx_brief {
        margin-top: 2px;
        padding-right: 13px
    }

    .todayHot .tx_brief a {
        color: #666
    }

    .gallery_notice {
        color: white;
        width: 1000px;
    }

    .gallery_notice th {
        border: 2px solid white;
        text-align: center;
    }

    .gallery_notice td {
        border: 2px solid white;
    }

</style>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
    <div class="container">
        <div class="notice"
             style="height: 200px; width: 1150px; border: 3px solid white;">
            <h3 style="color: white;">갤러리아 공지사항</h3>
            <table class="gallery_notice">
                <tr>
                    <th>분류</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                    <th>등록일</th>
                    <th>조회</th>
                    <th>추천</th>
                </tr>
                <tr>
                    <td>[공지]</td>
                    <td><a href="#"><strong>치타는 웃고있다. </strong></a></td>
                    <td>곽지훈</td>
                    <td>2014-01-28</td>
                    <td>12</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>[공지]</td>
                    <td><a href="#"><strong>고양인 울고있다.</strong></a></td>
                    <td>곽지훈</td>
                    <td>2014-01-28</td>
                    <td>12</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>[공지]</td>
                    <td><a href="#"><strong>강아진 짖고있다.</strong></a></td>
                    <td>곽지훈</td>
                    <td>2014-01-28</td>
                    <td>12</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>[공지]</td>
                    <td><a href="#"><strong>강아진 물리고있다.</strong></a></td>
                    <td>곽지훈</td>
                    <td>2014-01-28</td>
                    <td>12</td>
                    <td>3</td>
                </tr>

            </table>
        </div>
        <div class="todayHot" style="height: 300px; width: 1150px; border: 3px solid white;">
            <h3 style="color: white;">오늘의 붐업!</h3>
            <ul>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>움짤</span>
                    <div class="list_image"><img class="thumbnail" src="${path}/img/gallery/1.jpeg" alt=""></div>
                    </a>
                    </p> <a href="#"><strong>치타는 웃고있다.</strong></a>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>팬아트</span>
                    <div class="list_image"><img onmouseenter="zoomIn(event)" onmouseleave="zoomOut(event)"
                                                 src="${path}/img/gallery/2.jpg" alt=""></div>
                    </a>
                    </p> <a href="#"><strong>고양인 울고있다.</strong></a>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>팬아트</span>
                    <div class="list_image"><img src="${path}/img/gallery/3.jpg" alt=""></div>
                    </a>
                    </p> <a href="#"><strong>강아진 짖고있다.</strong></a>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>습작</span>
                    <div class="list_image"><img src="${path}/img/gallery/4.jpg" alt=""></div>
                    </a>
                    </p> <a href="#"><strong>강아진 물리고있다.</strong></a>
                </li>
            </ul>
        </div>
        <div>
            <select
                    onchange="location.href = INVEN.QueryMaker.getLink('https://www.inven.co.kr/board/lol/2775', 'come_idx->2775,category->' + this.value, 'remove->p,category2');"
                    style="display: inline; float: left;">
                <option value="">전체</option>
                <option value="장례식">장례식</option>
                <option value="자작">자작</option>
                <option value="연재">연재</option>
                <option value="퍼온글">퍼온글</option>
                <option value="기타">기타</option>
            </select> <a href="" class="" style="margin-left: 3px;">오늘의 화제</a> <a href=""
                                                                                  class="" style="margin-left: 3px;">인기만점</a>
            <a href="" class=""
               style="margin-left: 3px;">내가쓴글</a>
        </div>

        <div class="sub_photo" style="height: 700px; width: 1150px; border: 3px solid white;">
            <div class="title_area">
                <h4 class="hh_photo">
                    <strong class="blind">갤러리</strong>
                </h4>
            </div>
            <ul>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>움짤</span>
                    <div class="list_image"><img class="img-thumbnail" src="${path}/img/gallery/1.jpeg" alt=""></div>
                    </a>
                    </p> <a href="#"><strong>치타는 웃고있다.</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>팬아트</span> <img src="${path}/img/gallery/2.jpg" alt="">
                        </a>
                    </p> <a href="#"><strong>고양인 울고있다.</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>팬아트</span> <img src="${path}/img/gallery/3.jpg" alt="">
                        </a>
                    </p> <a href="#"><strong>강아진 짖고있다.</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>습작</span> <img src="${path}/img/gallery/4.jpg" alt="">
                        </a>
                    </p> <a href="#"><strong>강아진 물리고있다.</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>연재</span> <img src="${path}/img/gallery/5.gif" alt="">
                        </a>
                    </p> <a href="#"><strong>기립박수</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>연재</span> <img src="${path}/img/gallery/6.jpg" alt="">
                        </a>
                    </p> <a href="#"><strong>이색기야</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <li>
                    <p class="thmb">
                        <a href="#"> <span>연재</span> <img src="${path}/img/gallery/7.gif" alt="">
                        </a>
                    </p> <a href="#"><strong>도게자 박겠습니다</strong></a>
                    <p class="tx_brief">2014-01-28</p>
                </li>
                <!-- li가 게시판 1개글입니다 보일 갤러리 갯수만큼 li반복합니다.-->
            </ul>
        </div>
        <!-- 갤러리끝 -->
    </div>
    <div class="paginate">
        <a href="#"><span>1</span></a> <a href="#"><span>2</span></a> <a
            href="#"><span>3</span></a> <a href="#"><span>Next</span></a>
    </div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp"/>