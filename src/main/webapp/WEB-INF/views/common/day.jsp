<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>Contact us</h3>
                    <div class="bt-option">
                        <a href="./home">Home</a>
                        <span>출석체크</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->


<!-- 달력 스크립트 시작 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	window.onload = function () {
		const year = ${dateForCheck.get('day')};			//올해
		const month = ${dateForCheck.get('month')};			//이번달
		const day = ${dateForCheck.get('day')};				//오늘날짜
		const lastDate = ${dateForCheck.get('lastDate')};	//마지막날짜
		const weekNum = ${dateForCheck.get('firstDay')};    //1일 2월 3화 4수 5목 6금 7토

		var tbcal = document.getElementById("calendar"); // 달력 테이블
		while (tbcal.rows.length > 2)
	    {
	        tbcal.deleteRow(tbcal.rows.length - 1);
	    }
	    var row = null;
	    row = tbcal.insertRow();
	    var cnt = 0;

	    // 1일 시작칸 찾기
	    for (i = 0; i < weekNum-1; i++)
	    {
	        cell = row.insertCell();
	        cnt = cnt +1;
	    }

	    // 달력 출력
	    for (i = 1; i <= lastDate; i++) // 1일부터 마지막 일까지
	    {
	        cell = row.insertCell();
	        cell.innerHTML = i;
	        cnt = cnt + 1;
	        if (cnt % 7 == 1) {//일요일
	            cell.innerHTML = "<font color=#FF9090>" + i//일요일에 색
	        }
	        if (cnt % 7 == 0) { //토요일
	            cell.innerHTML = "<font color=#7ED5E4>" + i//토요일에 색
	            row = calendar.insertRow();// 줄 추가
	        }
	    }
	}
</script>
<!-- 달력 스크립트 끝 -->

<!-- 달력 스타일 시작 -->
<style>


</style>
<!-- 달력 스타일 끝 -->

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

				<!-- 달력 시작 -->
				<div class="cal">
				        <div class="header">
				            <div class=""></div>
				        </div>
				        <table id="calendar">
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
				        </table>

				    </div>
				<!-- 달력 끝 -->

            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<c:import url="../layout/footer.jsp"/>