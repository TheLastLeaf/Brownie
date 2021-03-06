<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/thresh.jpg">
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
    function fn_submit(reportSeq) {
        if(!confirm("블랙리스트로 추가하시겠습니까?")){
            return false;
        }
        const userId = $("#" + reportSeq + " .userId").val();
        const reasonSeq = $("#" + reportSeq + " #reason option:selected").val();
        const bListSeq = $(".bListSeq").val();
        const endDate = $(".endDate").val();

        $.ajax({
            url: "./blackList",
            type: "POST",
            data: {
                "userId": userId,
                "reportSeq": reportSeq,
                "reasonSeq": reasonSeq,
                "bListSeq": bListSeq,
                "endDate": endDate
            },
            success: function (data) {
                console.log(data)
                if (data === "ok") {
                    alert("블랙리스트 추가 완료.")
                    location.reload();
                }
            },
            error: function () {
                alert("신고 접수 실패");
            }
        })
    }

    function fn_deleteReport(reportSeq){
        if(!confirm("접수취소하시겠습니까?")){
            return false;
        }
        $.ajax({
            url: "./deleteReport.ajax",
            type: "POST",
            data: {
                "reportSeq": reportSeq
            },
            success: function (data) {
                if (data === 1) {
                    alert("신고접수 취소 완료!")
                    location.reload();
                }
            },
            error: function () {
                alert("신고접수 취소 실패");
            }
        })
    }

    function fn_detail(reportSeq){
        window.open("/admin/reportDetail?reportSeq=" + reportSeq ,"REPORTDETAIL", "width=660, height=500, left=250,top=200")

    }
    $(document).ready(function(){
        $('[data-trigger="hover"]').popover();
    });

</script>

<style>
    .reportListdiv {
        justify-content: center;
        align-content: center;
        text-align: center;
        color: white;
    }

    .reportListTable {
        border: 1px solid grey;
        border-left: none;
        border-right: none;
        margin: auto;
        width: 100%;
    }

    .reportListTd {
        padding: 10px;
    }

    .reportContent {
        width: 25%;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    .reportPageBottom {
        padding-top: 50px;
    }

    .but {
        cursor: pointer;
    }

    #reason {
        width: 100%;
        background-color: black;
        color: white;
        height: 43px;
        vertical-align: center;
        text-align-last: center;
    }

    .reportInfo {
        color: wheat;
    }
</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="reportInfo">
                 * 좌측 유저 닉네임을 클릭할 경우 신고 내용에 해당하는 자료가 팝업됩니다.
            </div>
            <div class="col-lg-12 reportListdiv">
                <table class="reportListTable" border="1px solid grey" style="margin-bottom: auto">
                    <tr>
                        <th class="reportListTd" style="width: 160px">닉네임</th>
                        <th class="reportListTd" style="width: 400px">신고내용</th>
                        <th class="reportListTd" style="width: 150px">신고자</th>
                        <th class="reportListTd" style="width: 250px">신고일자</th>
                        <th class="reportListTd" style="width: 100px">제재 항목</th>
                        <th class="reportListTd">접수</th>
                        <th class="reportListTd">취소</th>
                    </tr>
                    <c:forEach var="reportList" items='${ReportPagingVO.reportVOList }'>
                        <c:if test='${reportList.status eq "N"}'>
                            <tr id='${reportList.reportSeq}'>
                                <th class="reportListTd" onclick="fn_detail('${reportList.reportSeq}')" style="cursor: pointer;">
                                        ${reportList.targetNickname}
                                </th>
                                <th title="신고내용" data-toggle="popover" data-trigger="hover" data-placement="right" data-content="${reportList.content}" class="reportListTd" style="cursor: pointer;">
                                        ${reportList.reportName }
                                </th>
                                <th class="reportListTd">${reportList.inuserNickname }</th>
                                <th class="reportListTd">${reportList.inDate }</th>
                                <th style="text-align: center">
                                    <select id="reason">
                                        <option class="reason" selected value="1">욕설</option>
                                        <option class="reason" value="2">사칭</option>
                                        <option class="reason" value="3">광고</option>
                                        <option class="reason" value="4">그냥</option>
                                    </select>
                                </th>
                                <input type="hidden" name="userId" value='${reportList.userId}'
                                       class="userId">
                                <input type="hidden" name="reportSeq" value='${reportList.reportSeq}'
                                       class="reportSeq">
                                <th class="reportListTd"><i class="fas fa-check"
                                                            onclick="fn_submit(${reportList.reportSeq})"
                                                            class="but"></i>
                                </th>
                                    <th class="reportListTd">
                                        <i class="fas fa-times" style="cursor: pointer " onclick="fn_deleteReport('${reportList.reportSeq}')"></i>
                                    </th>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
                <div class="reportPageBottom">
                    <div class="pagination-item">
                        <c:if test="${1 < ReportPagingVO.startPageNumber}">
                            <a href='${pageContext.request.contextPath}/admin/adminReportList?pageNum=${ReportPagingVO.startPageNumber - 1}'><span>Prev</span></a>
                        </c:if>
                        <c:forEach var="pageNumber" begin="${ReportPagingVO.startPageNumber}"
                                   end="${ReportPagingVO.endPageNumber}">
                            <a href='${pageContext.request.contextPath}/admin/adminReportList?pageNum=${pageNumber}'><span>${pageNumber}</span></a>
                        </c:forEach>
                        <c:if test='${ReportPagingVO.endPageNumber < ReportPagingVO.totalPageNumber}'>
                            <a href='${pageContext.request.contextPath}/admin/adminReportList?pageNum=${ReportPagingVO.endPageNumber + 1}'><span>Next</span></a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <c:forEach var='blacklist' items='${blackList}'>
        <input type='hidden' value='${blacklist.BListSeq}' name='bListSeq' class='bListSeq'>
        <c:choose>
            <c:when test='${blacklist.reasonSeq == 1 || blacklist.reasonSeq eq 1}'>
                <input type='hidden' value='7' name='endDate' class='endDate'>
            </c:when>
            <c:when test='${blacklist.reasonSeq == 2 || blacklist.reasonSeq eq 2}'>
                <input type='hidden' value='7' name='endDate' class='endDate'>
            </c:when>
            <c:when test='${blacklist.reasonSeq == 3 || blacklist.reasonSeq eq 3}'>
                <input type='hidden' value='7' name='endDate' class='endDate'>
            </c:when>
            <c:otherwise>
                <input type='hidden' value='3' name='endDate' class='endDate'>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>