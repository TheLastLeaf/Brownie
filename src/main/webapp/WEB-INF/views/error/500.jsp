<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
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
			<a href="#"><img src="${path}/img/f-logo.png" alt=""></a>
		</div>
		<div class="hw-menu mobile-menu">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Platform <i class="fa fa-angle-down"></i></a>
					<ul class="dropdown">
						<li><a href="#">Playstation</a></li>
						<li><a href="#">Windows</a></li>
						<li><a href="#">Mobile</a></li>
						<li><a href="#">Xbox</a></li>
					</ul></li>
				<li><a href="#">Reviews <i class="fa fa-angle-down"></i></a>
					<ul class="dropdown">
						<li><a href="#">Playstation</a></li>
						<li><a href="#">Windows</a></li>
						<li><a href="#">Mobile</a></li>
						<li><a href="#">Xbox</a></li>
					</ul></li>
				<li><a href="#">Windows <i class="fa fa-angle-down"></i></a>
					<ul class="dropdown">
						<li><a href="#">Playstation</a></li>
						<li><a href="#">Windows</a></li>
						<li><a href="#">Mobile</a></li>
						<li><a href="#">Xbox</a></li>
					</ul></li>
				<li><a href="#">Videos <i class="fa fa-angle-down"></i></a>
					<ul class="dropdown">
						<li><a href="#">Playstation</a></li>
						<li><a href="#">Windows</a></li>
						<li><a href="#">Mobile</a></li>
						<li><a href="#">Xbox</a></li>
					</ul></li>
			</ul>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="hw-copyright">
			<p>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>
		<div class="hw-social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
		</div>
		<div class="hw-insta-media">
			<div class="section-title">
				<h5>Instagram</h5>
			</div>
			<div class="insta-pic">
				<img src="${path}/img/instagram/ip-1.jpg" alt=""> <img src="${path}/img/instagram/ip-2.jpg" alt=""> <img src="${path}/img/instagram/ip-3.jpg" alt=""> <img src="${path}/img/instagram/ip-4.jpg" alt="">
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
								<li class="signup-switch signup-open"><i class="fa fa-sign-out"></i> Login / Sign up</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-4">
						<div class="ht-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i class="fa fa-envelope-o"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="logo">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<a href="#"><img src="${path}/img/logo.png" alt=""></a>
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
						<li class="active"><a href="#"><span>Home</span></a></li>
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
											<h6>
												<a href="#">A Monster Prom poster got hijacked for a Papa Roach concert...</a>
											</h6>
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
											<h6>
												<a href="#">A new Borderlands 3 trailer introduces Moze and her...</a>
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
											<h6>
												<a href="#">Teamfight Tactics is in chaos after today's patch...</a>
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
											<h6>
												<a href="#">Borderlands 2 dev explains why there's mysterious boxes...</a>
											</h6>
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
											<h6>
												<a href="#">Capcom asks select fans to test new Resident Evil game</a>
											</h6>
											<ul>
												<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
												<li><i class="fa fa-comment-o"></i> 12</li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li><a href="#"><span>Hardware <i class="fa fa-angle-down"></i></span></a></li>
						<li><a href="#"><span>Reviews <i class="fa fa-angle-down"></i></span></a></li>
						<li><a href="#"><span>Windows <i class="fa fa-angle-down"></i></span></a></li>
						<li><a href="#"><span>Videos <i class="fa fa-angle-down"></i></span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- Header End -->

	<!-- 404 Section Begin -->
	<section class="section-404">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="text-404">
						<h1>500</h1>
						<h3>Opps! It's Not Your Mistake!</h3>
						<p>Sorry, Something Wrong.</p>
						<form action="#" class="search-404">
							<input type="text" placeholder="Enter your keyword">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 404 Section End -->

	<!-- Latest Preview Section Begin -->
	<section class="latest-preview-section page-404">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h5>Latest Preview</h5>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="lp-slider owl-carousel">
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-1.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Teamfight Tactics is in chaos after patch...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-2.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Lenovo’s y540 gaming laptop with an rtx 2060...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-3.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">A monter prom poster got hijacked for a...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-4.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Facebook wants to read your thoughts with...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-4.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Facebook wants to read your thoughts with...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-4.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Facebook wants to read your thoughts with...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="lp-item">
							<div class="lp-pic set-bg" data-setbg="${path}/img/latest-preview/lp-4.jpg">
								<div class="review-loader">
									<div class="loader-circle-wrap">
										<div class="loader-circle">
											<span class="circle-progress" data-cpid="id" data-cpvalue="75" data-cpcolor="#c20000"></span>
											<div class="review-point">7.5</div>
										</div>
									</div>
								</div>
							</div>
							<div class="lp-text">
								<h6>
									<a href="#">Facebook wants to read your thoughts with...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Preview Section End -->

	<!-- Footer Section Begin -->
	<section class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-about">
						<div class="fa-logo">
							<a href="#"><img src="${path}/img/f-logo.png" alt=""></a>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lacus vel facilisis.</p>
						<div class="fa-social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-youtube-play"></i></a> <a href="#"><i class="fa fa-instagram"></i></a>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="editor-choice">
						<div class="section-title">
							<h5>Editor's Choice</h5>
						</div>
						<div class="ec-item">
							<div class="ec-pic">
								<img src="${path}/img/trending/editor-1.jpg" alt="">
							</div>
							<div class="ec-text">
								<h6>
									<a href="#">A Monster Prom poster got hijacked for a Papa Roach concert...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
						<div class="ec-item">
							<div class="ec-pic">
								<img src="${path}/img/trending/editor-2.jpg" alt="">
							</div>
							<div class="ec-text">
								<h6>
									<a href="#">Facebook wants to read your thoughts with its augmented...</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
									<li><i class="fa fa-comment-o"></i> 12</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="tags-cloud">
						<div class="section-title">
							<h5>Tags Cloud</h5>
						</div>
						<div class="tag-list">
							<a href="#"><span>Gaming</span></a> <a href="#"><span>Platform</span></a> <a href="#"><span>Playstation</span></a> <a href="#"><span>Hardware</span></a> <a href="#"><span>Reviews</span></a> <a href="#"><span>Simulation</span></a> <a href="#"><span>Strategy</span></a> <a href="#"><span>Scientific</span></a> <a href="#"><span>References</span></a> <a href="#"><span>Role-playing</span></a> <a href="#"><span>Adventurea</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright-area">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="ca-text">Copyright &copy; 2019 Colorlib Inc. All rights reserved</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="ca-links">
							<a href="#">About</a> <a href="#">Subscribe</a> <a href="#">Contact</a> <a href="#">Support</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Footer Section End -->

	<!-- Sign Up Section Begin -->
	<div class="signup-section">
		<div class="signup-close">
			<i class="fa fa-close"></i>
		</div>
		<div class="signup-text">
			<div class="container">
				<div class="signup-title">
					<h2>Sign up</h2>
					<p>Fill out the form below to recieve a free and confidential</p>
				</div>
				<form action="#" class="signup-form">
					<div class="sf-input-list">
						<input type="text" class="input-value" placeholder="User Name*"> <input type="text" class="input-value" placeholder="Password"> <input type="text" class="input-value" placeholder="Confirm Password"> <input type="text" class="input-value" placeholder="Email Address"> <input type="text" class="input-value" placeholder="Full Name">
					</div>
					<div class="radio-check">
						<label for="rc-agree">I agree with the term & conditions <input type="checkbox" id="rc-agree"> <span class="checkbox"></span>
						</label>
					</div>
					<button type="submit">
						<span>REGISTER NOW</span>
					</button>
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