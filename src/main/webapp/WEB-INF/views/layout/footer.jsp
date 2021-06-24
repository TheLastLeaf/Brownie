<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021-06-24
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- Footer Section Begin -->
<footer class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <div class="footer-about">
                    <div class="fa-logo">
                        <a href="#"><img src="${path}/img/f-logo.png" alt=""></a>
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
                            <img src="${path}/img/trending/editor-1.jpg" alt="">
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
                            <img src="${path}/img/trending/editor-2.jpg" alt="">
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
                        Copyright &copy;<script>document.write(new Date().getFullYear().toString());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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