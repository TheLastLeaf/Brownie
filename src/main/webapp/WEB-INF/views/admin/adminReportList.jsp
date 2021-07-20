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
        alert("블랙리스트로 추가하시겠습니까?")
        const userId = $("#" + reportSeq + " .userId").val();
        const log = $("#" + reportSeq + " .log").val();
        const reasonSeq = $("#" + reportSeq + " #reason option:selected").val();
        const bListSeq = $("#" + reportSeq + " .bListSeq").val();
        const endDate = $("#" + reportSeq + " .endDate").val();

        $.ajax({
            url: "./addblacklist",
            type: "POST",
            data: {
                "userId": userId,
                "log": log,
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

    #but {
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

</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 reportListdiv">
                <div class="">
                    <c:forEach var="blacklist" items="${blackList}">
                        <input type="hidden" value="${blacklist.BListSeq}" name="bListSeq" class="bListSeq">
                        <c:choose>
                            <c:when test="${blacklist.reasonSeq == '1' || blacklist.reasonSeq eq 1}">
                                <input type="hidden" value="7" name="endDate" class="endDate">
                            </c:when>
                            <c:when test="${blacklist.reasonSeq == '2' || blacklist.reasonSeq eq 2}">
                                <input type="hidden" value="7" name="endDate" class="endDate">
                            </c:when>
                            <c:when test="${blacklist.reasonSeq == '3' || blacklist.reasonSeq eq 3}">
                                <input type="hidden" value="7" name="endDate" class="endDate">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" value="3" name="endDate" class="endDate">
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <table class="reportListTable" border="1px solid grey" style="margin-bottom: auto">
                        <tr>
                            <th class="reportListTd">아이디</th>
                            <th class="reportListTd">신고분류</th>
                            <th class="reportListTd">신고내용</th>
                            <th class="reportListTd">신고자</th>
                            <th class="reportListTd" style="width: 180px">신고일자</th>
                            <th class="reportListTd">재재 항목</th>
                            <th class="reportListTd">처리상태</th>
                        </tr>
                        <c:forEach var="reportList" items="${ReportPagingVO.reportVOList }">
                            <c:if test="${reportList.status eq 'N'}">
                                <tr id="${reportList.reportSeq}">
                                    <th class="reportListTd">${reportList.userId}</th>
                                    <th class="reportListTd">${reportList.reportName }</th>
                                    <c:choose>
                                        <c:when test="${reportList.content ne null}">
                                            <th class="reportContent">${reportList.content }</th>
                                        </c:when>
                                        <c:otherwise>
                                            <th>-신고내용 없음-</th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th class="reportListTd">${reportList.inUserId }</th>
                                    <th class="reportListTd">${reportList.inDate }</th>
                                    <th style="text-align: center">
                                        <select id="reason">
                                            <option class="reason" selected value="1">욕설</option>
                                            <option class="reason" value="2">사칭</option>
                                            <option class="reason" value="3">광고</option>
                                            <option class="reason" value="4">그냥</option>
                                        </select>
                                    </th>
                                    <input type="hidden" name="userId" value="${reportList.userId}" id="userId"
                                           class="userId">
                                    <input type="hidden" name="log" value="${reportList.log}" id="log" class="log">
                                    <input type="hidden" name="reportSeq" value="${reportList.reportSeq}" id="reportSeq"
                                           class="reportSeq">
                                    <th class="reportListTd"><i class="fas fa-times"
                                                                onclick="fn_submit(${reportList.reportSeq})"
                                                                id="but"></i>
                                    </th>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                    <div class="reportPageBottom">
                        <div class="pagination-item">
                            <c:if test="${1 < ReportPagingVO.startPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminReportList?pageNum=${ReportPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageNumber" begin="${ReportPagingVO.startPageNumber}"
                                       end="${ReportPagingVO.endPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminReportList?pageNum=${pageNumber}"><span>${pageNumber}</span></a>
                            </c:forEach>
                            <c:if test="${ReportPagingVO.endPageNumber < ReportPagingVO.totalPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminReportList?pageNum=${ReportPagingVO.endPageNumber + 1}"><span>Next</span></a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>