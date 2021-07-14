<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<!-- 404 Section Begin -->
<section class="section-404">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-404">
                    <h1>500</h1>
                    <h3>Opps! Something Wrong.</h3>
                    <p>${exception.message}</p>
                    <form action="#" class="search-404">
                        <button type="button" onclick="history.go(-1);">
                            <span>뒤로가기</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 404 Section End -->

<!-- Latest Preview Section Begin -->
<section class="latest-preview-section page-404">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h5>Latest Preview</h5>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="lp-slider owl-carousel">
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-1.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Teamfight Tactics is in chaos after patch...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-2.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Lenovo’s y540 gaming laptop with an rtx 2060...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-3.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">A monter prom poster got hijacked for a...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-4.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Facebook wants to read your thoughts with...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-4.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Facebook wants to read your thoughts with...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-4.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Facebook wants to read your thoughts with...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="lp-item">
                        <div class="lp-pic set-bg" data-setbg="${pageContext.request.contextPath}/img/latest-preview/lp-4.jpg">
                            <div class="review-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                        <span class="circle-progress" data-cpid="id" data-cpvalue="75"
                                              data-cpcolor="#c20000"></span>
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lp-text">
                            <h6>
                                <a href="#">Facebook wants to read your thoughts with...</a>
                            </h6>
                            <ul>
                                <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                <li><i class="far fa-comment"></i> 12</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Preview Section End -->
<c:import url="../layout/footer.jsp"/>