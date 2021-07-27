<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Brownie</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/barfiller/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css"
          integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css"
          integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">

    <!-- Js Plugins -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"
            integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js"
            integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="${pageContext.request.contextPath}/barfiller/js/jquery.barfiller.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.js"
            integrity="sha512-AmJ0T6lpw/ZQtCleMyfbraDy8AGQ9tWaB/PmRkXdKxH9Kvo0oTuW6+2hTEQ89mHkFIO/LpColEe3+QE+FJtgIg=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
            integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"
            integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 서머노트를 위해 추가해야할 부분 -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="${pageContext.request.contextPath}/summernote/lang/summernote-ko-KR.min.js"></script>

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

        .admin {
            height: 25px;
            font-size: small;
        }

        .mw-post-item img {
            height: 132px;
            width: auto;
        }

        #clock {
            width: 150px;
        }
    </style>

    <script>
        function setClock() {
            $.ajax({
                url: "/time.ajax",
                type: "POST",
                success: function (data) {
                    $("#clock").html("<i class=\"far fa-clock\"></i>" + data);
                },
                error: function (e) {
                }
            })
        }

        $(function () {
            $.ajax({
                url: "/board/list.ajax",
                type: "POST",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    let headerNoticeSection = "";
                    let headerTipSection = "";
                    let headerGallerySection = "";
                    let headerFreeSection = "";
                    $.each(data.noticeBoardVOList, function (index, boardVO) {
                        headerNoticeSection += "<div class=\"mw-post-item\">"
                            + "<div class=\"mw-pic col-xl-\">"
                            + "<img src=\"" + boardVO.imgSrc + "\" alt=\"\">"
                            + "</div>"
                            + "<div class=\"mw-text\">"
                            + "<h6>"
                            + "<a href=\"${pageContext.request.contextPath}/notice/details/" + boardVO.boardSeq + "\">" + boardVO.title + "</a>"
                            + "</h6>"
                            + "<ul>"
                            + "<li><i class=\"far fa-clock\"></i> " + boardVO.boardInDateToString + "</li>"
                            + "</ul>"
                            + "</div>"
                            + "</div>"
                    });
                    $("#header-notice-section").html(headerNoticeSection);

                    $.each(data.tipBoardVOList, function (index, boardVO) {
                        headerTipSection += "<div class=\"mw-post-item\">"
                            + "<div class=\"mw-pic col-xl-\">"
                            + "<img src=\"" + boardVO.imgSrc + "\" alt=\"\">"
                            + "</div>"
                            + "<div class=\"mw-text\">"
                            + "<h6>"
                            + "<a href=\"${pageContext.request.contextPath}/tip/details/" + boardVO.boardSeq + "\">" + boardVO.title + "</a>"
                            + "</h6>"
                            + "<ul>"
                            + "<li><i class=\"far fa-clock\"></i> " + boardVO.boardInDateToString + "</li>"
                            + "<li><i class=\"far fa-comment\"></i> " + boardVO.replyCnt + "</li>"
                            + "</ul>"
                            + "</div>"
                            + "</div>"
                    });
                    $("#header-tip-section").html(headerTipSection);

                    $.each(data.galleryBoardVOList, function (index, boardVO) {
                        headerGallerySection += "<div class=\"mw-post-item\">"
                            + "<div class=\"mw-pic col-xl-\">"
                            + "<img src=\"" + boardVO.imgSrc + "\" alt=\"\">"
                            + "</div>"
                            + "<div class=\"mw-text\">"
                            + "<h6>"
                            + "<a href=\"${pageContext.request.contextPath}/gallery/details/" + boardVO.boardSeq + "\">" + boardVO.title + "</a>"
                            + "</h6>"
                            + "<ul>"
                            + "<li><i class=\"far fa-clock\"></i> " + boardVO.boardInDateToString + "</li>"
                            + "<li><i class=\"far fa-comment\"></i> " + boardVO.replyCnt + "</li>"
                            + "</ul>"
                            + "</div>"
                            + "</div>"
                    });
                    $("#header-gallery-section").html(headerGallerySection);

                    $.each(data.freeBoardVOList, function (index, boardVO) {
                        headerFreeSection += "<div class=\"mw-post-item\">"
                            + "<div class=\"mw-pic col-xl-\">"
                            + "<img src=\"" + boardVO.imgSrc + "\" alt=\"\">"
                            + "</div>"
                            + "<div class=\"mw-text\">"
                            + "<h6>"
                            + "<a href=\"${pageContext.request.contextPath}/free/details/" + boardVO.boardSeq + "\">" + boardVO.title + "</a>"
                            + "</h6>"
                            + "<ul>"
                            + "<li><i class=\"far fa-clock\"></i> " + boardVO.boardInDateToString + "</li>"
                            + "<li><i class=\"far fa-comment\"></i> " + boardVO.replyCnt + "</li>"
                            + "</ul>"
                            + "</div>"
                            + "</div>"
                    });
                    $("#header-free-section").html(headerFreeSection);
                },
                error: function () {
                    alert("문제가 발생하였습니다.");
                }
            })

            setInterval("setClock()", 1000);
        })
    </script>
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
            <li><a href="${pageContext.request.contextPath}/tip">CHAMPIONS TIP</a></li>
            <li><a href="${pageContext.request.contextPath}/gallery">GALLERY</a></li>
            <li><a href="${pageContext.request.contextPath}/free">LOUNGE</a></li>
        </ul>
    </div>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- Humberger Menu End -->

<!-- Header Section Begin -->
<header class="header-section">
    <div class="ht-options">
        <div class="container">
            <div class="ht-widget">
                <ul>
                    <li id="clock"><i class="far fa-clock"></i></li>
                    <li class="signup-switch signup-open">
                        <c:choose>
                            <c:when test="${sessionScope.id != null}">
                                        <span style="margin-left:4px;">
                                            <a onclick="location.href='/user/info/${sessionScope.id}'"
                                               style="text-decoration: underline;">${sessionScope.nickname  }</a>
                                            <span style="cursor:text">님 환영합니다</span>
                                        </span>
                                <span style="margin-left:4px; cursor:text;">LV.${sessionScope.permit_level}</span>
                                <span style="margin-left:4px;">
                                            <a onclick="location.href='/user/info/${sessionScope.id}'">
                                                <i class="far fa-address-book" aria-hidden="true"></i>
                                            </a>
                                        </span>
                                <span>
                                            <a onclick="location.href='/logout'">
                                                <i class="fas fa-sign-out-alt"></i>
                                            </a>
                                        </span>
                                <c:if test="${sessionScope.id ne null and sessionScope.permit_level eq 9}">
                                    <i class="far fa-address-card" onclick="location.href='/admin'"></i>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <a onclick="location.href = '/login'">
                                    <img src="${pageContext.request.contextPath}/img/common/kakao_login_small.png"
                                         alt=""/>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="logo">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a href="${pageContext.request.contextPath}/index"><img
                            src="${pageContext.request.contextPath}/img/layout/brownie-header.png"
                            alt=""></a>
                </div>
            </div>
        </div>
    </div>
    <div class="nav-options">
        <div class="container">
            <div class="humberger-menu humberger-open">
                <i class="fas fa-bars"></i>
            </div>
            <div class="nav-menu">
                <ul>
                    <!-- 						<li class="active"><a href="notice"><span>공지사항</span></a></li> -->
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/notice"><span>NOTICE
						<i class="fas fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div id="header-notice-section" class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/teamGame"><span>GROUP
						<i class="fas fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">ALL</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Howling Abyss</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Normal</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Solo Rank</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">Free rank</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/tip"><span>CHAMPIONS TIP
						<i class="fas fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div id="header-tip-section" class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/gallery"><span>GALLERY
						<i class="fas fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div id="header-gallery-section" class="mw-post">
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="mw-post-item">
                                    <div class="mw-pic col-xl-">
                                        <img src="https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg"
                                             alt="">
                                    </div>
                                    <div class="mw-text">
                                        <h6>
                                            <a href="#">게시글 제목</a>
                                        </h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 12</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu"><a href="${pageContext.request.contextPath}/free"><span>LOUNGE
						<i class="fas fa-angle-down"></i></span></a>
                        <div class="megamenu-wrapper">
                            <div id="header-free-section" class="mw-post">
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- Header End -->