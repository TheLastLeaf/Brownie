<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:import url="../layout/header.jsp"/>
<!-- Details Hero Section Begin -->
<section class="details-hero-section set-bg"
         data-setbg="http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${tipVO.boardCategory}_0.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="details-hero-text">
                    <div class="label"><span>${tipVO.boardCategory}</span></div>
                    <h3>${tipVO.title}</h3>
                    <ul>
                        <li>by <span>${tipVO.inUserId}</span></li>
                        <li>
                            <i class="far fa-clock"></i>
                            <fmt:formatDate value="${tipVO.inDate}" pattern="yyyy-MM-dd HH:mm:ss" var="date"/>
                            ${date}
                        </li>
                        <li><i class="far fa-comment"></i> 20</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Hero Section End -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="p-0">
            <div class="details-text">
                ${tipVO.content}

                <div class="dt-author">
                    <div class="da-pic">
                        <img src="/img/details/author-pic.jpg" alt="">
                    </div>
                    <div class="da-text">
                        <h5>Almil Hmaper</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                            exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        <div class="da-links">
                            <a href="#"><i class="fab fa-facebook"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-google-plus"></i></a>
                            <a href="#"><i class="fab fa-instagram"></i></a>
                            <a href="#"><i class="fab fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="dt-comment">
                    <h4>3 comment</h4>
                    <div class="dc-item">
                        <div class="dc-pic">
                            <img src="/img/details/comment/comment-1.jpg" alt="">
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
                            <img src="/img/details/comment/comment-2.jpg" alt="">
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
                            <img src="/img/details/comment/comment-3.jpg" alt="">
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
                <div class="dt-leave-comment">
                    <h4>Leave a comment</h4>
                    <form action="#">
                        <div class="input-list">
                            <input type="text" placeholder="Name">
                            <input type="text" placeholder="Email">
                            <input type="text" placeholder="Website">
                        </div>
                        <textarea placeholder="Message"></textarea>
                        <button type="submit">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>