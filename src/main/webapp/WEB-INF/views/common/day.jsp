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
                        <span>Contact</span>
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

console.log("${dateForCheck}")


window.onload = function () {
	const year = ${dateForCheck.get('day')};			//올해
	const month = ${dateForCheck.get('month')};			//이번달
	const day = ${dateForCheck.get('day')};				//오늘날짜
	const lastDate = ${dateForCheck.get('lastDate')};	//마지막날짜

	const weekNum = ${dateForCheck.get('firstDay')};
	const week = ['','일','월','화','수','목','금','토'];	//1일 2월 3화 4수 5목 6금 7토
	const firstDay = week[weekNum];	//이번달 시작 요일

	console.log(year);
	console.log(month);
	console.log(firstDay);
	console.log(lastDate);
	console.log(day);

	//이번달 날짜수가 들어간 배열
	let allDayInThisMonth = [Array(lastDate)];
	for(var i = 0 ; i < lastDate ; i++){
		allDayInThisMonth[i] = i+1;
		console.log(allDayInThisMonth[i]);
	}

	allDayInThisMonth.forEach((date, i)=>{
		allDayInThisMonth[i] = "<div class='date' id='day'"+allDayInThisMonth[i]+">"+allDayInThisMonth[i]+"</div>";
	})

	//앞 칸 추가
	frontDiv = "";
	for(i = 0 ; i < weekNum-1 ; i++){
		frontDiv += "<div class='date'></div>"
	}

	calDay = frontDiv + allDayInThisMonth.join('');
	console.log(frontDiv);
	console.log(calDay);
	$('#dates').html(calDay);



}
</script>
<!-- 달력 스크립트 끝 -->

<!-- 달력 스타일 시작 -->
<style>
.days {
	display: flex;
	margin: 25px 0 10px;
}

.day {
	width: calc(100% / 7);
	text-align: center;
}

.dates {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;

	grid-template-rows: 1fr 1fr 1fr;

	border-top: 1px solid #333333;
	border-right: 1px solid #333333;
}

.date {
	align-self: stretch;
	text-align: center;
	border-bottom: 1px solid #333333;
	border-left: 1px solid #333333;
}

</style>
<!-- 달력 스타일 끝 -->

<!-- Contact Section Begin -->
<section class="contact-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">

				<!-- 달력 시작 -->
				<div class="calendar">
				        <div class="header">
				            <div class=""></div>
				        </div>
				        <div class="main">
				            <div class="days">
				                <div class="day">일</div>
				                <div class="day">월</div>
				                <div class="day">화</div>
				                <div class="day">수</div>
				                <div class="day">목</div>
				                <div class="day">금</div>
				                <div class="day">토</div>
				            </div>
				            <div id="dates">2</div>
				        </div>
				    </div>
				<!-- 달력 끝 -->

            </div>
        </div>
    </div>
</section>
<!-- Contact Section End -->
<c:import url="../layout/footer.jsp"/>