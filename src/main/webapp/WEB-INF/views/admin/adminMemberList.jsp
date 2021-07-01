<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>멤버 목록</h3>
                <div>
					<a href="#" style="color: #ffffff;">[돌아가기]</a>               
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
	                <table border="1px solid grey" style="margin: auto;">
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
	                	<tr>
	                		<th>1</th>
	                		<th>better</th>
	                		<th>없음</th>
	                		<th>브라우니말고까눌레</th>
	                		<th>3</th>
	                		<th>2016.05.02</th>
	                		<th>2</th>
	                		<th>활성</th>
	                	</tr>
	                	<tr>
	                		<th>2</th>
	                		<th>nine</th>
	                		<th>초갈</th>
	                		<th>니얼굴쓰레쉬</th>
	                		<th>4</th>
	                		<th>2010.04.12</th>
	                		<th>3</th>
	                		<th>탈퇴</th>
	                	</tr>
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