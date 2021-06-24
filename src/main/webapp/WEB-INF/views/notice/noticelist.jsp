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
    <title>Amin | NoticeList</title>

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
            <a href="/index"><img src="${path}/img/f-logo.png" alt=""></a>
        </div>
        <div class="hw-menu mobile-menu">
            <ul>
                <li><a href="/index">Home</a></li>
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
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
                       <a href="/index"><img src="${path}/img/logo.png" alt=""></a>
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
                        <li><a href="/index"><span>Home</span></a></li>
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
	

	
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg spad" data-setbg="${path}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h3>공지사항</h3>
                        <div class="">
                            <span onclick="location.href='index'" style="color: white; cursor: pointer;">Home</span>
                            <span style="color: #666666"> / </span>
                            <span onclick="location.href='index'" style="color: red; cursor: pointer;">Latest posts</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Categories list Section Begin -->
    <section class="categories-list-section spad">
        <div style="margin-left: 80%;">
            <input type="button" class="btn btn-outline-dark btn-sm" value="글쓰기" style="color: white;" onclick="location.href='noticeAdd'">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="${path}/img/categories-list/cl-1.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">자유게시판</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>자유게시판 공지사항</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="${path}/img/categories-list/cl-2.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">팬아트갤러리</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>팬아트 공지사항</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="${path}/img/categories-list/cl-3.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">팬아트 갤러리</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>팬아트 갤러리 공지사항	</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="${path}/img/categories-list/cl-4.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">궁금증과 답변을 한 번에! 무엇이든 물어보세요 오픈!</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>평소의 궁금증을 풀기도 하고 다양한 고민도 해결할 수 있는 곳.
									무엇이든 물어보세요 게시판이 새롭게 열렸습니다.   
									질문 및 답변을 남겨주실 때는 본인뿐만 아니라 타인의 입장에서
									상처가 되진 않을지 혹은 좋지 않은 표현이 담겨 있지 않은지
									한 번씩만 생각해서 글을 남겨주시면 많은 이야기를 나눌 수 있는 게시판이 될 것 같습니다.</p>
                        </div>
                    </div>
                    <div style="text-align: center;">
                        <span>
                            <select name="notice" style="height:30px; background: black; color: #666666;">
                                <option value="" selected="selected">선택</option>
                                <option value="title" >제목</option>
                                <option value="content" >내용</option>
                                <option value="writer" >작성자</option>
                            </select>
                            <input type="text" value="" style="background: black; color: #666666">
                        </span>
                        <input type="button" class="btn btn-outline-dark" value="조회" style="color: #666666">
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

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row" >
                <div class="col-lg-12">
                    <div class="footer-about">
                        <div class="fa-logo">
                            <a href="/index"><img src="${path}/img/f-logo.png" alt=""></a>
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
    <script src="${path}/js/main.js"></script>
</body>

</html>