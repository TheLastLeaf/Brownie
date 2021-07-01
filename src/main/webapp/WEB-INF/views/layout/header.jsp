<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Browniee</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
    <style>
        ::-webkit-scrollbar {
            width: 10px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            background: #0d0d0d;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #888;
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }
    </style>
    
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
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
        <a href="#"><img src="${pageContext.request.contextPath}/img/layout/brownie-footer.png" alt=""></a>
    </div>
    <div class="hw-menu mobile-menu">
        <ul>
            <li><a href="${pageContext.request.contextPath}/index">MAIN</a></li>
            <li><a href="${pageContext.request.contextPath}/notice">NOTICE</a></li>
            <li><a href="${pageContext.request.contextPath}/teamGame">GROUP</a></li>
            <li><a href="${pageContext.request.contextPath}/tip">GUIDE</a></li>
            <li><a href="${pageContext.request.contextPath}/gallery">FANART</a></li>
            <li><a href="${pageContext.request.contextPath}/board">LOUNGE</a></li>
        </ul>
    </div>
    <div id="mobile-menu-wrap"></div>
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
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li class="signup-switch signup-open">
								<c:choose>
									<c:when test="${id != null}">
										<span style="margin-left:4px;">${id} 님 환영합니다</span>
										<span style="margin-left:4px;">Lv. 3</span>
										<span style="margin-left:4px;"><i class="fa fa-address-book-o" aria-hidden="true"></i></span>
										<span><a onclick="location.href='/logout'"><i class="fa fa-sign-out"></i></a></span>
									</c:when>
									<c:otherwise>
										<a onclick="location.href = '/login'">
											<img src="<c:url value='${pageContext.request.contextPath}/img/common/kakao_login_small.png'/>" alt=""/>
										</a>
									</c:otherwise>
								</c:choose>
							</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-4">
                    <div class="ht-social nav-search ">
                        <input type="text"
                               style="width: 150px; border:1px solid black; font-size: 11px; color: #ffffff; background-color: #222222;"
                               placeholder="search"/>&nbsp;&nbsp;<i
                            class="fa fa-search"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="logo">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/img/layout/brownie-header.png"
                                                       alt=""></a>
                </div>
            </div>
        </div>
    </div>
    <div class="nav-options">
        <div class="container">
            <div class="humberger-menu humberger-open">
                <i class="fa fa-bars"></i>
            </div>
            <div class="nav-menu">
                <ul>
                    <!-- 						<li class="active"><a href="notice"><span>공지사항</span></a></li> -->
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/notice"><span>NOTICE
						<i class="fa fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-1.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-2.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-3.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-4.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-5.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
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
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/teamGame"><span>GROUP
						<i class="fa fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-1.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">ALL</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-2.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Howling Abyss</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-5.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Normal</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-3.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Solo Rank</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-4.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Free rank</a>
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
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/tip"><span>GUIDE
						<i class="fa fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-1.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-2.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-3.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-4.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-5.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
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
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/gallery"><span>FANART
						<i class="fa fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-1.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-2.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-3.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-4.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-5.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
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
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/board"><span>LOUNGE
						<i class="fa fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-1.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-2.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-3.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-4.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                            <li><i class="fa fa-comment-o"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="${pageContext.request.contextPath}/img/megamenu/mm-5.jpg" alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
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
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->