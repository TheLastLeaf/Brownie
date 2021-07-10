<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>


<!-- 스크립트 // 하단 아이디 부분 세션스코프로 바꿔줘야함 -->

<script type="text/javascript">
	function likeHateCheck(kind) {
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
			},
			error : function() {
				alert("에러나요");
			}
		})
	}

	function replyToBoard(boardSeq){
		console.log("boardSeq : "+boardSeq);

		var replyContent = $("#userReply").val();
		console.log(replyContent);

		$.ajax({
			url : "../reply/ajax.replyToBoard",
			type : "get",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId":'1786827',
					"replyContent": replyContent
			},
			success : function(data) {
				alert("?")
			},
			error : function() {
				alert("에러나요");
			}
		})


	}

	function replyToReply(boardSeq, replySeq){
		console.log("boardSeq : "+boardSeq);
		console.log("replySeq : " + replySeq);


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
                    <div class="dp-text">
                        <p>${freeDetail.content } </p>
                    </div>
                    <!-- 태그 -->
                    <div class="dt-tags">
	                    <c:forTokens items="${freeDetail.boardCategory }" delims="," var="tag">
	                        <a href="#"><span>${tag }</span></a>
	                    </c:forTokens>
                    </div>

                    <!-- 좋아요 싫어요 -->
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

							<!-- 이전 게시글 안내 -->
                            <div class="col-lg-6">
                               <c:if test="${freePrev.title ne null}">
                                <a href="${pageContext.request.contextPath}/free/freeBoardDetail?boardSeq=${freePrev.boardSeq}" class="rp-prev">
                                    <span>Prev</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>${freePrev.title }</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                               </c:if>
                            </div>

							<!-- 다음 게시글 안내 -->
                            <div class="col-lg-6">
                               <c:if test="${freeNext.title ne null}">
                                <a href="${pageContext.request.contextPath}/free/freeBoardDetail?boardSeq=${freeNext.boardSeq}" class="rp-next">
                                    <span>Next</span>
                                    <div class="rp-pic">
                                        <img src="${pageContext.request.contextPath}/img/mini_brownie_thumb.png" alt="">
                                    </div>
                                    <div class="rp-text">
                                        <h6>${freeNext.title }</h6>
                                        <ul>
                                            <li><i class="far fa-clock"></i> Aug 01, 2019</li>
                                            <li><i class="far fa-comment"></i> 20</li>
                                        </ul>
                                    </div>
                                </a>
                               </c:if>
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
                        <h4>3 comment 리플 개수 으아아아아아</h4>

                        <c:forEach var="replyOnBoard" items="${replyOnBoard }" varStatus="status">
	                        <c:choose>
								<c:when test="${replyOnBoard.status eq 'y' }">
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5>${replyOnBoard.nickName }</h5>
			                                <span class="c-date">15 Aug 2017</span>
			                                <p>${replyOnBoard.replyContent }</p>
			                                <a href="#" class="reply-btn"><span>Reply</span></a>
			                            </div>
			                        </div>
								</c:when>
								<c:otherwise>
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5>블랙처리된사람 닉네임 자리</h5>
			                                <span class="c-date">15 Aug 2017</span>
			                                <p>블랙처리된 사람 리플 컨텐츠 자리</p>
			                                <a href="#" class="reply-btn"><span>Reply</span></a>
			                            </div>
			                        </div>
								</c:otherwise>
	                        </c:choose>

							<!-- 이건 대댓글 표시/ 이프문 달아서 대댓글 존재할 경우에만 표시하게 적기 여기서 포문 한번 더 돌려야 할듯  -->
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
							<!-- 대댓글 끝 -->

                        </c:forEach>
                    </div>

                    <!-- 리플작성구간 시작 -->
                    <div class="dt-leave-comment">
                        <h4>comment</h4>
                        <form action="#">
                            <textarea id="userReply" placeholder="Message"></textarea>
                            <button type="button" onclick="javascript:replyToBoard(${freeDetail.boardSeq })">작성</button>
                        </form>
                    </div>
                    <!-- 리플작성구간 끝 -->
                </div>
            </div>

            <!-- 사이드바 시작 -->
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
            <!-- 사이드바 끝 -->

        </div>
    </div>
</section>
<!-- Details Post Section End -->
<c:import url="../layout/footer.jsp"/>