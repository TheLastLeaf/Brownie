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
 <script>
	 function fn_addBlack(){
		 confirm("블랙처리 하시겠습니까?")
		 const userId = $(".userId").val();
		 const bListSeq = $(".bListSeq").val();
		 const endDate = $(".endDate").val();
		 console.log(endDate)
		 $.ajax({
			 url: "./addblack",
			 type: "POST",
			 data: {
				 "userId": userId,
				 "bListSeq":bListSeq,
				 "endDate":endDate
			 },
			 success: function (data) {
				 console.log(data)
				 if (data === 1) {
					 alert("블랙처리 완료.")
					 location.reload();
				 }
			 },
			 error: function () {
				 alert("블랙 처리 접수 실패");
			 }
		 })
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
	                		<th>접수번호</th>
	                		<th>아이디</th>
	                		<th>신고내용</th>
	                		<th>접수날짜</th>
	                		<th colspan="2">관리</th>
	                	</tr>
						<c:forEach var="blackList" items="${blackList}">
							<c:if test="${blackList.status eq 'N'}">
								<tr>
									<th>${blackList.BListSeq}</th>
									<th>${blackList.userId}</th>
									<th>${blackList.reasonKind1}</th>
									<th>${blackList.inDate}</th>
									<th colspan="2">
										<button class="btn btn-outline-danger" onclick="fn_addBlack()">블랙하기</button>
										<button class="btn btn-outline-light" onclick="alert('better 회원의 정지를 해제하시겠습니까? 아직 기한이 남았습니다 어쩌구저쩌구')">해제하기</button>
									</th>
								</tr>
							<c:choose>
								<c:when test="${blacklist.reasonSeq == 1}">
									<input type="hidden" value="7" name="endDate" class="endDate">
								</c:when>
								<c:when test="${blacklist.reasonSeq == 2}">
									<input type="hidden" value="7" name="endDate" class="endDate">
								</c:when>
								<c:when test="${blacklist.reasonSeq == 3}">
									<input type="hidden" value="7" name="endDate" class="endDate">
								</c:when>
								<c:otherwise>
									<input type="hidden" value="3" name="endDate" class="endDate">
								</c:otherwise>
								</c:choose>
							<input type="hidden" value="${blackList.BListSeq}" name="bListSeq" class="bListSeq">
							<input type="hidden" value="${blackList.userId}" name="userId" class="userId">
							</c:if>
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