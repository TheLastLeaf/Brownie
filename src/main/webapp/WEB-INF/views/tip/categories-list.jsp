<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>

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
        height: 300px;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .padding-top-50px {
        padding-top: 50px;
    }

    .padding-bottom-50px {
        padding-bottom: 50px;
    }

    .margin-left-auto {
        margin-left: auto;
    }

    .margin-right-auto {
        margin-right: auto;
    }
</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg search-section"
         data-setbg="${path}/img/tip/Annieversary_Nexus_Image_Optimized-1_d4lcnldtijc00k5n8gko.jpg">
    <div class="container-fluid search-box">
        <div class="container row margin-left-auto margin-right-auto">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text padding-top-50px padding-bottom-50px">
                    <h3>챔피언 선택</h3>
                    <div class="row champion-select overflow-auto">
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Aatrox.png" alt=""/>
                            <p>아트록스</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Ahri.png" alt=""/>
                            <p>아리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Akali.png" alt=""/>
                            <p>아칼리</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Alistar.png" alt=""/>
                            <p>알리스타</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Amumu.png" alt=""/>
                            <p>아무무</p>
                        </div>
                        <div class="col-sm-2 col-lg-1">
                            <img src="${path}/img/champion/Anivia.png" alt=""/>
                            <p>애니비아</p>
                        </div>
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
            <div class="col-lg-12 p-0">
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-1.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Reviews</span></div>
                        <h5><a href="#">Here's an hour of side-quests from The Outer Worlds...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-2.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Windows</span></div>
                        <h5><a href="#">Infinity Ward's focus isn't on battle royale, Call of...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-3.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Hardware</span></div>
                        <h5><a href="#">Capcom asks select fans to test new Resident Evil game</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-4.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Playstation</span></div>
                        <h5><a href="#">Teamfight Tactics is in chaos after today's patch...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-5.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Reviews</span></div>
                        <h5><a href="#">Republican politicians say videogames partly...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-6.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Windows</span></div>
                        <h5><a href="#">Borderlands 2 dev explains why there's mysterious boxes...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-7.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Hardware</span></div>
                        <h5><a href="#">Automachef and Wonder Boy among four free games...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img class="img-rounded tip-board-img-thumbnail" src="${path}/img/categories-list/cl-8.jpg"
                             alt="">
                    </div>
                    <div class="cl-text">
                        <div class="label"><span>Playstation</span></div>
                        <h5><a href="#">A new Borderlands 3 trailer introduces Moze and her...</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="pagination-item">
                    <a href="#"><span>1</span></a>
                    <a href="#"><span>2</span></a>
                    <a href="#"><span>3</span></a>
                    <a href="#"><span>Next</span></a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>