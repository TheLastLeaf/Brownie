<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>자유게시판</h3>
                <div>
					<a href="#" style="color: #ffffff;">[글쓰기]</a>               
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Categories list Section Begin -->
<section class="categories-list-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">우리동네 소갈비살 1kg 오만오천원</a></h5>
                        <ul>
                            <li>by <span>better</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">왜 살이 안빠지지 ..</a></h5>
                        <ul>
                            <li>by <span>낭니</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">존나 처먹으니까 안빠지지...</a></h5>
                        <ul>
                            <li>by <span>구나은</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">먹고싶은걸 어떻게 참는걸까?</a></h5>
                        <ul>
                            <li>by <span>ㄱㄴ</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">날린거 다시쓰기 존나귀찮다</a></h5>
                        <ul>
                            <li>by <span>Aㅁㄴㅇㅁㄴ</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">ㄴㅇㄻㅇㅎㄴㅇㅁㅇㄴㅇㅁㄴㅇ..</a></h5>
                        <ul>
                            <li>by <span>Ad3223n</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
                <div class="cl-item">
                    <div class="cl-pic">
                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                    </div>
                    <div class="cl-text">
                        <h5><a href="#">공포겜 하실분</a></h5>
                        <ul>
                            <li>by <span>Admin</span></li>
                            <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                            <li><i class="fa fa-comment-o"></i> 20</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-7 p-0">
                <div class="sidebar-option">
                    <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of Best</h5>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-1" data-cpvalue="95"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point" style="text-align: center;">99+</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">여기는 추천수 두 자릿 수 이상 게시글</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-2" data-cpvalue="85"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">43</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">어제자 롤드컵 개쩌는장면</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-3" data-cpvalue="80"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">84</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">롤 개갓겜아니냐?</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                        <div class="bp-item">
                            <div class="bp-loader">
                                <div class="loader-circle-wrap">
                                    <div class="loader-circle">
                                            <span class="circle-progress-1" data-cpid="id-4" data-cpvalue="75"
                                                  data-cpcolor="#c20000"></span>
                                        <div class="review-point">66</div>
                                    </div>
                                </div>
                            </div>
                            <div class="bp-text">
                                <h6><a href="#">마라샹궈 먹고싶네</a></h6>
                                <ul>
                                    <li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
                                    <li><i class="fa fa-comment-o"></i> 20</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       
           <div class="col-lg-12" style="justify-content: center; align-content: center; text-align: center;">
             <div class="board_search" style="margin-bottom: 30px;">
             	<select style="border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;">
             		<option value="title">제목</option>
             		<option value="content">내용</option>
             		<option value="author">작성자</option>
             	</select>
             	<input type="text" style="width: 200px; border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;" placeholder="search" />
            	<input type="button" style="border:1px solid black; font-size: 13px; color: #ffffff; background-color: #222222;" value="search" />
             </div>
             <div class="pagination-item">
                 <a href="#"><span>Prev</span></a>
                 <a href="#"><span>1</span></a>
                 <a href="#"><span>2</span></a>
                 <a href="#"><span>3</span></a>
                 <a href="#"><span>Next</span></a>
             </div>
            </div>
       
        </div>
    </div>
</section>
<!-- Categories List Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>