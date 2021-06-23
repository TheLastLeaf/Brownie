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
    <title>Amin | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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
            <a href="#"><img src="img/f-logo.png" alt=""></a>
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
                <img src="img/instagram/ip-1.jpg" alt="">
                <img src="img/instagram/ip-2.jpg" alt="">
                <img src="img/instagram/ip-3.jpg" alt="">
                <img src="img/instagram/ip-4.jpg" alt="">
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
                       <a href="./index.html"><img src="img/logo.png" alt=""></a>
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
                                            <img src="img/megamenu/mm-1.jpg" alt="">
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
                                            <img src="img/megamenu/mm-2.jpg" alt="">
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
                                            <img src="img/megamenu/mm-3.jpg" alt="">
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
                                            <img src="img/megamenu/mm-4.jpg" alt="">
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
                                            <img src="img/megamenu/mm-5.jpg" alt="">
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
    <section class="breadcrumb-section set-bg spad" data-setbg="img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h3>팬아트 게시판<span>❤</span></h3>
                        <div class="bt-option">
                            <a href="#">인기글</a>
                            <a href="#">Latest posts</a>
                            <span>Hardware</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
	<style>
		.sub_photo li{float:left;position:relative;width:240px;margin-right:8px; margin-bottom:30px; display:block;}
		.sub_photo li.last{margin-right:0}
		.sub_photo li a strong{display:block;overflow:hidden;padding-right:8px;white-space:nowrap;text-overflow:ellipsis; font-size:14px;}
		.sub_photo li img{width:240px;height:160px;}
		.sub_photo p.thmb{margin-bottom:3px}
		.sub_photo .tx_brief{margin-top:2px;padding-right:13px}
		.sub_photo .tx_brief a{color:#666}
		
		.paginate{ padding:16px 0 0;text-align:center; }
		.paginate a,.paginate strong{display:inline-block;position:relative;_width /**/:17px;margin-right:1px;padding:2px 4px 3px;border:1px solid #f5f2ed;color:#666;font-family:Verdana;font-size:11px;font-weight:bold;line-height:normal;text-decoration:none}
		.paginate strong{border:1px solid #928070;color:#f52d2d !important}
		.paginate .pre{margin-right:6px;padding:5px 6px 2px 14px;_padding-bottom:1px;background:url(http://static.naver.com/common/paginate/bu_pg3_l_off.gif) no-repeat 6px 5px !important;letter-spacing:-1px}
		.paginate .next{margin-left:4px;padding:5px 14px 2px 6px;_padding-bottom:1px;background:url(http://static.naver.com/common/paginate/bu_pg3_r_off.gif) no-repeat 62px 5px !important;letter-spacing:-1px}
		.paginate a.pre{background:url(http://static.naver.com/common/paginate/bu_pg3_l_on.gif) no-repeat 6px 6px !important}
		.paginate a.next{background:url(http://static.naver.com/common/paginate/bu_pg3_r_on.gif) no-repeat 33px 6px !important}
		.paginate .pre,.paginate .next{display:inline-block;position:relative;top:0;_top:-2px;_width:75px;border:1px solid #b4b4b4;color:#ccc;font-family:'돋움',Dotum;font-size:11px;line-height:normal}
		.paginate a.pre,.paginate a.next{color:#565656}
		.paginate a:hover{border:1px solid #e9e9e9; color:#FFF; background-color:#939393 !important}
		
		.todayHot p.thmb{margin-bottom:3px;}
		.todayHot li{float:left;position:relative;width:240px;margin-right:8px; margin-bottom:30px; display:block;}
		.todayHot li.last{margin-right:0}
		.todayHot li a strong{display:block;overflow:hidden;padding-right:8px;white-space:nowrap;text-overflow:ellipsis; font-size:14px;}
		.todayHot li img{width:240px;height:160px;}
		.todayHot p.thmb{margin-bottom:3px}
		.todayHot .tx_brief{margin-top:2px;padding-right:13px}
		.todayHot .tx_brief a{color:#666}
		
		.gallery_notice {color:white; width: 1000px; }
		.gallery_notice th {border: 2px solid white; text-align: center;}
		.gallery_notice td {border: 2px solid white;}
		
	</style>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- Categories Grid Section Begin -->
	<section class="categories-grid-section spad">
		<div class="container">
			<div class="notice"
				style="height: 200px; width: 1150px; border: 3px solid white;">
				<h3 style="color: white;">갤러리아 공지사항</h3>
				<table class="gallery_notice">
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록일</th>
						<th>조회</th>
						<th>추천</th>
					</tr>
					<tr>
						<td>[공지]</td>
						<td><a href="#"><strong>치타는 웃고있다. </strong></a></td>
						<td>곽지훈</td>
						<td>2014-01-28</td>
						<td>12</td>
						<td>3</td>
					</tr>
					<tr>
						<td>[공지]</td>
						<td><a href="#"><strong>고양인 울고있다.</strong></a></td>
						<td>곽지훈</td>
						<td>2014-01-28</td>
						<td>12</td>
						<td>3</td>
					</tr>
					<tr>
						<td>[공지]</td>
						<td><a href="#"><strong>강아진 짖고있다. 2014-01-28</strong></a></td>
						<td>곽지훈</td>
						<td>2014-01-28</td>
						<td>12</td>
						<td>3</td>
					</tr>
					<tr>
						<td>[공지]</td>
						<td><a href="#"><strong>강아진 물리고있다. 2014-01-28</strong></a></td>
						<td>곽지훈</td>
						<td>2014-01-28</td>
						<td>12</td>
						<td>3</td>
					</tr>
					
				</table>
			</div>
			<div class="todayHot" style="height: 300px; width: 1150px; border: 3px solid white;">
			<h3 style="color: white;">오늘의 붐업!</h3>
				<ul>
					<li>
						<p class="thmb">
							<a href="#"> <span>움짤</span> <img src="img/1.jpeg" alt="">
							</a>
						</p> <a href="#"><strong>치타는 웃고있다.</strong></a>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>팬아트</span> <img src="img/2.jpg" alt="">
							</a>
						</p> <a href="#"><strong>고양인 울고있다.</strong></a>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>팬아트</span> <img src="img/3.jpg" alt="">
							</a>
						</p> <a href="#"><strong>강아진 짖고있다.</strong></a>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>습작</span> <img src="img/4.jpg" alt="">
							</a>
						</p> <a href="#"><strong>강아진 물리고있다.</strong></a>
					</li>
				</ul>
			</div>
			<div>
				<select
					onchange="location.href = INVEN.QueryMaker.getLink('https://www.inven.co.kr/board/lol/2775', 'come_idx->2775,category->' + this.value, 'remove->p,category2');"
					style="display: inline; float: left;">
					<option value="">전체</option>
					<option value="장례식">장례식</option>
					<option value="자작">자작</option>
					<option value="연재">연재</option>
					<option value="퍼온글">퍼온글</option>
					<option value="기타">기타</option>
				</select> <a href="" class="" style="margin-left: 3px;">오늘의 화제</a> <a href=""
					class="" style="margin-left: 3px;">인기만점</a> <a href="" class=""
					style="margin-left: 3px;">내가쓴글</a>
			</div>

			<div class="sub_photo" style="height: 700px; width: 1150px; border: 3px solid white;">
				<div class="title_area">
					<h4 class="hh_photo">
						<strong class="blind">갤러리</strong>
					</h4>
				</div>
				<ul>
					<li>
						<p class="thmb">
							<a href="#"> <span>움짤</span> <img class="img-thumbnail" src="img/1.jpeg" alt="">
							</a>
						</p> <a href="#"><strong>치타는 웃고있다.</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>팬아트</span> <img src="img/2.jpg" alt="">
							</a>
						</p> <a href="#"><strong>고양인 울고있다.</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>팬아트</span> <img src="img/3.jpg" alt="">
							</a>
						</p> <a href="#"><strong>강아진 짖고있다.</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>습작</span> <img src="img/4.jpg" alt="">
							</a>
						</p> <a href="#"><strong>강아진 물리고있다.</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>연재</span> <img src="img/5.gif" alt="">
							</a>
						</p> <a href="#"><strong>기립박수</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>연재</span> <img src="img/6.jpg" alt="">
							</a>
						</p> <a href="#"><strong>이색기야</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<li>
						<p class="thmb">
							<a href="#"> <span>연재</span> <img src="img/7.gif" alt="">
							</a>
						</p> <a href="#"><strong>도게자 박겠습니다</strong></a>
						<p class="tx_brief">2014-01-28</p>
					</li>
					<!-- li가 게시판 1개글입니다 보일 갤러리 갯수만큼 li반복합니다.-->
				</ul>
			</div>
			<!-- 갤러리끝 -->
		</div>
		<div class="paginate">
			<a href="#"><span>1</span></a> <a href="#"><span>2</span></a> <a
				href="#"><span>3</span></a> <a href="#"><span>Next</span></a>
		</div>
	</section>
	<!-- Categories Grid Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="footer-about">
                        <div class="fa-logo">
                            <a href="#"><img src="img/f-logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                            labore et dolore magna aliqua lacus vel facilisis.</p>
                        <div class="fa-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="editor-choice">
                        <div class="section-title">
                            <h5>Editor's Choice</h5>
                        </div>
                        <div class="ec-item">
                            <div class="ec-pic">
                                <img src="img/trending/editor-1.jpg" alt="">
                            </div>
                            <div class="ec-text">
                                <h6><a href="#">A Monster Prom poster got hijacked for a Papa Roach concert...</a>
                                </h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                        <div class="ec-item">
                            <div class="ec-pic">
                                <img src="img/trending/editor-2.jpg" alt="">
                            </div>
                            <div class="ec-text">
                                <h6><a href="#">Facebook wants to read your thoughts with its augmented...</a>
                                </h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 12</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="tags-cloud">
                        <div class="section-title">
                            <h5>Tags Cloud</h5>
                        </div>
                        <div class="tag-list">
                            <a href="#"><span>Gaming</span></a>
                            <a href="#"><span>Platform</span></a>
                            <a href="#"><span>Playstation</span></a>
                            <a href="#"><span>Hardware</span></a>
                            <a href="#"><span>Reviews</span></a>
                            <a href="#"><span>Simulation</span></a>
                            <a href="#"><span>Strategy</span></a>
                            <a href="#"><span>Scientific</span></a>
                            <a href="#"><span>References</span></a>
                            <a href="#"><span>Role-playing</span></a>
                            <a href="#"><span>Adventurea</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copyright-area">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="ca-text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
                    </div>
                    <div class="col-lg-6">
                        <div class="ca-links">
                            <a href="#">About</a>
                            <a href="#">Subscribe</a>
                            <a href="#">Contact</a>
                            <a href="#">Support</a>
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
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/circle-progress.min.js"></script>
    <script src="js/jquery.barfiller.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>