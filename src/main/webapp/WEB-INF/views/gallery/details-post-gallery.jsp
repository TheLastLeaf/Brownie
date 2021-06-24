<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp"/>
<!-- Details Gallery Section Begin -->
<div class="details-gallery-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="dg-slider owl-carousel">
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/1.jpeg"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/2.jpg"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/3.jpg"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/4.jpg"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/5.gif"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/6.jpg"></div>
                    <div class="dg-item set-bg" data-setbg="${path}/img/gallery/7.gif"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Details Gallery Section End -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <div class="details-text gallery-page">
                    <div class="dt-title-gallery details-hero-text">
                        <h1 style="color: white">안녕하세요 !!! 씨파아아아ㅏ</h1>
                    </div>
                    <div class="dt-desc">
                        <p>앞서 영국에서 발견된 알파 변이 등 보다 전염속도가 높은 델타 변이는 인도는 물론이고 영국에서도 지배종이 됐다.

                            델타 바이러스는 이 외에도 러시아, 포르투갈, 일본, 중국 등 전 세계 11개국에서 발견됐다.

                            최근 미국에서도 델타 변이 확진자 비중이 급속히 증가하면서, 미국 보건 당국은 국내 방역의 가장 큰 위협이 '델타 변이'가 될 것으로 보고 있다.

                            앤서니 파우치 미국 국립알레르기·전염병연구소(NIAID) 소장은 델타 변이 확진자는 신규확진자 가운데 20%에 달한다고 발표했다.

                            한편, 인도보건당국은 22일(현지시간) 델타 플러스 변이가 보고됐다고 발표했다. 기존 델타 변이보다 전염력이 강한 '델타 플러스 변이'가 확산할 경우 백신 배포에도
                            불구하고 확진자 수가 폭증할 위험이 있다고 외신은 전했다.

                            라제시 부샨 인도 보건‧가족부 차관은 기자회견을 열고 "델타 플러스 변이는 기존 델타 변이에 비해 전파력이 강해서 각 주에서 코로나19 감염 검사는 물론이고 백신
                            접종수를 늘리기 위해 노력해야 한다"고 밝혔다.

                            델타 변이 바이러스는 특히 백신을 아직 맞지 않은 젊은 이들을 사이에서 더 빨리 번지는 것으로 나타났다.

                            이처럼 델타 변이가 확산하고 있지만, 백신을 접종한다면 감염의 우려는 피할 수 있다는 지적도 나오고 있다. 옥스퍼드대 연구진과 잉글랜드 공중보건국(PHE)도 조사에
                            따르면 아스트라제네카와 화이자 두 백신이 델타 변이에 90% 이상 효과를 보인 것으로 나타났다.</p>
                    </div>

                    <div class="dt-tags">
                        <a href="#"><span>Gaming</span></a>
                        <a href="#"><span>Platform</span></a>
                        <a href="#"><span>Playstation</span></a>
                        <a href="#"><span>Hardware</span></a>
                    </div>

                    <div class="dt-related-post">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="#" class="rp-prev">
                                    <span>Prev</span>
                                    <div class="rp-pic">
                                        <img src="${path}/img/details/prev.jpg" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>The Real-Estate Developers Are the Enemy</h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <a href="#" class="rp-next">
                                    <span>Next</span>
                                    <div class="rp-pic">
                                        <img src="${path}/img/details/next.jpg" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>Montreal real estate: Bargains in cottage countrya</h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-author">
                        <div class="da-pic">
                            <img src="${path}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <h5>Almil Hmaper</h5>
                            <p>글쓴이 소개</p>

                        </div>
                    </div>
                    <div class="dt-comment">
                        <h4>3 comment</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item reply-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-2.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-3.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Matthew Nelson</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-leave-comment">
                        <h4>Leave a comment</h4>
                        <form action="#">
                            <div class="input-list">
                                <input type="text" placeholder="Name">
                                <input type="text" placeholder="Email">
                                <input type="text" placeholder="Website">
                            </div>
                            <textarea placeholder="Message"></textarea>
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>