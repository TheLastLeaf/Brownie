<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="../layout/header.jsp">
	<c:param name="path" value="${path}" />
</c:import>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
	data-setbg="img/miniGame/banner4.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb-text">
					<h3>
						팬아트 게시판 <span><i class="fas fa-dice fa-sm fa-spin"></i></span>
					</h3>
					<div class="bt-option">
						<a href="#">인기글</a> <a href="#">Latest posts</a> <span>Hardware</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<style>
.table {
	border: 3px solid white;
}

.td_tb {
	border: 1px solid white;
}

.corner {
	background: white;
	width: 
}

.center {
	background: white;
}

.verti { 
	height: 110px;
}
</style>

<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
	<div class="container">
		<div style="padding-left: 14px; padding-right: 14px; padding-top: 14px;">

			<table class="table">
				<tbody>
					<tr height="140px">
						<td class="td_tb startLine corner">
							<span>
								<i class="fab fa-github fa-3x"></i> 
								<i class="fas fa-chess-knight fa-3x"></i> 
							</span>
						</td>
						<td class="td_tb"></td>
						<td class="td_tb"></td>
						<td class="td_tb"></td>
						<td class="td_tb"></td>
						<td class="td_tb"></td>
						<td class="td_tb rightUp corner"></td>
					</tr>
<!-- 세로축 -->
					<tr class="verti">
						<td class="td_rl"></td>
						<td class="center" id="gameAlert" colspan="5" rowspan="5"></td><!-- 주사위랑 현황판 이미지 넣을곳 -->
						<td class="td_rl"></td>
					</tr>

					<tr class="verti">
						<td class="td_rl"></td>

						<td class="td_rl"></td>
					</tr>

					<tr class="verti">
						<td class="td_rl"></td>

						<td class="td_rl"></td>
					</tr>

					<tr class="verti">
						<td class="td_rl"></td>

						<td class="td_rl"></td>
					</tr>

					<tr class="verti">
						<td class="td_rl"></td>

						<td class="td_rl"></td>
					</tr>
<!-- 세로축 -->
					<tr height="140px" style="margin-bottom: 14px">
						<td width="10%" class="td_tb leftDown corner"></td>
						<td width="7.7%" class="td_tb"></td>
						<td width="7.8%" class="td_tb"></td>
						<td width="7.8%" class="td_tb"></td>
						<td width="7.8%" class="td_tb"></td>
						<td width="7.9%" class="td_tb"></td>
						<td width="10%" class="td_tb rightDown corner"></td>
					</tr>
				</tbody>
			</table>
			<!-- 보드 끝 -->

		</div>
		<!-- 갤러리끝 -->
	</div>
	</div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${path}" />
</c:import>