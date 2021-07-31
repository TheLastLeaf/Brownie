<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/details/details-post-review.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>블랙유저목록</h3>
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
    function fn_upDateBlack() {
        if(!confirm("블랙해제 하시겠습니까?")){
            return false;
        }
        const bUserSeq = $(".bUserSeq").val()

        $.ajax({
            url: "./upDateblack",
            type: "POST",
            data: {
                "bUserSeq": bUserSeq
            },
            success: function (data) {
                console.log(data)
                if (data === 1) {
                    alert("블랙해제 완료.")
                    location.reload();
                }
            },
            error: function () {
                alert("블랙해제 실패");
            }
        })
    }
</script>
<style>
    .blackUserPageBottom {
        padding-top: 50px;
    }

    table {
        width: 100%;
    }

    .update {
        width: 100%;
    }
</style>

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12"
                 style="justify-content: center; align-content: center; text-align: center; color:white;">
                <div class="">
                    <table border="1px solid grey" style="margin: auto;">
                        <tr>
                            <th>접수번호</th>
                            <th>닉네임</th>
                            <th>정지기간</th>
                            <th>관리</th>
                        </tr>
                        <c:forEach var="blackUser" items="${BlackUserPagingVO.blackUserVO}">
                            <c:if test="${blackUser.status eq 'Y' || blackUser.status == 'Y'}">
                                <tr>
                                    <th>${blackUser.BUserSeq}</th>
                                    <th>${blackUser.nickName}</th>
                                    <th>${blackUser.endDate}</th>
                                    <th>
                                        <button class="btn btn-outline-light update" onclick="fn_upDateBlack()">해제하기
                                        </button>
                                    </th>
                                </tr>
                                <input type="hidden" value="${blackUser.BUserSeq}" name="bUserSeq" class="bUserSeq">
                            </c:if>
                        </c:forEach>
                    </table>
                    <div class="blackUserPageBottom">
                        <div class="pagination-item">
                            <c:if test="${1 < BlackUserPagingVO.startPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminBlackList?pageNum=${BlackUserPagingVO.startPageNumber - 1}"><span>Prev</span></a>
                            </c:if>
                            <c:forEach var="pageNumber" begin="${BlackUserPagingVO.startPageNumber}"
                                       end="${BlackUserPagingVO.endPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminBlackList?pageNum=${pageNumber}"><span>${pageNumber}</span></a>
                            </c:forEach>
                            <c:if test="${BlackUserPagingVO.endPageNumber < BlackUserPagingVO.totalPageNumber}">
                                <a href="${pageContext.request.contextPath}/admin/adminBlackList?pageNum=${BlackUserPagingVO.endPageNumber + 1}"><span>Next</span></a>
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