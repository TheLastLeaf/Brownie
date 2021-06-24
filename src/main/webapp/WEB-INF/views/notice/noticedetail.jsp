<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Amin | NoticeDetail</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${path}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${path}/css/style.css" type="text/css">

</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Menu Begin -->
    <div class="humberger-menu-overlay"></div>
    <div class="humberger-menu-wrapper">
        <div class="hw-logo">
            <a href="/"><img src="${path}/img/f-logo.png" alt=""></a>
        </div>
        <div class="hw-menu mobile-menu">
            <ul>
                <li><a href="./index.html">Home</a></li>
                <li><a href="#">Pages <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="./categories-list.html">Categories</a></li>
                        <li><a href="./categories-grid.html">Categories grid</a></li>
                        <li><a href="./typography.html">Typography</a></li>
                        <li><a href="./details-post-default.html">Post default</a></li>
                        <li><a href="./details-post-gallery.html">Post gallery</a></li>
                        <li><a href="./details-post-review.html">Post review</a></li>
                        <li><a href="./contact.html">Contact</a></li>
                    </ul>
                </li>
                <li><a href="#">Reviews <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="#">Playstation</a></li>
                        <li><a href="#">Windows</a></li>
                        <li><a href="#">Mobile</a></li>
                        <li><a href="#">Xbox</a></li>
                    </ul>
                </li>
                <li><a href="#">Windows <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="#">Playstation</a></li>
                        <li><a href="#">Windows</a></li>
                        <li><a href="#">Mobile</a></li>
                        <li><a href="#">Xbox</a></li>
                    </ul>
                </li>
                <li><a href="#">Videos <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="#">Playstation</a></li>
                        <li><a href="#">Windows</a></li>
                        <li><a href="#">Mobile</a></li>
                        <li><a href="#">Xbox</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="hw-copyright">
            Copyright Â© 2019 Colorlib Inc. All rights reserved
        </div>
        <div class="hw-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-youtube-play"></i></a>
            <a href="#"><i class="fa fa-instagram"></i></a>
        </div>
        <div class="hw-insta-media">
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
    </div>
    <!-- Humberger Menu End -->

    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="ht-options">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-8">
                        <div class="ht-widget">
                            <ul>
                                <li><i class="fa fa-sun-o"></i> <span>20<sup>c</sup></span> London</li>
                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                <li class="signup-switch signup-open"><i class="fa fa-sign-out"></i> Login / Sign up
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-4">
                        <div class="ht-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-envelope-o"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="logo">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center">
                       <a href="./index.html"><img src="${path}/img/logo.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-options">
            <div class="container">
                <div class="humberger-menu humberger-open">
                    <i class="fa fa-bars"></i>
                </div>
                <div class="nav-search search-switch">
                    <i class="fa fa-search"></i>
                </div>
                <div class="nav-menu">
                    <ul>
                        <li><a href="./index.html"><span>Home</span></a></li>
                        <li class="mega-menu"><a href="#"><span>Platform <i class="fa fa-angle-down"></i></span></a>
                            <div class="megamenu-wrapper">
                                <ul class="mw-nav">
                                    <li><a href="#"><span>Playstation</span></a></li>
                                    <li><a href="#"><span>Windows</span></a></li>
                                    <li><a href="#"><span>Mobile</span></a></li>
                                    <li><a href="#"><span>Xbox</span></a></li>
                                </ul>
                                <div class="mw-post">
                                    <div class="mw-post-item">
                                        <div class="mw-pic">
                                            <img src="${path}/img/megamenu/mm-1.jpg" alt="">
                                        </div>
                                        <div class="mw-text">
                                            <h6><a href="#">A Monster Prom poster got hijacked for a Papa Roach
                                                    concert...</a></h6>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                                <li><i class="fa fa-comment-o"></i> 12</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="mw-post-item">
                                        <div class="mw-pic">
                                            <img src="${path}/img/megamenu/mm-2.jpg" alt="">
                                        </div>
                                        <div class="mw-text">
                                            <h6><a href="#">A new Borderlands 3 trailer introduces Moze and her...</a>
                                            </h6>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                                <li><i class="fa fa-comment-o"></i> 12</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="mw-post-item">
                                        <div class="mw-pic">
                                            <img src="${path}/img/megamenu/mm-3.jpg" alt="">
                                        </div>
                                        <div class="mw-text">
                                            <h6><a href="#">Teamfight Tactics is in chaos after today's patch...</a>
                                            </h6>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                                <li><i class="fa fa-comment-o"></i> 12</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="mw-post-item">
                                        <div class="mw-pic">
                                            <img src="${path}/img/megamenu/mm-4.jpg" alt="">
                                        </div>
                                        <div class="mw-text">
                                            <h6><a href="#">Borderlands 2 dev explains why there's mysterious
                                                    boxes...</a></h6>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                                <li><i class="fa fa-comment-o"></i> 12</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="mw-post-item">
                                        <div class="mw-pic">
                                            <img src="${path}/img/megamenu/mm-5.jpg" alt="">
                                        </div>
                                        <div class="mw-text">
                                            <h6><a href="#">Capcom asks select fans to test new Resident Evil game</a>
                                            </h6>
                                            <ul>
                                                <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                                <li><i class="fa fa-comment-o"></i> 12</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="active"><a href="#"><span>Pages <i class="fa fa-angle-down"></i></span></a>
                            <ul class="dropdown">
                                <li><a href="./categories-list.html">Categories</a></li>
                                <li><a href="./categories-grid.html">Categories grid</a></li>
                                <li><a href="./typography.html">Typography</a></li>
                                <li><a href="./details-post-default.html">Post default</a></li>
                                <li><a href="./details-post-gallery.html">Post gallery</a></li>
                                <li><a href="./details-post-review.html">Post review</a></li>
                                <li><a href="./contact.html">Contact</a></li>
                            </ul>
                        </li>
                        <li><a href="#"><span>Reviews <i class="fa fa-angle-down"></i></span></a></li>
                        <li><a href="#"><span>Windows <i class="fa fa-angle-down"></i></span></a></li>
                        <li><a href="#"><span>Videos <i class="fa fa-angle-down"></i></span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <!-- Header End -->
    
    <!-- Details Post Section Begin -->
    <section class="details-post-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 p-0">
                    <div class="details-text typography-page">
                        <div class="dt-breadcrumb">
                            <div class="dt-bread-option">
                                <a href="/index">Home</a>
                                <span>Typography</span>
                            </div>
                            <div class="details-hero-text" style="margin-left: 96%;">
                                <ul>
                                    <li><input type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='noticelist'" style="color:#c20000; cursor: pointer;" value="삭제"></li>
                                </ul>
                            </div>
                            <hr style="width: auto; background-color: white;">
                            <h3>제목</h3>
                             <div class="dp-pic">
                                <img src="${path}/img/details/dp-p1.jpg" alt="">
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
                        <div class="dt-author" style="border: 1px solid gray;">
                            <div class="da-pic">
                                <img src="${path}/img/details/author-pic.jpg" alt="">
                            </div>
                            <div class="da-text">
                               	<a href="/mypage">
	                                <h5>
                                		작성자
	                                </h5>
                                </a>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                            </div>
                        </div>
                        <div class="col-md-6" style="margin-left: 78%;">
                            <div class="details-hero-text">
                                <ul>
                                    <li>by <span>Admin</span></li>
                                    <li class="fa fa-clock-o">Aug 01, 2019</li>
                                    <li><span onclick="location.href='noticelist'" style="color:#666666; cursor: pointer;">목록</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="dt-comment">
                            <h4>REPLY</h4>
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Details Post Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row" >
                <div class="col-lg-8">
                    <div class="footer-about">
                        <div class="fa-logo">
                            <a href="#"><img src="${path}/img/f-logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua lacus vel facilisis.</p>
                         <div class="col-lg-6" >
                        	<div class="ca-text">
                        		<p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved</p>
						  	</div>
              	      	</div> 
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Sign Up Section Begin -->
    <div class="signup-section">
        <div class="signup-close"><i class="fa fa-close"></i></div>
        <div class="signup-text">
            <div class="container">
                <div class="signup-title">
                    <h2>Sign up</h2>
                    <p>Fill out the form below to recieve a free and confidential</p>
                </div>
                <form action="#" class="signup-form">
                    <div class="sf-input-list">
                        <input type="text" class="input-value" placeholder="User Name*">
                        <input type="text" class="input-value" placeholder="Password">
                        <input type="text" class="input-value" placeholder="Confirm Password">
                        <input type="text" class="input-value" placeholder="Email Address">
                        <input type="text" class="input-value" placeholder="Full Name">
                    </div>
                    <div class="radio-check">
                        <label for="rc-agree">I agree with the term & conditions
                            <input type="checkbox" id="rc-agree">
                            <span class="checkbox"></span>
                        </label>
                    </div>
                    <button type="submit"><span>REGISTER NOW</span></button>
                </form>
            </div>
        </div>
    </div>
    <!-- Sign Up Section End -->

    <!-- Search model Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="${path}/js/jquery-3.3.1.min.js"></script>
    <script src="${path}/js/bootstrap.min.js"></script>
    <script src="${path}/js/jquery.magnific-popup.min.js"></script>
    <script src="${path}/js/circle-progress.min.js"></script>
    <script src="${path}/js/jquery.barfiller.js"></script>
    <script src="${path}/js/jquery.slicknav.js"></script>
    <script src="${path}/js/owl.carousel.min.js"></script>
    <script src="${path}/	js/main.js"></script>
</body>

</html>