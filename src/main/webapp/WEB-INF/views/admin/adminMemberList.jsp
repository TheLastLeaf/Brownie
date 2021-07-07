<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/nunu.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>멤버 목록</h3>
                <div>
					<a href="/admin" style="color: #ffffff;">[돌아가기]</a>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12"  style="justify-content: center; align-content: center; text-align: center; color:white;">
	            <div class="">
	                <table border="1px solid #d2d2d2" style="margin: auto; width: 100%; cursor: default;">
	                	<tr>
	                		<th>순번</th>
	                		<th>아이디</th>
	                		<th>롤 닉네임</th>
	                		<th>브라우니 닉네임</th>
	                		<th>브라우니 레벨</th>
	                		<th>가입일자</th>
	                		<th>권한 레벨</th>
	                		<th>상태</th>
	                	</tr>
	                	<c:forEach var="userList" items="${userList }"  varStatus="status">
		                	<tr>
		                		<th>${status.index }</th>
		                		<th>${userList.userId }</th>
		                		<th>${userList.lolId }</th>
		                		<th>${userList.nickName }</th>
		                		<th>Lv. ${userList.userLevel }</th>
		                		<th>${userList.inDate }</th>
		                		<th>${userList.permitLevel }</th>
								<c:set var="userStatus" value="${userList.status }"/>
		                		<c:choose>
									<c:when test="${userStatus eq 'Y'}">
			                		<th>활동</th>
									</c:when>
									<c:when test="${userStatus eq 'N'}">
			                		<th>탈퇴</th>
									</c:when>
									<c:when test="${userStatus eq 'B'}">
			                		<th>정지</th>
									</c:when>
								</c:choose>
		                	</tr>
	                	</c:forEach>

	                </table>
	                <div>

	                 <div class="pagination-item" style="padding-top: 50px;">
		                 <a href="#"><span>Prev</span></a>
		                 <a href="#"><span>1</span></a>
		                 <a href="#"><span>2</span></a>
		                 <a href="#"><span>3</span></a>
		                 <a href="#"><span>Next</span></a>
		             </div>

	                </div>

	            </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>