<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="path" value="${pageContext.request.contextPath}"/>

<c:import url="../layout/header.jsp"><c:param name="path" value="${path}"/></c:import>
<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <div class="details-text typography-page">
                    <div class="dt-breadcrumb">
                        <div class="dt-bread-option">
                            <a href="#">Home</a>
                            <span>Typography</span>
                        </div>
                        <h3>TYPOGRAPHY</h3>
                    </div>
                    <div class="dt-desc">
                        <p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                            et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                    </div>
                    <div class="dt-pic-item">
                        <div class="dp-pic">
                            <img src="${path}/img/details/dp-p1.jpg" alt="">
                        </div>
                        <div class="dp-text">
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
                        </div>
                    </div>
                    <div class="dt-desc">
                        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                            himenaeos. Mauris vel magna ex. Integer gravida tincidunt accumsan. Vestibulum nulla
                            mauris, condimentum id felis ac, volutpat volutpat mi. In vitae tempor velit of the
                            impenetrable foliage xcepteur sint occaecat cupidatat non proident.</p>
                    </div>
                    <div class="dt-heading-tags">
                        <h3 class="title">Heading tags</h3>
                        <p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos
                            himenaeos. Suspen potenti. Pellentesque massa enim, fringilla ut ullamcorper sit amet,
                            ornare at ipsum.</p>
                        <div class="heading-list">
                            <h3>This is heading 1</h3>
                            <h4>This is heading 2</h4>
                            <h5 class="large-h5">This is heading 3</h5>
                            <h5>This is heading 4</h5>
                            <h6>This is heading 5</h6>
                            <h6 class="small-h6">This is heading 6</h6>
                        </div>
                        <p>Proin rhoncus mauris arcu, vel rutrum quam dictum quis. Fusce aliquam magna dolor, non
                            efficitur metus semper nec. Vivamus ac elit at dui fermentum dapibus. Pellentesque
                            habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sed
                            diam id neque feugiat.</p>
                    </div>
                    <div class="dt-listing unorder-list">
                        <h3>Unordered List</h3>
                        <p>Totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae
                            vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut
                            odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi
                            nesciunt tempora incidunt ut labore . Neque porro quisquam est, qui dolorem ipsum quia
                            dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi</p>
                        <ul>
                            <li>Ut enim ad minim veniam, quis nostrud exercitation.</li>
                            <li>Duis aute irure dolor in reprehenderit in voluptate velit.</li>
                            <li class="unorder-inner">Excepteur sint occaecat cupidatat non proident.</li>
                            <li class="unorder-inner">Sed ut perspiciatis unde omnis iste natus error.</li>
                            <li>Excepteur sint occaecat cupidatat non proident.</li>
                            <li>Sed ut perspiciatis unde omnis iste natus error.</li>
                        </ul>
                        <p>Duis aute irure dolor inenim ad minim veniam, quis nostrud exercitation ullamco laboris
                            nisi ut aliquip ex ea commodo conslaboris nisi ut aliquip ex ea commodo consequat. Duis
                            aute irure Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                            tempor incididunt ut labore et dolore.</p>
                    </div>
                    <div class="dt-listing order-list">
                        <h3>Ordered List</h3>
                        <p>Integer vel commodo erat. Mauris dun fringilla eleifend lobortis. Aenean idas venenatis
                            ligula. Cras indo nibh facilisis, tincidunt quamto nec, fringilla neque. Morbi ornare in
                            nisi atc cond mentum. Interdum etc malesuada fames ate ipsum primis in faucibus. Nullam
                            sagitis et nulla sed posuere magna aliqua.</p>
                        <ul>
                            <li><span>1.</span> Ut enim veniam, quis nostrud exercitation.</li>
                            <li><span>2.</span> Irure dolor in reprehenderit in voluptate velit.</li>
                            <li class="order-inner"><span>1.</span> Ut enim veniam, quis nostrud exercitation.</li>
                            <li class="order-inner"><span>2.</span> Irure dolor in reprehenderit in voluptate velit.
                            </li>
                            <li><span>3.</span> Excepteur sint occaecat cupidatat proident.</li>
                            <li><span>4.</span> Sed ut perspiciatis unde omnis iste natus error.</li>
                        </ul>
                        <p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore
                            et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
                            laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit
                            in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
                            cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                    <div class="dt-share">
                        <div class="ds-title">Share</div>
                        <div class="ds-links">
                            <a href="#" class="wide"><i class="fa fa-heart-o"></i><span>120</span></a>
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                    <div class="social-media">
                        <div class="section-title">
                            <h5>Social media</h5>
                        </div>
                        <ul>
                            <li>
                                <div class="sm-icon"><i class="fa fa-facebook"></i></div>
                                <span>Facebook</span>
                                <div class="follow">1,2k Follow</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="fa fa-twitter"></i></div>
                                <span>Twitter</span>
                                <div class="follow">1,2k Follow</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="fa fa-youtube-play"></i></div>
                                <span>Youtube</span>
                                <div class="follow">2,3k Subs</div>
                            </li>
                            <li>
                                <div class="sm-icon"><i class="fa fa-instagram"></i></div>
                                <span>Instagram</span>
                                <div class="follow">2,6k Follow</div>
                            </li>
                        </ul>
                    </div>
                    <div class="hardware-guides">
                        <div class="section-title">
                            <h5>Hardware guides</h5>
                        </div>
                        <div class="trending-item">
                            <div class="ti-pic">
                                <img src="${path}/img/trending/trending-5.jpg" alt="">
                            </div>
                            <div class="ti-text">
                                <h6><a href="#">A Monster Prom poster got hijacked for a Papa Roach concert...</a>
                                </h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                        <div class="trending-item">
                            <div class="ti-pic">
                                <img src="${path}/img/trending/trending-6.jpg" alt="">
                            </div>
                            <div class="ti-text">
                                <h6><a href="#">Facebook wants to read your thoughts with its augmented...</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                        <div class="trending-item">
                            <div class="ti-pic">
                                <img src="${path}/img/trending/trending-7.jpg" alt="">
                            </div>
                            <div class="ti-text">
                                <h6><a href="#">This gaming laptop with a GTX 1660 Ti and 32GB of RAM is down...</a>
                                </h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                        <div class="trending-item">
                            <div class="ti-pic">
                                <img src="${path}/img/trending/trending-8.jpg" alt="">
                            </div>
                            <div class="ti-text">
                                <h6><a href="#">Jalopy developer is making a game where you 'build stuff...</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="insta-media">
                        <div class="section-title">
                            <h5>Instagram</h5>
                        </div>
                        <div class="insta-pic">
                            <img src="${path}/img/instagram/ip-1.jpg" alt="">
                            <img src="${path}/img/instagram/ip-2.jpg" alt="">
                            <img src="${path}/img/instagram/ip-3.jpg" alt="">
                            <img src="${path}/img/instagram/ip-4.jpg" alt="">
                        </div>
                    </div>
                    <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of</h5>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-1" data-cpvalue="95"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">9.5</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
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
                                        <div class="review-point">8.5</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
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
                                        <div class="review-point">8.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
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
                                        <div class="review-point">7.5</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">This gaming laptop with a GTX 1660...</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="subscribe-option">
                        <div class="section-title">
                            <h5>Subscribe</h5>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, eiusmod tempor.</p>
                        <form action="#">
                            <input type="text" placeholder="Name">
                            <input type="text" placeholder="Email">
                            <button type="submit"><span>Subscribe</span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/><c:param name="path" value="${path}"/></c:import>