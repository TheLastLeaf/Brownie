<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>정지목록</h3>
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
	                		<th>신고분류</th>
	                		<th>신고내용</th>
	                		<th>정지기한</th>
	                		<th>상태</th>
	                		<th>관리</th>
	                	</tr>
	                	<tr>
	                		<th>1</th>
	                		<th>better</th>
	                		<th>욕설</th>
	                		<th>계속 뻐큐함</th>
	                		<th>2022.12.12.</th>
	                		<th>정지중</th>
	                		<th><button onclick="alert('better 회원의 정지를 해제하시겠습니까? 아직 기한이 남았습니다 어쩌구저쩌구')">해제하기</button></th>
	                	</tr>
	                	<tr>
	                		<th>2</th>
	                		<th>nine</th>
	                		<th>스팸</th>
	                		<th>광고성 게시글 도배</th>
	                		<th>2020.03.23</th>
	                		<th>해제</th>
	                		<th><button onclick="alert('이미 정지 기한이 종료된 회원입니다.')">해제하기</button></th>
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