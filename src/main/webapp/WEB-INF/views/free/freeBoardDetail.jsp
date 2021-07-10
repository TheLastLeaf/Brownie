<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>


<!-- 스크립트 // 하단 아이디 부분 세션스코프로 바꿔줘야함 -->
<script type="text/javascript">
	function likeHateCheck(kind) {
		console.log(${freeDetail.boardSeq })
		console.log(kind)

		$.ajax({
			url : "./ajax.likeHate",
			type : "get",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId":'1786827',
					"kind": kind
			},
			success : function(data) {
				$('#hateCnt').html(data.hateCnt);
				$('#likeCnt').html(data.likeCnt);
				console.log(data.hateCnt);
				console.log(data.likeCnt);
			},
			error : function() {
				alert("에러나요");
			}
		})
	}

</script>
<!-- 스크립트 -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
<!--                 <div class="section-title" style=""> -->
<!--                   <h5>우리동네 소갈비살 1kg에 55,000원</h5> -->
<!--                  </div> -->
                <div class="details-text">
                    <div class="dt-quote">
                        <p>${freeDetail.title }</p>
                    </div>
                    <div class="dt-desc">
                        <p> </p>
                    </div>
                    <div class="dt-item">
                        <p> </p>
                    </div>
                    <div class="dp-text">
                        <p>${freeDetail.content } </p>
                    </div>
                    <div class="dt-last-desc">
                        <p> </p>
                    </div>
                    <div class="dt-tags">
	                    <c:forTokens items="${freeDetail.boardCategory }" delims="," var="tag">
	                        <a href="#"><span>${tag }</span></a>
	                    </c:forTokens>
                    </div>
                    <div class="dt-share" style="justify-content: center; align-content: center; text-align: center;">
                        <div class="ds-links">
                            <a href="javascript:likeHateCheck('1')" class="wide"><i class="far fa-heart"></i><span id="hateCnt">${likeHateCnt.hateCnt }</span></a>
                        </div>
                        <div class="ds-title">싫어요</div>
                        <div class="ds-links">
                            <a href="javascript:likeHateCheck('0')" class="wide"><i class="fas fa-heart"></i><span id="likeCnt">${likeHateCnt.likeCnt }</span></a>
                        </div>
                        <div class="ds-title">좋아요</div>
                    </div>
                    <div class="dt-related-post">
                        <div class="row">
                            <div class="col-lg-6">
                                <a href="#" class="rp-prev">
                                    <span>Prev</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" style="height: 70px;" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>이전글어쩌구</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <a href="#" class="rp-next">
                                    <span>Next</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>다음글어쩌구 게시글 순번으로 쿼리문 조회해</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-author">
                        <div class="da-pic">
                            <img src="${pageContext.request.contextPath}/img/details/author-pic.jpg" alt="">
                        </div>
                        <div class="da-text">
                            <h5>${freeDetail.nickName }</h5>
                            <p>허리펴 물마셔 목펴 눕고싶어 이 아래에 롤 티어 보여줘도 될듯</p>
                        </div>
                    </div>
                    <div class="dt-comment">
                        <h4>3 comment</h4>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>Smart HAK</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>코딩테스트 존나쉽죠?</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item reply-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>adorable Hyun-on</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>조카 애기들 귀여워</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                        <div class="dc-item">
                            <div class="dc-pic">
                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-3.jpg" alt="">
                            </div>
                            <div class="dc-text">
                                <h5>세웅지훈포에버</h5>
                                <span class="c-date">15 Aug 2017</span>
                                <p>우르르롹끼.</p>
                                <a href="#" class="reply-btn"><span>Reply</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="dt-leave-comment">
                        <h4>comment</h4>
                        <form action="#">
                            <textarea placeholder="Message"></textarea>
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-7">
                <div class="sidebar-option">
                   <div class="best-of-post">
                        <div class="section-title">
                            <h5>Best of Best</h5>
                        </div>

                         <c:forEach var="freeFamousList" items="${freeFamousList }" varStatus="status">

	                        <div class="bp-item">
	                            <div class="bp-loader">
	                                <div class="loader-circle-wrap">
	                                    <div class="loader-circle">
	                                            <span class="circle-progress-1" data-cpid="id-1" data-cpvalue="${freeFamousList.likeCnt }"
	                                                  data-cpcolor="#c20000"></span>
	                                        <div class="review-point" style="text-align: center;">${freeFamousList.likeCnt }</div>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="bp-text">
	                                <h6><a href="#">${freeFamousList.title }</a></h6>
	                                <ul>
	                                    <li><i class="far fa-clock"></i>${freeFamousList.inDate }</li>
	                                    <li><i class="far fa-comment"></i> 20</li>
	                                </ul>
	                            </div>
	                        </div>
						</c:forEach>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>