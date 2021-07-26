<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp"/>

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
                    <button type="button" class="btn btn-outline-light" onclick='location.href = "?nickName=" + $("#writer").val()'>검색</button>
                </div>
                <div class="">
                    <table border="1px solid grey" style="margin: auto;">
                        <tr>
                            <th>방번호</th>
                            <th>채팅내역</th>
                            <th>작성자</th>
                            <th>날짜</th>
                        </tr>
                        <c:forEach items="${chatVOList}" var="chatVO">
                            <tr class="chatlog">
                                <th>${chatVO.teamGameSep}</th>
                                <th>${chatVO.content}</th>
                                <th>${chatVO.nickName}</th>
                                <th>${chatVO.chatInDateToString}</th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->


<c:import url="../layout/footer.jsp"/>