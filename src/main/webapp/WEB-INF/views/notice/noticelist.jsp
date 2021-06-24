<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="/${path}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>공지사항</h3>
                    <div class="">
                        <span onclick="location.href='index'" style="color: white; cursor: pointer;">Home</span>
                        <span style="color: #666666"> / </span>
                        <span onclick="location.href='index'" style="color: red; cursor: pointer;">Latest posts</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

    <!-- Categories list Section Begin -->
    <section class="categories-list-section spad">
        <div style="margin-left: 83.5%;">
            <input type="button" class="btn btn-outline-dark btn-sm" value="글쓰기" style="color: white;" onclick="location.href='noticeAdd'">
        </div>
        <div style="margin-bottom: 2%">
            <hr style="background-color: white; width: 75%; text-align: center;">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="/${path}/img/categories-list/cl-1.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">자유게시판</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>자유게시판 공지사항</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="/${path}/img/categories-list/cl-2.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">팬아트갤러리</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>팬아트 공지사항</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="/${path}/img/categories-list/cl-3.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">팬아트 갤러리</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>팬아트 갤러리 공지사항	</p>
                        </div>
                    </div>
                    <div class="cl-item">
                        <div class="cl-pic">
                            <img src="/${path}/img/categories-list/cl-4.jpg" alt="">
                        </div>
                        <div class="cl-text">
                            <div class="label"><span>공지사항</span></div>
                            <h5><a href="/noticedetail">궁금증과 답변을 한 번에! 무엇이든 물어보세요 오픈!</a></h5>
                            <ul>
                                <li>by <span>Admin</span></li>
                            </ul>
                            <p>평소의 궁금증을 풀기도 하고 다양한 고민도 해결할 수 있는 곳.
									무엇이든 물어보세요 게시판이 새롭게 열렸습니다.   
									질문 및 답변을 남겨주실 때는 본인뿐만 아니라 타인의 입장에서
									상처가 되진 않을지 혹은 좋지 않은 표현이 담겨 있지 않은지
									한 번씩만 생각해서 글을 남겨주시면 많은 이야기를 나눌 수 있는 게시판이 될 것 같습니다.</p>
                        </div>
                    </div>
                <form>
                    <div class="innerBox text-center">
                        <span>
                            <select name="notice" style="height:30px; background: black; color: #666666;">
                                <option value="" selected="selected">선택</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                                <option value="writer">작성자</option>
                            </select>
                            <input type="text" value="" style="background: black; color: #666666">
                        </span>
                    <input type="submit" class="btn btn-outline-dark" value="조회" style="color: #666666">
                   </div>
                </form>
                <div class="pagination-item">
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
    <c:param name="path" value="${path}"/>
</c:import>