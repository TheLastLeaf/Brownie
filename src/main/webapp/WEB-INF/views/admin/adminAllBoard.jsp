<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>


<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12"  style="justify-content: center; align-content: center; text-align: center; color:white;">
				대충보드리스트

            </div>
	    </div>
	</div>
</section>
 
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>