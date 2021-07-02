<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(function(){
        $('.reply-btn').click(function(){
            $('.reply').focus();
        });
    });
</script>
<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text typography-page">
                    <div class="dt-breadcrumb">
                        <div class="dt-bread-option">
                            <a href="${pageContext.request.contextPath}/index">Home</a>
                            <span>Typography</span>
                        </div>
                        <div class="innerBox text-right">
                            <div class="details-hero-text">
                                <ul>
                                    <li>by <span>Admin</span></li>
                                    <li class="fa fa-clock-o">Aug 01, 2019</li>
                                    <li><span onclick="location.href='/notice/list'" style="color:#666666; cursor: pointer;">목록</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <hr style="width: auto; background-color: white;">
                        <h3>제목</h3>
                        <div class="dp-pic">
                            <img src="${pageContext.request.contextPath}/img/details/dp-p1.jpg" alt="">
                        </div>
                    </div>
                    <div class="dt-desc">
                        <p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                            et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                        <p>Vestibulum commodo nulla eu augue tincidunt rutrum. Suspendisse interdum lacus in
                            ligula finibus luctus. Vivamus mollis libero vel orci finibus, sit amet malesuada
                            lectus aliquam. In auctor viverra eros. Maecenas elit mi, dictum et consectetur nec,
                            sollicitudin sed arcu.Curabitur tempor tempor pharetra.Sed imperdiet sem at nunc
                            luctus, sed cursus nulla mollis. Orci varius natoque penatibus et magnis dis
                            parturient montes, nascetur ridiculus mus porta tincidunt, purus enim laoreet.</p>
                        <p>Mauris ipsum libero, luctus non tempor sed, luctus nec dui. Cras ac ante quis neque
                            viverra mollis vel sed metus. Donec suscipit imperdiet neque, at euismod mauris
                            faucibus nec. Etiam varius ornare celerisque. Excepteur sint occaecat cupidatat non
                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum..</p>
                        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                            himenaeos. Mauris vel magna ex. Integer gravida tincidunt accumsan. Vestibulum nulla
                            mauris, condimentum id felis ac, volutpat volutpat mi. In vitae tempor velit of the
                            impenetrable foliage xcepteur sint occaecat cupidatat non proident.</p>
                        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                            himenaeos. Suspen potenti. Pellentesque massa enim, fringilla ut ullamcorper sit amet,
                            ornare at ipsum.</p>
                        <p>Proin rhoncus mauris arcu, vel rutrum quam dictum quis. Fusce aliquam magna dolor, non
                            efficitur metus semper nec. Vivamus ac elit at dui fermentum dapibus. Pellentesque
                            habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sed
                            diam id neque feugiat.</p>
                        <p>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                            vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                            odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi
                            nesciunt tempora incidunt ut labore . Neque porro quisquam est, qui dolorem ipsum quia
                        <p>Duis aute irure dolor inenim ad minim veniam, quis nostrud exercitation ullamco laboris
                            nisi ut aliquip ex ea commodo conslaboris nisi ut aliquip ex ea commodo consequat. Duis
                            aute irure Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore.</p>
                        <p>Integer vel commodo erat. Mauris dun fringilla eleifend lobortis. Aenean idas venenatis
                            ligula. Cras indo nibh facilisis, tincidunt quamto nec, fringilla neque. Morbi ornare in
                            nisi atc cond mentum. Interdum etc malesuada fames ate ipsum primis in faucibus. Nullam
                            sagitis et nulla sed posuere magna aliqua.</p>
                        <p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                            et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                            cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                    <div class="dt-author" style="border: 1px solid #666666;">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <a href="/user">
                                <h5>
                                    작성자
                                </h5>
                            </a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            <div class="innerBox text-right">
                                    <input type="button" class="btn btn-outline-dark btn-sm"
                                                   onclick="location.href='/notice/update'" style="color:white; cursor: pointer;"
                                                   value="수정">
                                <form action="/notice/delete" method="post">
                                    <input type="submit" class="btn btn-outline-dark btn-sm" style="color:#c20000; cursor: pointer;" value="삭제">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="dt-comment" style="margin-top: 5%;">
                        <h4>REPLY</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                            </div>
                        </div>
                        <div class="dc-item reply-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Brandon Kelley</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                            </div>
                        </div>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-3.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Matthew Nelson</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
                                    adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
                                    dolore magnam.</p>
                                <span class="reply-btn" style="color: white; cursor: pointer">Reply</span>
                            </div>
                            <div class="innerBox text-center pagination-item" style="padding-bottom: 2%;">
                                <a href="#"><span>Prev</span></a>
                                <a href="#"><span>1</span></a>
                                <a href="#"><span>2</span></a>
                                <a href="#"><span>3</span></a>
                                <a href="#"><span>Next</span></a>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="contact-text">
                                        <div class="contact-form">
                                            <div class="dt-leave-comment">
                                                <form action="/notice/detail">
                                                    <div class="input-list">
                                                        <input type="text" placeholder="REPLY" class="reply" style="width: 91%;">
                                                        <input type="submit" value="등록" style="width: 5%; padding-left: 5px;"></input>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>