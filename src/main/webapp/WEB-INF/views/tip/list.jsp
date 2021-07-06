<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<style>
    .tip-board-img-thumbnail {
        height: 116px;
    }

    .search-section {
        padding-top: 100px;
        padding-bottom: 100px;
    }

    .search-section > .search-box {
        background-color: rgba(0, 0, 0, 0.5);
    }

    .search-section > .search-box .champion-select {
        height: 400px;
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
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg search-section"
         data-setbg="${pageContext.request.contextPath}/img/tip/Annieversary_Nexus_Image_Optimized-1_d4lcnldtijc00k5n8gko.jpg">
    <div class="container-fluid search-box">
        <div class="container margin-left-auto margin-right-auto text-center">
            <div class="breadcrumb-text padding-top-30px padding-bottom-30px">
                <h3>챔피언 선택</h3>
                <div class="row champion-select overflow-auto overflow-x-hidden rounded">
                    <c:forEach var="champion" items="${leagueOfLegendsChampionsVOList}">
                        <div class="col-sm-2 col-lg-1">
                            <a href="?champion=${champion.id}">
                                <img src="http://ddragon.leagueoflegends.com/cdn/11.13.1/img/champion/${champion.imageFull}"
                                     alt=""/>
                                <p class="text-nowrap" style="overflow: hidden; text-overflow: ellipsis;">${champion.name}</p>
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
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-1.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Ahri</span></div>
                        <h5><a href="#">브론즈 4 0LP가 알려주는 "아리"란?</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-2.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Aatrox</span></div>
                        <h5><a href="#">챔피언 폭을 늘려보자. 서폿 아트로 다이아가기</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-3.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Akali</span></div>
                        <h5><a href="#">야, 너도 "아칼리"하면 이길 수 있어.</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-4.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Alistar</span></div>
                        <h5><a href="#">롤은 팀게임! 이상혁이 전하는 "오더형 미드라이너"의 현실</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-5.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Amumu</span></div>
                        <h5><a href="#">똥템보다 똥덜싸는 탑무무 공략</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-6.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Anivia</span></div>
                        <h5><a href="#">시즌 11 비주류 애니비아 (몰라서 대처하기 힘든) 팁</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-7.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Annie</span></div>
                        <h5><a href="#">요즘 누가 애니하나요? 네 제가 합니다.</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail"
                             src="${pageContext.request.contextPath}/img/categories-list/cl-8.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Aphelios</span></div>
                        <h5><a href="#">개사기캐 씹0티어 숨겨져있지도 않은 아펠리오스 공략과 대처법</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                            <li><i class="far fa-comment"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="pagination-item">
                    <a href="?currentPageNumber=1"><span>Prev</span></a>
                    <a href="?currentPageNumber=1"><span>1</span></a>
                    <a href="?currentPageNumber=2"><span>2</span></a>
                    <a href="?currentPageNumber=3"><span>3</span></a>
                    <a href="?currentPageNumber=4"><span>4</span></a>
                    <a href="?currentPageNumber=5"><span>5</span></a>
                    <a href="?currentPageNumber=6"><span>Next</span></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp"/>