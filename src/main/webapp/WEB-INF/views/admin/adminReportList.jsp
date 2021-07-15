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

    // function selectAll(selectAll) {
    //     const checkboxes
    //         = document.getElementsByName('addBlack');
    //
    //     checkboxes.forEach((checkbox) => {
    //         checkbox.checked = selectAll.checked;
    //     })
    // }
    function fn_submit(){
        confirm("블랙리스트로 추가하시겠습니까?")
        const userId = $(".userId").val();
        const log = $(".log").val();
        const reportSeq = $(".reportSeq").val();

        $.ajax({
            url: "./addblacklist",
            type: "POST",
            data: {
                "userId": userId,
                "log": log,
                "reportSeq":reportSeq
            },
            success: function (data) {
                console.log(data)
                if (data === 1) {
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

    .reportContentTd {
        width: 50%;
    }

    .reportPageBottom {
        padding-top: 50px;
    }
    #but{
        cursor: pointer;
    }
    .reason{
        text-align: center;
        width: 80px;
        height: 30px;
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
<%--                            <th class="reportListTd">순번</th>--%>
<%--                            <th class="reportListTd">--%>
<%--                                <input type="checkbox" name="selectAll" onclick="selectAll(this)"/>--%>
<%--                            </th>--%>
                            <th class="reportListTd">아이디</th>
                            <th class="reportListTd">신고분류</th>
                            <th class="reportListTd">신고내용</th>
                            <th class="reportListTd">신고자</th>
                            <th class="reportListTd">신고일자</th>
                            <th class="reportListTd">재재 항목</th>
                            <th class="reportListTd">처리상태</th>
                        </tr>
                        <c:forEach var="reportList" items="${ReportPagingVO.reportVOList }" varStatus="status">
                            <c:if test="${reportList.status eq 'N'}">
                            <tr>
<%--                                <th class="reportListTd">${status.index }</th>--%>
<%--                                <c:choose>--%>
<%--                                    <c:when test="${reportList.status eq 'N' }">--%>
<%--                                        <th class="reportListTd">--%>
<%--                                            <input type="checkbox" name="addBlack" value="${reportList.userId }"/>--%>
<%--                                        </th>--%>
<%--                                    </c:when>--%>
<%--                                    <c:when test="${reportList.status eq 'Y' }">--%>
<%--                                        <th class="reportListTd">--%>
<%--                                            <input type="checkbox" name="alreadyCheck" value="${reportList.userId }"--%>
<%--                                                   disabled="disabled"/>--%>
<%--                                        </th>--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>
<%--                                        <th class="reportListTd">--%>
<%--                                            <input type="checkbox" name="alreadyCheck" value="${reportList.userId }"--%>
<%--                                                   checked="checked" disabled="disabled">--%>
<%--                                        </th>--%>
<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
                                <th class="reportListTd">${reportList.userId}</th>
                                <th class="reportListTd">${reportList.reportName }</th>
                                <th class="reportListTd">${reportList.content }</th>
                                <th class="reportListTd">${reportList.inUserId }</th>
                                <th class="reportListTd">${reportList.inDate }</th>
                                <th>
                                    <select class="form-control reason">
                                        <option selected value="1">욕설</option>
                                        <option value="2">사칭</option>
                                        <option value="3">광고</option>
                                        <option value="4">그냥</option>
                                    </select>
                                </th>
                                <th class="reportListTd"><i class="fas fa-times" onclick="fn_submit()" id="but"></i></th>
                                <input type="hidden" name="userId" value="${reportList.userId}" id="userId" class="userId">
                                <input type="hidden" name="log" value="${reportList.log}" id="log" class="log">
                                <input type="hidden" name="reportSeq" value="${reportList.reportSeq}" id="reportSeq" class="reportSeq">
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