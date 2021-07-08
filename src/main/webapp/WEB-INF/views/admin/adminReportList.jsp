<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
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
	                		<th>처리상태</th>
	                	</tr>
	                	<c:forEach var="reportList" items="${reportList }"  varStatus="status">
		                	<tr>
		                		<th>${status.index }</th>
		                		<th>${reportList.userId }</th>
		                		<th>${reportList.reportName }</th>
		                		<th>${reportList.content }</th>
		                		<th>${reportList.inUserId }</th>
		                		<th>${reportList.inDate }</th>
		                		<th><i class="fas fa-times"></i></th>
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