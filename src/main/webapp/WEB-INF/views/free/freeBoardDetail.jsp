<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../layout/header.jsp"/>

<style>

.actForReply{
	font-size: 10px;
	margin-bottom: 3px;
	justify-content: right;
    text-align: right;
}

.replyHate {
	border: 1px solid #336666;
	padding: 2px;
	cursor: pointer;
	margin: 3px;
	color: #336666;
}

.replyLike {
	border: 1px solid #ffffcc;
	padding: 2px;
	cursor: pointer;
	margin: 3px;
	color: #ffffcc;
}

.replyCall {
	border: 1px solid #DC143C;
	padding: 2px;
	cursor: pointer;
	margin: 3px;
	color: 	#DC143C;
}

.blackReplys {
	height: 5px;
	color: #5d5d5d;
	font-size: 12px;
 	visibility: hidden;
}

.blackClick {
	font-size: 12px;
	color: #e57373;
}

.userReplys {
	font-size: 12px;
}

.blackReplysId {
 	visibility: hidden;
}
</style>

<!-- 스크립트 -->
<script type="text/javascript">

// 	const inUserId = '${sessionScope.id}';
	const inUserId = '1786827527';

	function likeHateCheck(kind) {
		console.log("sessionId : "+inUserId);
		if(inUserId == ''){
			alert("로그인이 필요합니다.");
			return;
		}

		$.ajax({
			url : "./ajax.likeHate",
			type : "get",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId": inUserId,
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

	function ReplyLikeHate(replySeq, kind) {
		var hateCntId = "#replyHateCnt_" + replySeq;
		var LikeCntId = "#replyLikeCnt_" + replySeq;

		if(inUserId == ''){
			alert("로그인이 필요합니다.");
			return;
		}
		$.ajax({
			url : "../reply/ajax.replyLikeHate",
			type : "get",
			data : {
					"replySeq" : replySeq,
					"inUserId": inUserId,
					"kind": kind
			},
			success : function(data) {
				$(hateCntId).html(data.hateCnt);
				$(LikeCntId).html(data.likeCnt);
			},
			error : function() {
				alert("에러나요");
			}
		})
	}

	function replyToBoard(){
		var replyContent = $("#userReply").val();
		$.ajax({
			url : "../reply/ajax.replyToBoard",
			type : "POST",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId": inUserId,
					"replyContent": replyContent
			},
			success : function(data) {
				location.reload();
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

	function showBlackReply(replySeq) {
		var blackReplyId = 'blackReply_' + replySeq;
		var blackRepltId = 'blackReply_' + replySeq;
		document.getElementById(blackReplyId).style.visibility="visible";
		document.getElementById(blackReplyId).style.height="auto";

		var blackIdStar = 'blackIdStar_' + replySeq;
		var blackUserId = 'blackId_' + replySeq;

		document.getElementById(blackIdStar).style.display="none";
		document.getElementById(blackUserId).style.visibility="visible";
		document.getElementById(blackReplyId).style.height="auto";

		console.log(blackRepltId)
	}

</script>
<!-- 스크립트 끝 -->

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
                                            <li><i class="far fa-clock"></i> ${recentBoardReplyDate.beforeDate}</li>
                                            <li><i class="far fa-comment"></i> ${recentBoardReplyDate.beforeCnt}</li>
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
                                            <li><i class="far fa-clock"></i> ${recentBoardReplyDate.afterDate}</li>
                                            <li><i class="far fa-comment"></i> ${recentBoardReplyDate.afterCnt}</li>
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
                        <h4> 댓글 수 ${recentBoardReplyDate.replyCnt} 개</h4>

                        <c:forEach var="replyOnBoard" items="${replyOnBoard }" varStatus="status">
	                        <c:choose>
								<c:when test="${replyOnBoard.status eq 'y' }">
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5>${replyOnBoard.nickName }</h5>
			                                <span class="c-date">${replyOnBoard.modDate }</span>
			                                <p class="userReplys">${replyOnBoard.replyContent }</p>
			                                <div class="actForReply">
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${replyOnBoard.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${replyOnBoard.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
				                                <a href="#"><span class="replyCall">신고하기</span></a>
				                            </div>
			                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
			                                	<a href="#" class="reply-btn"><span>수정하기</span></a>
			                               	</c:if>
			                            </div>
			                        </div>
								</c:when>
								<c:otherwise>
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5 id="blackIdStar_${replyOnBoard.replySeq }">******</h5>
			                                <h5 class="blackReplysId" id="blackId_${replyOnBoard.replySeq }">${replyOnBoard.nickName }</h5>
			                                <span class="c-date">${replyOnBoard.modDate }</span>
			                                <p><span id=""><a class="blackClick" href="javascript:showBlackReply('${replyOnBoard.replySeq }')">신고 접수로 블라인드 처리 된 댓글입니다. 내용을 보려면 클릭해주세요.</a></span></p>
			                                <div class="blackReplys" id="blackReply_${replyOnBoard.replySeq }">${replyOnBoard.replyContent }</div>
			                                <div class="actForReply">
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${replyOnBoard.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${replyOnBoard.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
				                                <a href="#"><span class="replyCall">신고하기</span></a>
				                            </div>
			                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
			                               		<a href="#" class="reply-btn"><span>수정하기</span></a>
			                               	</c:if>
			                            </div>
			                        </div>
								</c:otherwise>
	                        </c:choose>

							<!-- 이건 대댓글 표시/ 이프문 달아서 대댓글 존재할 경우에만 표시하게 적기 여기서 포문 한번 더 돌려야 할듯  -->
							<c:set var="repSeq" value="${replyOnBoard.replySeq }" />
								<c:forEach var="reMap" items="${reReplyMap}">
									<c:if test="${reMap.key eq repSeq}">
										<c:forEach var="rm" items="${reMap.value}">
	                        				<c:choose>
												<c:when test="${rm.status eq 'y' }">
							                        <div class="dc-item reply-item">
							                            <div class="dc-pic">
							                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
							                            </div>
							                            <div class="dc-text">
							                                <h5>${rm.nickName }</h5>
							                                <span class="c-date">${rm.modDate }</span>
							                                <p class="userReplys"><a href="#">@${replyOnBoard.nickName }</a> ${rm.replyContent}</p>
							                                <div class="actForReply">
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${rm.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${rm.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
								                                <a href="#"><span class="replyCall">신고하기</span></a>
							                            	</div>
							                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
							                                	<a href="#" class="reply-btn"><span>수정하기</span></a>
							                               	</c:if>
							                            </div>
							                        </div>
												</c:when>
												<c:otherwise>
							                        <div class="dc-item reply-item">
							                            <div class="dc-pic">
							                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
							                            </div>
							                            <div class="dc-text">
							                                <h5 id="blackIdStar_${rm.replySeq }">******</h5>
			                                				<h5 class="blackReplysId" id="blackId_${rm.replySeq }">${rm.nickName }</h5>
							                                <span class="c-date">${rm.modDate }</span>
							                                <p><span id=""><a class="blackClick" href="javascript:showBlackReply('${rm.replySeq }')">신고 접수로 블라인드 처리 된 댓글입니다. 내용을 보려면 클릭해주세요.</a></span></p>
							                                <div class="blackReplys" id="blackReply_${rm.replySeq }">${rm.replyContent }</div>
							                                <div class="actForReply">
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${rm.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${rm.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
								                                <a href="#"><span class="replyCall">신고하기</span></a>
								                            </div>
							                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
							                               		<a href="#" class="reply-btn"><span>수정하기</span></a>
							                               	</c:if>
							                            </div>
							                        </div>
												</c:otherwise>
	                        				</c:choose>
										</c:forEach>
									</c:if>
								</c:forEach>
							<!-- 대댓글 끝 -->

                        </c:forEach>
                    </div>

                    <!-- 리플작성구간 시작 -->
                    <div class="dt-leave-comment">
                        <form action="#">
                            <textarea id="userReply" placeholder="Message"></textarea>
                            <button type="button" onclick="javascript:replyToBoard()">댓글 작성</button>
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
	                                <h6><a href="${pageContext.request.contextPath}/free/freeBoardDetail?boardSeq=${freeFamousList.boardSeq}">${freeFamousList.title }</a></h6>
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