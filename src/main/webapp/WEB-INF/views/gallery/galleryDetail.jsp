<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<script>
	

</script>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text gallery-page">
                    <div class="dt-title-gallery details-hero-text">
                        <h1 style="color: white">${ galleryVO.title }</h1>
                    </div>
                    <div class="dt-desc">
                    	<input type="button" onclick="location.href='${pageContext.request.contextPath}/gallery/update?boardSeq=${galleryVO.boardSeq}'" value="수정" />
                    	<input type="button" onclick="location.href='${pageContext.request.contextPath}/gallery/delete?boardSeq=${galleryVO.boardSeq}'" value="삭제" />
	                    <c:forEach var="fileVO" items="${fileVOList}">
		                    <img src="${pageContext.request.contextPath}/img/gallery/${fileVO.saveName}">
	                	</c:forEach>
		                    
                    	${ galleryVO.content }
                    	
                    </div>

                    <div class="dt-tags">
                        <a href="#"><span>Gaming</span></a>
                        <a href="#"><span>Platform</span></a>
                        <a href="#"><span>Playstation</span></a>
                        <a href="#"><span>Hardware</span></a>
                    </div>

                    <div class="dt-related-post">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="#" class="rp-prev">
                                    <span>Prev</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/details/prev.jpg" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>The Real-Estate Developers Are the Enemy</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <a href="#" class="rp-next">
                                    <span>Next</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/details/next.jpg" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>Montreal real estate: Bargains in cottage countrya</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-author">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <h5>Almil Hmaper</h5>
                            <p>글쓴이 소개</p>

                        </div>
                    </div>
                    <div class="dt-comment">
                        <h4>3 comment</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
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
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
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
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-3.jpg" alt="">
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
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>