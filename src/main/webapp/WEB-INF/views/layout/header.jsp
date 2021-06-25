<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Amin | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${param.path}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${param.path}/css/style.css" type="text/css">
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
        <a href="#"><img src="${param.path}/img/f-logo.png" alt=""></a>
    </div>
    <div class="hw-menu mobile-menu">
        <ul>
            <li><a href="${param.path}/index">Home</a></li>
            <li><a href="#">Pages <i class="fa fa-angle-down"></i></a>
                <ul class="dropdown">
                    <li><a href="${param.path}/categories-list">Categories</a></li>
                    <li><a href="${param.path}/categories-grid">Categories grid</a></li>
                    <li><a href="${param.path}/typography">Typography</a></li>
                    <li><a href="${param.path}/details-post-default">Post default</a></li>
                    <li><a href="${param.path}/details-post-gallery">Post gallery</a></li>
                    <li><a href="${param.path}/details-post-review">Post review</a></li>
                    <li><a href="${param.path}/contact">Contact</a></li>
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
        Copyright © 2019 Colorlib Inc. All rights reserved
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
            <img src="${param.path}/img/instagram/ip-1.jpg" alt="">
            <img src="${param.path}/img/instagram/ip-2.jpg" alt="">
            <img src="${param.path}/img/instagram/ip-3.jpg" alt="">
            <img src="${param.path}/img/instagram/ip-4.jpg" alt="">
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
                    <a href="${param.path}/index"><img src="${param.path}/img/logo.png" alt=""></a>
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
                    <li class="active"><a href="${param.path}/index"><span>Home</span></a></li>
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
                                        <img src="${param.path}/img/megamenu/mm-1.jpg" alt="">
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
                                        <img src="${param.path}/img/megamenu/mm-2.jpg" alt="">
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
                                        <img src="${param.path}/img/megamenu/mm-3.jpg" alt="">
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
                                        <img src="${param.path}/img/megamenu/mm-4.jpg" alt="">
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
                                        <img src="${param.path}/img/megamenu/mm-5.jpg" alt="">
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
                    <li>
                        <a href="#"><span>Pages <i class="fa fa-angle-down"></i></span></a>
                        <ul class="dropdown">
                            <li><a href="${param.path}/categories-list">Categories</a></li>
                            <li><a href="${param.path}/categories-grid">Categories grid</a></li>
                            <li><a href="${param.path}/typography">Typography</a></li>
                            <li><a href="${param.path}/details-post-default">Post default</a></li>
                            <li><a href="${param.path}/details-post-gallery">Post gallery</a></li>
                            <li><a href="${param.path}/details-post-review">Post review</a></li>
                            <li><a href="${param.path}/contact">Contact</a></li>
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
