<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${path}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>공지사항 등록</h3>
                    <div class="bt-option">
                        <a href="/index">Home</a>
                        <span>notice Add</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="contact-text">
                    <div class="contact-form">
                        <div class="dt-leave-comment">
                            <form action="/notice/detail">
                                <div class="input-list">
                                    <input type="text" placeholder="Title" style="width: 98%;">
                                </div>
                                <textarea placeholder="Message" style="height: 500px;" id="notice_content"
                                          class="notice_content"></textarea>
                                <div id="file">
                                    <input type="file" value="파일선택" style="width: 20%; color: #666666;">
                                </div>
                                <br/>
                                <button type="submit">등록</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>