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
							<a href="#"><img src="${pageContext.request.contextPath}/img/layout/brownie-footer.png" alt=""></a>
						</div>
						<p>게임을 즐기는 시간만큼 브라우니에서 보내는 시간도 달고 맛있길 바랍니다.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="editor-choice">
						<div class="section-title">
							<h5>여기다 게임배너 넣을거임</h5>
						</div>
						<div class="ec-item">
							<div class="ec-pic">
								<img src="${pageContext.request.contextPath}/img/trending/editor-1.jpg" alt="">
							</div>
							<div class="ec-text">
								<h6>
									<a href="#">부루마블</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i>잔여시간</li>
								</ul>
							</div>
						</div>
						<div class="ec-item">
							<div class="ec-pic">
								<img src="img/trending/editor-2.jpg" alt="">
							</div>
							<div class="ec-text">
								<h6>
									<a href="#">빙고어쩌구</a>
								</h6>
								<ul>
									<li><i class="fa fa-clock-o"></i>잔여시간</li>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js" integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js" integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://raw.githubusercontent.com/9bitStudios/barfiller/master/js/jquery.barfiller.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.js" integrity="sha512-AmJ0T6lpw/ZQtCleMyfbraDy8AGQ9tWaB/PmRkXdKxH9Kvo0oTuW6+2hTEQ89mHkFIO/LpColEe3+QE+FJtgIg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js" integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>

</html>