<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>출석체크</h3>
                    <div class="bt-option">
                        <a href="./home">Home</a>
                        <span>calendar</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- 달력 스크립트 시작 -->
<script>
    const inUserId = '${sessionScope.id}';

    const year = ${dateForCheck.get('year')};			//올해
    const month = ${dateForCheck.get('month')};			//이번달
    const day = ${dateForCheck.get('day')};				//오늘날짜
    const lastDate = ${dateForCheck.get('lastDate')};	//마지막날짜
    const weekNum = ${dateForCheck.get('firstDay')};    //1일 2월 3화 4수 5목 6금 7토
    const UserCheckeddates = ${dateList};				//유저가 출석 체크한 날짜

    window.onload = function () {
        var tbcal = document.getElementById("calendar"); // 달력 테이블
        while (tbcal.rows.length > 2) {
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;

        // 1일 시작칸 찾기
        for (i = 0; i < weekNum - 1; i++) {
            cell = row.insertCell();
            cnt = cnt + 1;
        }

        // 달력 출력
        for (i = 1; i <= lastDate; i++) // 1일부터 마지막 일까지
        {
            cell = row.insertCell();
            cell.innerHTML = "<span id='" + i + "' style='font-size:70px; cursor:default;'>" + i + "</span>";
            cnt = cnt + 1;
            if (cnt % 7 == 1) {//일요일
                cell.innerHTML = "<span id='" + i + "' style='font-size:70px; color:#FF9090; cursor:default;'>" + i + "</span>";
            }
            if (cnt % 7 == 0) { //토요일
                cell.innerHTML = "<span id='" + i + "' style='font-size:70px; color:#7ED5E4; cursor:default;'>" + i + "</span>";
                row = calendar.insertRow();// 줄 추가
            }

            //이미 체크된 날짜 마우스 커서 바꿔주기
            if (UserCheckeddates.indexOf(i) > -1) {
                document.getElementById(i).innerHTML = "<i class='fa fa-cloud'></i>";
            }
            //오늘 날짜일 경우 출석체크 함수 이벤트 추가
            if (i == day) {
                document.getElementById(i).addEventListener("click", dateCheck);
                document.getElementById(i).style.cursor = 'pointer';
            }
        }
    }

    let checkedFlag = false;	//디비 연결되면 지울 것

    //사용자가 출석체크 할 때 작동하는 함수
    function dateCheck() {
        if (inUserId == '') {
            alert("로그인이 필요합니다.");
            return;
        }
        $.ajax({
            url: "../attendance/ajax.dayCheck",
            type: "get",
            data: {
                "inUserId": inUserId
            },
            success: function (data) {
                location.reload();
            },
            error: function () {
                alert("에러나요");
            }
        })
    }

</script>
<!-- 달력 스크립트 끝 -->

<!-- 달력 스타일 시작 -->
<style>
    td {
        width: 300px;
        height: 170px;
        text-align: center;
    }

    th {
        color: #FFDAB9;
        text-align: center;
        background-color: #800000;
        border-radius: 40px 40px;
    }

    .cal {
        margin: auto;
    }

    #calendar {
        margin: auto;
    }
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
                        <div style="text-align: center; margin: 10px; color: #999999;">오늘 날짜를 클릭하면 출석체크가 완료됩니다!</div>
                        <!-- 				            <div class="" style="text-align: center; font-size: calc(16px + 6vw); color: #FFDAB9; background-color:	#800000; border-radius: 40px 40px;">브라우니 출석체크</div> -->
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