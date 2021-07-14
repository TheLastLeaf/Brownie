<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<style>
    .tip-board-img-thumbnail {
        height: 116px;
    }

    .search-section {
        padding-top: 75px;
        padding-bottom: 75px;
    }

    .search-section > .search-box {
        background-color: rgba(0, 0, 0, 0.5);
    }

    .search-section > .search-box .champion-select {
        height: 300px;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .padding-top-30px {
        padding-top: 30px;
    }

    .padding-bottom-30px {
        padding-bottom: 30px;
    }

    .margin-left-auto {
        margin-left: auto;
    }

    .margin-right-auto {
        margin-right: auto;
    }

    .overflow-x-hidden {
        overflow-x: hidden;
    }

    .text-nowrap-overflow-ellipsis-hidden {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    #search_champions {
        width: 100%;
        height: 46px;
        font-size: 14px;
        color: #eaeaea;
        background-color: rgba(0, 0, 0, 0.5);
        border: 1px solid #464646;
        padding-left: 15px;
        margin-bottom: 20px;
        -webkit-transform: skewX(-15deg);
        -ms-transform: skewX(-15deg);
        transform: skewX(-15deg);
    }

    #search_champions::-webkit-input-placeholder {
        color: #eaeaea;
        -webkit-transform: skewX(15deg);
        transform: skewX(15deg);
    }

    #search_champions::-moz-placeholder {
        color: #eaeaea;
        -webkit-transform: skewX(15deg);
        transform: skewX(15deg);
    }

    #search_champions:-ms-input-placeholder {
        color: #eaeaea;
        -webkit-transform: skewX(15deg);
        -ms-transform: skewX(15deg);
        transform: skewX(15deg);
    }

    #search_champions::-ms-input-placeholder {
        color: #eaeaea;
        -webkit-transform: skewX(15deg);
        -ms-transform: skewX(15deg);
        transform: skewX(15deg);
    }

    #search_champions::placeholder {
        color: #eaeaea;
        -webkit-transform: skewX(15deg);
        -ms-transform: skewX(15deg);
        transform: skewX(15deg);
    }
</style>
<script>
    $(function () {
        $("#search_champions").on("keyup", function () {
            const league_of_legends_champion = $(".league-of-legends-champion");
            league_of_legends_champion.hide();
            league_of_legends_champion.each(function () {
                if ($(this).find("p").html().includes($("#search_champions").val())) {
                    $(this).show();
                }
            });
        })
    })
</script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg search-section"
         data-setbg="${pageContext.request.contextPath}/img/tip/Annieversary_Nexus_Image_Optimized-1_d4lcnldtijc00k5n8gko.jpg">
    <div class="container-fluid search-box">
        <div class="container margin-left-auto margin-right-auto text-center">
            <div class="breadcrumb-text padding-top-30px padding-bottom-30px">
                <h3>챔피언 선택</h3>
                <div class="row">
                    <div class="col-8"></div>
                    <div class="col-4">
                        <input id="search_champions" class="text-center" type="text" placeholder="챔피언 이름을 입력하세요."/>
                    </div>
                </div>
                <div class="row champion-select overflow-auto overflow-x-hidden rounded">
                    <div class="col-sm-2 col-lg-1 league-of-legends-champion">
                        <a href="${pageContext.request.contextPath}/tip/list">
                            <img src="https://ddragon.leagueoflegends.com/cdn/11.14.1/img/profileicon/29.png"
                                 alt=""/>
                            <p class="text-nowrap-overflow-ellipsis-hidden">전체</p>
                        </a>
                    </div>
                    <c:forEach var="champion" items="${leagueOfLegendsChampionsVOList}">
                        <div class="col-sm-2 col-lg-1 league-of-legends-champion">
                            <a href="?champion=${champion.id}">
                                <img src="http://ddragon.leagueoflegends.com/cdn/${champion.version}/img/champion/${champion.imageFull}"
                                     alt=""/>
                                <p class="text-nowrap-overflow-ellipsis-hidden">${champion.name}</p>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Categories list Section Begin -->
<section class="categories-list-section spad">
    <div class="container">
        <div class="pagination-item d-flex flex-row-reverse">
            <a href="${pageContext.request.contextPath}/tip/write"><span>글쓰기</span></a>
        </div>
        <div class="row">
            <div class="col-lg-12 p-0">
                <c:forEach var="tipVO" items="${tipPagingVO.tipVOList}">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img class="img-rounded tip-board-img-thumbnail"
                                 src="${tipVO.imgSrc}"
                                 alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>${tipVO.boardCategory}</span></div>
                            <h5>
                                <a href="${pageContext.request.contextPath}/tip/details/${tipVO.boardSeq}">${tipVO.title}</a>
                            </h5>
                            <ul>
                                <li>by <span>${tipVO.nickName}</span></li>
                                <li><i class="far fa-clock"></i> ${tipVO.inDate}</li>
                                <li><i class="far fa-comment"></i> ${tipVO.replyCnt}</li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
                <div class="pagination-item">
                    <c:choose>
                        <c:when test="${champion eq null || champion eq ''}">
                            <c:set var="paginationLink" value="?currentPageNumber="/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="paginationLink" value="?champion=${champion}&currentPageNumber="/>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${1 < tipPagingVO.startPageNumber}">
                        <a href="${paginationLink}${tipPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                    </c:if>
                    <c:forEach var="pageNumber" begin="${tipPagingVO.startPageNumber}"
                               end="${tipPagingVO.endPageNumber}">
                        <a href="${paginationLink}${pageNumber}"><span>${pageNumber}</span></a>
                    </c:forEach>
                    <c:if test="${tipPagingVO.endPageNumber < tipPagingVO.totalPageNumber}">
                        <a href="${paginationLink}${tipPagingVO.endPageNumber + 1}"><span>Next</span></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp"/>
