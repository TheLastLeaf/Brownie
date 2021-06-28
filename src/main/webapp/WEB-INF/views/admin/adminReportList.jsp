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
                    <h3>신고목록</h3>
                <div>
					<a href="#" style="color: #ffffff;">[돌아가기]</a>               
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<script>
	
	var clickFlag = false;
	
	function makeStop(id){
		
	}

</script>

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
	                		<th>신고자 아이디</th>
	                		<th>신고일자</th>
	                		<th>정지기한</th>
	                		<th>처리상태</th>
	                	</tr>
	                	<tr>
	                		<th>1</th>
	                		<th>better</th>
	                		<th>욕설</th>
	                		<th>계속 뻐큐함</th>
	                		<th>gg</th>
	                		<th>2021.06.26.</th>
	                		<th><input name='date' type='date' /> <input type='submit' value='완료' /></th>
	                		<th><i class="fa fa-close"></i></th>
	                	</tr>
	                	<tr>
	                		<th>2</th>
	                		<th>nine</th>
	                		<th>스팸</th>
	                		<th>광고성 게시글 도배</th>
	                		<th>qq</th>
	                		<th>2021.06.26.</th>
	                		<th><input name='date' type='date' /> <input type='submit' value='완료' /></th>
	                		<th><i class="fa fa-check"></i></th>
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


<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${path}"/>
</c:import>