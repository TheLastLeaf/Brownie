<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
<!--                 <div class="section-title" style=""> -->
<!--                   <h5>우리동네 소갈비살 1kg에 55,000원</h5> -->
<!--                  </div> -->
                <div class="details-text">
                    <div class="dt-quote">
                        <p>우리동네 소갈비살 1kg에 55,000원</p>
                    </div>
                    <div class="dt-desc">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua accusantium doloremque laudantium.</p>
                    </div>
                    <div class="dt-item">
                        <p>laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure Lorem ipsum dolor sit
                            amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
                            magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                            aliquip ex ea commodo consequat.</p>
                    </div>
                    <div class="dp-text">
                        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                            himenaeos. Mauris vel magna ex. Integer gravida tincidunt accumsan. Vestibulum nulla
                            mauris, condimentum id felis ac, volutpat volutpat mi. In vitae tempor velit of the
                            impenetrable foliage.</p>
                    </div>
                    <div class="dt-last-desc">
                        <p>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                            vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                            odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi
                            nesciunt tempora incidunt ut labore . Neque porro quisquam est, qui dolorem ipsum quia
                            dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi</p>
                    </div>
                    <div class="dt-tags">
                        <a href="#"><span>롤</span></a>
                        <a href="#"><span>히오스</span></a>
                        <a href="#"><span>AOS</span></a>
                        <a href="#"><span>FPS</span></a>
                    </div>
                    <div class="dt-share" style="justify-content: center; align-content: center; text-align: center;">
                        <div class="ds-links">
                            <a href="#" class="wide"><i class="fa fa-heart-o"></i><span>99+</span></a>
                        </div>
                        <div class="ds-title">싫어요</div>
                        <div class="ds-links">
                            <a href="#" class="wide"><i class="fa fa-heart"></i><span>99+</span></a>
                        </div>
                        <div class="ds-title">좋아요</div>
                    </div>
                    <div class="dt-related-post">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="#" class="rp-prev">
                                    <span>Prev</span>
                                    <div class="rp-pic">
                                        <img src="${path}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>이전글어쩌구</h6>
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
                                        <img src="${path}/img/mini_brownie_thumb.png" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>다음글어쩌구 게시글 순번으로 쿼리문 조회해</h6>
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
                            <h5>better</h5>
                            <p>허리펴 물마셔 목펴 눕고싶어 이 아래에 롤 티어 보여줘도 될듯</p>
                        </div>
                    </div>
                    <div class="dt-comment">
                        <h4>3 comment</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Smart HAK</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>코딩테스트 존나쉽죠?</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item reply-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-2.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>adorable Hyun-on</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>조카 애기들 귀여워</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${path}/img/details/comment/comment-3.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>세웅지훈포에버</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>우르르롹끼.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-leave-comment">
                        <h4>comment</h4>
                        <form action="#">
                            <textarea placeholder="Message"></textarea>
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                   <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of Best</h5>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-1" data-cpvalue="95"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point" style="text-align: center;">99+</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">여기는 추천수 두 자릿 수 이상 게시글</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-2" data-cpvalue="85"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">43</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">어제자 롤드컵 개쩌는장면</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-3" data-cpvalue="80"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">84</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">롤 개갓겜아니냐?</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-4" data-cpvalue="75"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">66</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">마라샹궈 먹고싶네</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>