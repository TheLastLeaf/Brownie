<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="../layout/header.jsp">
	<c:param name="path" value="${path}" />
</c:import>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
	data-setbg="img/breadcrumb-bg.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb-text">
					<h3>
						팬아트 게시판<span><i class="fas fa-camera fa-sm fa-spin"></i></span>
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
.gallery_notice {
	color: black;
	width: 100%;
	background: white;
}

.gallery_notice th {
	border: 2px solid white;
	text-align: center;
}

.gallery_notice td {
}

.gallery_hr {
	background-color: white;
	width: 100%;
	text-align: center;
}

#preview {
	z-index: 9999;
	position: absolute;
	border: 0px solid #ccc;
	background: #333;
	padding: 1px;
	display: none;
	color: #fff;
}

.lef{
	margin-left: 30px;
}

</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				var xOffset = 10;
				var yOffset = 30;

				$(document).on(
						"mouseover",
						".thumbnail",
						function(e) { //마우스 오버시
							$("body").append(
									"<p id='preview'><img src='"
											+ $(this).attr("data-setbg")
											+ "' width='400px' /></p>"); //보여줄 이미지를 선언
							$("#preview")
									.css("top", (e.pageY - xOffset) + "px")

									.css("left", (e.pageX + yOffset) + "px")

									.fadeIn("fast"); //미리보기 화면 설정 셋팅
						});

				$(document).on(
						"mousemove",
						".thumbnail",
						function(e) { //마우스 이동시
							$("#preview")
									.css("top", (e.pageY - xOffset) + "px")
									.css("left", (e.pageX + yOffset) + "px");

						});

				$(document).on("mouseout", ".thumbnail", function() { //마우스 아웃시
					$("#preview").remove();

				});

			});
</script>
<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 p-0">


				<div class="row">

					<div class="col-lg-12">
						<h3 style="color: white;">팬아트 공지사항</h3>
						<br/><br/><br/>
						<table class="table text-center text-white">
							<tr>
								<th>분류</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>등록일</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
							<tr>
								<td>[공지]</td>
								<td class="text-left"><a class="lef" href="#"><strong>치타는 웃고있다. </strong></a></td>
								<td>곽지훈</td>
								<td>2014-01-28</td>
								<td>12</td>
								<td>3</td>
							</tr>
							<tr>
								<td>[공지]</td>
								<td class="text-left"><a href="#" class="lef"><strong>고양인 울고있다.</strong></a></td>
								<td>곽지훈</td>
								<td>2014-01-28</td>
								<td>12</td>
								<td>3</td>
							</tr>
							<tr>
								<td>[공지]</td>
								<td class="text-left"><a class="lef" href="#"><strong>강아진 짖고있다.</strong></a></td>
								<td>곽지훈</td>
								<td>2014-01-28</td>
								<td>12</td>
								<td>3</td>
							</tr>
							<tr>
								<td>[공지]</td>
								<td class="text-left"><a class="lef" href="#"><strong>강아진 물리고있다.</strong></a></td>
								<td>곽지훈</td>
								<td>2014-01-28</td>
								<td>12</td>
								<td>3</td>
							</tr>

						</table>
					</div>



				<div class="col-lg-12">
					<hr class="gallery_hr">
					<h3 style="color: white;">히트다 히트!</h3>
					<br/><br/><br/>
				</div>


				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/1.jpeg">
							<div class="label">
								<span>웃긴짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">치타는 웃고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/2.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">고양인 울고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/3.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 짖고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/4.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>


				<div class="col-lg-12">
					<hr class="gallery_hr">
				</div>

				<div class="col-lg-12">
					<select
						onchange="location.href = INVEN.QueryMaker.getLink('https://www.inven.co.kr/board/lol/2775', 'come_idx->2775,category->' + this.value, 'remove->p,category2');"
						style="color: black; display: inline; float: left;">
						<option value="">전체</option>
						<option value="장례식">장례식</option>
						<option value="자작">자작</option>
						<option value="연재">연재</option>
						<option value="퍼온글">퍼온글</option>
						<option value="기타">기타</option>
					</select>
					<a href="" class="" style="margin-left: 3px;">오늘의 화제</a>
					<a href="" class="" style="margin-left: 3px;">인기만점</a>
					<a href="" class="" style="margin-left: 3px;">내가쓴글</a>
					<input style="float: right; color: black;" type="button" value="글쓰기" onclick="location.href='noticeAdd'">
				</div>

				<div class="col-lg-12">
					<hr class="gallery_hr">
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/1.jpeg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/2.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/3.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/4.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/5.gif">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/6.jpg">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="cg-item">
						<div class="cg-pic set-bg thumbnail"
							data-setbg="${path}/img/gallery/7.gif">
							<div class="label">
								<span>귀여운짤</span>
							</div>
						</div>
						<div class="cg-text">
							<h5>
								<a href="#">강아진 물리고있다.</a>
							</h5>
							<ul>
								<li>by <span>Admin</span></li>
								<li><i class="fa fa-clock-o"></i> Aug 01, 2019</li>
								<li><i class="fa fa-comment-o"></i> 20</li>
							</ul>
						</div>
					</div>
				</div>

				<hr class="gallery_hr">

				<div class="col-lg-12" style="text-align: center;">
					<span> <select name="notice"
						style="height: 30px; background: white; color: black;">
							<option value="" selected="selected">전체</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
					</select> <input type="text" value=""
						style="background: black; color: #666666">
					</span> <input type="button" class="btn btn-outline-dark" value="조회"
						style="color: #666666">
				</div>

				<br/><br/><br/>

				<div class="pagination-item col-lg-12">
					<a href="#"><span>1</span></a> <a href="#"><span>2</span></a> <a
						href="#"><span>3</span></a> <a href="#"><span>Next</span></a>
				</div>
			</div>
		</div>
		<!-- 갤러리끝 -->
	</div>
	</div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${path}" />
</c:import>