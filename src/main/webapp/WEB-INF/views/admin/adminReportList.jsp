<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/thresh.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>신고목록</h3>
                <div>
					<a href="/admin" style="color: #ffffff;">[돌아가기]</a>
                </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<script>

function selectAll(selectAll)  {
	  const checkboxes
	       = document.getElementsByName('addBlack');

	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

</script>

<style>
.reportListdiv {
	justify-content: center;
	align-content: center;
	text-align: center;
	color:white;
}

.reportListTable {
	border:1px solid grey;
	border-left: none;
	border-right: none;
	margin: auto;
	width: 100%;
}

.reportListTd {
	padding: 10px;
}

.reportContentTd {
	width: 50%;
}

.reportPageBottom {
	padding-top: 50px;
}
</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 reportListdiv">
	            <div class="">
	                <table class="reportListTable">
	                	<tr>
	                		<th class="reportListTd">순번</th>
	                		<th class="reportListTd">
	                			<input type="checkbox" name="selectAll" onclick="selectAll(this)"/>
	                		</th>
	                		<th class="reportListTd">아이디</th>
	                		<th class="reportListTd">신고분류</th>
	                		<th class="reportListTd reportContentTd">신고내용</th>
	                		<th class="reportListTd">신고자</th>
	                		<th class="reportListTd">신고일자</th>
	                		<th class="reportListTd">처리상태</th>
	                	</tr>
	                	<c:forEach var="reportList" items="${reportList }"  varStatus="status">
		                	<tr>
		                		<th class="reportListTd">${status.index }</th>
		                		<c:choose>
		                		<c:when test="${reportList.status eq 'N' }">
		                		<th class="reportListTd">
		                			<input type="checkbox" name="addBlack" value="${reportList.userId }" />
		                		</th>
		                		</c:when>
		                		<c:when test="${reportList.status eq 'Y' }">
		                		<th class="reportListTd">
		                			<input type="checkbox" name="alreadyCheck" value="${reportList.userId }" disabled="disabled" />
		                		</th>
		                		</c:when>
		                		<c:otherwise>
		                		<th class="reportListTd">
		                			<input type="checkbox" name="alreadyCheck" value="${reportList.userId }" checked="checked" disabled="disabled">
		                		</th>
		                		</c:otherwise>
		                		</c:choose>
		                		<th class="reportListTd">${reportList.userId }</th>
		                		<th class="reportListTd">${reportList.reportName }</th>
		                		<th class="reportListTd">${reportList.content }</th>
		                		<th class="reportListTd">${reportList.inUserId }</th>
		                		<th class="reportListTd">${reportList.inDate }</th>
		                		<c:choose>
		                		<c:when test="${reportList.status eq 'N' }">
		                			<th class="reportListTd"><i class="fas fa-times"></i></th>
		                		</c:when>
		                		<c:when test="${reportList.status eq 'Y' }">
		                			<th class="reportListTd"><i class="far fa-circle"></i></th>
		                		</c:when>
		                		<c:otherwise>
								<th class="reportListTd">??</th>
		                		</c:otherwise>
		                		</c:choose>
		                	</tr>
	                	</c:forEach>
	                </table>
	                <div class="reportPageBottom">
	                 <div class="pagination-item">
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