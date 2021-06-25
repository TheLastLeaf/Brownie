<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>


<!-- Hero Section Begin -->
<section class="hero-section">
    <div class="container">
        <div class="row">
        </div>
    </div>
    <div class="hero-slider owl-carousel">
        <div class="hs-item set-bg" data-setbg="${path}/img/hero/hero-1.jpg"></div>
        <div class="hs-item set-bg" data-setbg="${path}/img/hero/hero-2.jpg"></div>
        <div class="hs-item set-bg" data-setbg="${path}/img/hero/hero-3.jpg"></div>
    </div>
</section>
<!-- Hero Section End -->

<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>