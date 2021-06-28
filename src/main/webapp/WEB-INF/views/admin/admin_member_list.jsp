<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>




<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>