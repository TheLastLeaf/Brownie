<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-06-24
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Footer Section Begin -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="footer-about">
						<div class="fa-logo">
							<a href="#"><img src="${param.path}/img/brownie-footer.png" alt=""></a>
						</div>
						<p>게임을 즐기는 시간만큼 브라우니에서 보내는 시간도 달고 맛있길 바랍니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="editor-choice">
						<div class="section-title">
							<h5>여기다 광고넣을까?</h5>
						</div>
						<div class="ec-item">
							<div class="ec-pic">
								<img src="${param.path}/img/trending/editor-1.jpg" alt="">
							</div>
							<div class="ec-text">
								<h6>
									<a href="#">여기 뭘로 채움?</a>
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
								<h6>
									<a href="#">그냥 지우나?</a>
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
							<h5>DEVELOPERS</h5>
						</div>
						<div class="tag-list">
							<a href="https://github.com/hyun-on" target="_blank"><span>김현주</span></a> <a href="https://github.com/RIRINTO" target="_blank"><span>이학재</span></a>
							<a href="https://github.com/ParkSeWoong95" target="_blank"><span>박세웅</span></a> <a href="https://github.com/JH1550" target="_blank"><span>곽지훈</span></a>
							<a href="https://github.com/9-better" target="_blank"><span>구나은</span></a>
						</div>
					</div>
				</div>
			</div>
			<div class="copyright-area">
				<div class="row">
					<div class="col-lg-6">
						<div class="ca-text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with by <a
									href="https://colorlib.com" target="_blank">Colorlib</a> and 마지막 잎새
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
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
<script src="${param.path}/js/jquery-3.3.1.min.js"></script>
<script src="${param.path}/js/bootstrap.min.js"></script>
<script src="${param.path}/js/jquery.magnific-popup.min.js"></script>
<script src="${param.path}/js/circle-progress.min.js"></script>
<script src="${param.path}/js/jquery.barfiller.js"></script>
<script src="${param.path}/js/jquery.slicknav.js"></script>
<script src="${param.path}/js/owl.carousel.min.js"></script>
<script src="${param.path}/js/main.js"></script>
</body>

</html>