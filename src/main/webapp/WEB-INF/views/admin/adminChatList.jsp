<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>
<script>
    function fn_log(){

        const formData = new FormData();
        formData.append("writer",$(".writer").val());
        $.ajax({
            url: "./chatLog.ajax",
            type: "POST",
            data: formData,
            processData: false,
            enctype: 'multipart/form-data',
            contentType: false,
            dataType: "json",
            success: function (data) {
                console.log(data)
                if (data.message === "success") {
                    var log =  "<c:forEach items='${ChatPagingVO.chatVO}' var='log'>"
                        log += "<fmt:formatDate value='${log.upDate}' type='both' pattern='yyyy-MM-dd hh:mm:ss' var='update'/>"
                        log += "<tr>"
                        log += "<th>${log.teamGameSep}</th>"
                        log += "<th>${log.content}</th>"
                        log += "<th>${log.nickName}</th>"
                        log += "<th>${update}</th>"
                        log += "</tr>"
                        log += "</c:forEach>"
                    $(".chatlog").append(log)
                }else{
                    alert("에러")
                }
            },
            error: function () {
                alert("에러");
            }
        })

    }

</script>
<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/lol/lolChamp/kayle.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>CHAT LOG</h3>
                    <div>
                        <a href="/admin" style="color: #ffffff;">[돌아가기]</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->
<style>
    .chatLogPageBottom {
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
                <div class="innerBox text-right">
                    <input type="text" class="writer" name="writer" id="writer" style="background-color: black; border:1px solid #666666; color: white;">
                    <button type="button" class="btn btn-outline-light" onclick="fn_log()">검색</button>
                </div>
                <div class="">
                    <table border="1px solid grey" style="margin: auto;">
                        <tr>
                            <th>방번호</th>
                            <th>채팅내역</th>
                            <th>작성자</th>
                            <th>날짜</th>
                        </tr>
                        <tr class="chatlog">

                        </tr>
                    </table>
<%--                    <div class="chatLogPageBottom">--%>
<%--                        <div class="pagination-item">--%>
<%--                            <c:if test="${1 < ChatPagingVO.startPageNumber}">--%>
<%--                                <a href="${pageContext.request.contextPath}/admin/chatList?pageNum=${ChatPagingVO.startPageNumber - 1}"><span>Prev</span></a>--%>
<%--                            </c:if>--%>
<%--                            <c:forEach var="pageNumber" begin="${ChatPagingVO.startPageNumber}"--%>
<%--                                       end="${ChatPagingVO.endPageNumber}">--%>
<%--                                <a href="${pageContext.request.contextPath}/admin/chatList?pageNum=${pageNumber}"><span>${pageNumber}</span></a>--%>
<%--                            </c:forEach>--%>
<%--                            <c:if test="${ChatPagingVO.endPageNumber < ChatPagingVO.totalPageNumber}">--%>
<%--                                <a href="${pageContext.request.contextPath}/admin/chatList?pageNum=${ChatPagingVO.endPageNumber + 1}"><span>Next</span></a>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>
<%--                    </div>--%>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>