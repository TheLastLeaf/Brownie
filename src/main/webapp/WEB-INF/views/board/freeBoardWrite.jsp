<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${path}"/>
</c:import>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 p-0">
                <div class="details-text">
                    <div class="dt-quote">
                        <span style="color: white">제목</span>&nbsp;
                        <input type="text" style="width:75%; border:none; background-color:#252525; color:white;" placeholder="제목을 입력하세요" />
                    </div>
                    <div>
                    	태그 넣는게 있어야 할 것 같은디 고민 좀 해보겟음
                    </div>
					<div class="dt-leave-comment">
                        <form action="#">
                            <textarea placeholder="이곳에 내용을 입력하세요"></textarea>
                            <button type="submit">글쓰기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>