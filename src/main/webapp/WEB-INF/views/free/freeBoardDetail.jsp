<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:import url="../layout/header.jsp"/>

<style>

h5 {
	margin-top: 10px;
}

.actForReply, .actForBoard{
	font-size: 10px;
	margin-top: 3px;
	margin-bottom: 5px;
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

.reReply {
	border: 1px solid #007bff;
	padding: 2px;
	cursor: pointer;
	margin: 3px;
	color: #007bff;
}

.replyCall, #freeModify, #freeDelete {
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
	word-break: break-word;
}

.blackReplysId {
 	visibility: hidden;
}


.replyMod, .reReplyToUser {
	width:100%;
	background-color: black;
	font-size: 12px;
	color: #666666;
}

.replyModArea, .reModComBut, .reReplyBox {
	display: none;
}

.modReplyBut {
	border: 1px solid #ffffff;
	padding: 2px;
	cursor: pointer;
	margin: 3px;
	color: 	#ffffff;
}

.reReplyBox {
    margin-bottom: 20px;
}


</style>



<!-- 스크립트 -->
<script type="text/javascript">

// 	const inUserId = '${sessionScope.id}';
	const inUserId = '1786827527';

	//게시글 좋아요 싫어요
	function likeHateCheck(kind) {
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

	//리플 비공감 공감
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

	//리플 작성
	function replyToBoard() {
		var replyContent = $("#userReply").val();

		if(inUserId == ''){
			alert("로그인이 필요합니다.");
			return;
		}

		$.ajax({
			url : "../reply/ajax.replyToBoard",
			type : "POST",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId": inUserId,
					"replyContent": replyContent,
					"headReplySeq": 0
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("에러나요");
			}
		})
	}

	//리리플 작성 박스 펼치기
	function replyToReply(replySeq) {
		var reReplyBoxId = 'reReplyBox_'+replySeq;
		document.getElementById(reReplyBoxId).style.display="block";
		document.getElementById(reReplyBoxId).style.visibility="visible";

	}

	//리리플 작성
	function addReReply(replySeq) {
		var reReplyToUser = 'reReplyToUser_'+replySeq;
		var reReplyContent = document.getElementById(reReplyToUser).value;

		if(inUserId == ''){
			alert("로그인이 필요합니다.");
			return;
		}

		$.ajax({
			url : "../reply/ajax.replyToBoard",
			type : "POST",
			data : {
					"boardSeq" : ${freeDetail.boardSeq },
					"inUserId": inUserId,
					"replyContent": reReplyContent,
					"headReplySeq": replySeq
			},
			success : function(data) {
				location.reload();
			},
			error : function() {
				alert("에러나요");
			}
		})

	}

	//리플 수정 박스 펼치기
	function modReply(replySeq) {
		var modReplyId = 'replyModArea_' + replySeq;
		document.getElementById(modReplyId).style.display="block";
		document.getElementById(modReplyId).style.visibility="visible";

		var modReplyBut = 'reModButBefore_' + replySeq;
		document.getElementById(modReplyBut).style.display="none";

		var modReplyComBut = 'reModComButAfter_' + replySeq;
		document.getElementById(modReplyComBut).style.display="block";
	}

	//리플 수정하기
	function modMyReply(replySeq) {
		var modTextareaId = 'replyMod_'+replySeq;
		var replyContent = document.getElementById(modTextareaId).value;

		$.ajax({
			url : "../reply/ajax.modReply",
			type : "POST",
			data : {
					"replySeq" : replySeq,
					"replyContent": replyContent,
					"upUserId": inUserId
			},
			success : function(data) {
				alert('리플 수정 완료');
				location.reload();
			},
			error : function() {
				alert("에러나요");
			}
		})
	}

	//리플 삭제하기
	function delMyReply(replySeq) {
		var delReply = confirm('댓글을 삭제하시겠습니까?');
		if(!delReply){
			return;
		} else {
			$.ajax({
				url : "../reply/ajax.delReply",
				type : "POST",
				data : {
						"replySeq" : replySeq,
						"inUserId": inUserId
				},
				success : function(data) {
					alert('리플 삭제 완료');
					location.reload();
				},
				error : function() {
					alert("에러나요");
				}
			})
		}
	}

	//게시글 삭제
	function deleteFreeBoard() {
		var delReply = confirm('게시글을 삭제하시겠습니까?');
		if(!delReply){
			return;
		} else {
			$.ajax({
				url : "./ajax.delBoard",
				type : "POST",
				data : {
						"boardSeq" : ${freeDetail.boardSeq },
						"inUserId": inUserId
				},
				success : function(data) {
					alert('게시글 삭제 완료');
					location.href='${pageContext.request.contextPath}/free/freeBoardList';
				},
				error : function() {
					alert("에러나요");
				}
			})
		}
	}

	//게시글 수정
	function modifyFreeBoard() {

	}

	//신고된 리플 보기
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

		var callText = 'callPolice_' + replySeq;
		document.getElementById(callText).style.display="none";
	}


	function fn_report(userId){
		window.open("report?userId="+userId,"report", "width=660, height=500, left=250,top=200");
	}

</script>
<!-- 스크립트 끝 -->

<!-- Details Post Section Begin -->
<section class="details-post-section spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 p-0">
            	<c:if test="${sessionScope.id eq freeDetail.inUserId }">
	                <div class="actForBoard">
	                	<a href="javascript:modifyFreeBoard()"><span id="freeModify">수정하기</span></a>
	                	<a href="javascript:deleteFreeBoard()"><span id="freeDelete">삭제하기</span></a>
	                 </div>
            	</c:if>
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
								<c:when test="${replyOnBoard.status eq 'y'}">
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5>${replyOnBoard.nickName }</h5>
			                                <span class="c-date">${replyOnBoard.modDate }</span>
			                                <p class="userReplys">${replyOnBoard.replyContent }</p>
			                                <div class="replyModArea" id="replyModArea_${replyOnBoard.replySeq }">
				                                <textarea class="replyMod" id="replyMod_${replyOnBoard.replySeq }" rows="3" cols="57">${replyOnBoard.replyContent }</textarea>
			                                </div>

				                                <div class="actForReply">
					                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${replyOnBoard.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
					                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${replyOnBoard.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
					                                <a href="javascript:replyToReply('${replyOnBoard.replySeq }')"><span class="reReply">답글달기</span></a>
					                               	<c:choose>
						                               	<c:when test="${sessionScope.id eq replyOnBoard.inUserId}">
							                                <a href="javascript:delMyReply('${replyOnBoard.replySeq }')"><span class="replyCall">삭제하기</span></a>
														</c:when>
														<c:otherwise>
							                                <a href="#"><span class="replyCall" onclick="fn_report('${replyOnBoard.inUserId}')">신고하기</span></a>
														</c:otherwise>
					                               	</c:choose>
					                            </div>
				                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
													<span id="reModButBefore_${replyOnBoard.replySeq }">
				                                	<a href="javascript:modReply('${replyOnBoard.replySeq }')" class="reply-btn"><span id="reModBut_${replyOnBoard.replySeq }">수정하기</span></a>
													</span>
													<span class="reModComBut" id="reModComButAfter_${replyOnBoard.replySeq }">
					                                <a href="javascript:modMyReply('${replyOnBoard.replySeq }')" class="reply-btn"><span id="reModComBut_${replyOnBoard.replySeq }">수정완료</span></a>
													</span>
				                               	</c:if>
			                            </div>
			                        </div>
   			                        <div class="reReplyBox" id="reReplyBox_${replyOnBoard.replySeq }">
			                        	<textarea class="reReplyToUser" id="reReplyToUser_${replyOnBoard.replySeq }"></textarea>
		                                <div class="actForReply">
		                                <a href="javascript:addReReply('${replyOnBoard.replySeq }')"><span class="reReply">작성완료</span></a>
			                            </div>
			                        </div>
								</c:when>
								<c:when test="${replyOnBoard.status eq 'd'}">
			                        <div class="dc-item">
			                            <div class="dc-pic">
			                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-1.jpg" alt="">
			                            </div>
			                            <div class="dc-text">
			                                <h5>${replyOnBoard.nickName }</h5>
			                                <span class="c-date">${replyOnBoard.modDate }</span>
			                                <p class="userReplys">${replyOnBoard.replyContent }</p>
			                                <div class="replyModArea" id="replyModArea_${replyOnBoard.replySeq }">
				                                <textarea class="replyMod" id="replyMod_${replyOnBoard.replySeq }" rows="3" cols="57">${replyOnBoard.replyContent }</textarea>
			                                </div>
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
			                                <p><span id="callPolice_${replyOnBoard.replySeq }"><a class="blackClick" href="javascript:showBlackReply('${replyOnBoard.replySeq }')">신고 접수로 블라인드 처리 된 댓글입니다. 내용을 보려면 클릭해주세요.</a></span></p>
			                                <div class="blackReplys" id="blackReply_${replyOnBoard.replySeq }">${replyOnBoard.replyContent }</div>
                    			            <div class="replyModArea" id="replyModArea_${replyOnBoard.replySeq }">
				                            	<textarea class="replyMod" id="replyMod_${replyOnBoard.replySeq }" rows="3" cols="57">${replyOnBoard.replyContent }</textarea>
			                                </div>
			                                <div class="actForReply">
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${replyOnBoard.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
				                                <a href="javascript:ReplyLikeHate('${replyOnBoard.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${replyOnBoard.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
				                                <c:choose>
					                               	<c:when test="${sessionScope.id eq replyOnBoard.inUserId}">
						                                <a href="javascript:delMyReply('${replyOnBoard.replySeq }')"><span class="replyCall">삭제하기</span></a>
													</c:when>
													<c:otherwise>
														<span class="replyCall" onclick="fn_report('${replyOnBoard.inUserId}')">신고하기</span>
													</c:otherwise>
				                               	</c:choose>
				                            </div>
			                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
												<span id="reModButBefore_${replyOnBoard.replySeq }">
			                                	<a href="javascript:modReply('${replyOnBoard.replySeq }')" class="reply-btn"><span id="reModBut_${replyOnBoard.replySeq }">수정하기</span></a>
												</span>
												<span class="reModComBut" id="reModComButAfter_${replyOnBoard.replySeq }">
				                                <a href="javascript:modMyReply('${replyOnBoard.replySeq }')" class="reply-btn"><span id="reModComBut_${replyOnBoard.replySeq }">수정완료</span></a>
												</span>
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
							                                <div class="replyModArea" id="replyModArea_${rm.replySeq }">
				                            					<textarea class="replyMod" id="replyMod_${rm.replySeq }" rows="3" cols="57">${rm.replyContent }</textarea>
			                                				</div>
							                                <div class="actForReply">
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${rm.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${rm.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
									                            <c:choose>
									                               	<c:when test="${sessionScope.id eq rm.inUserId}">
										                                <a href="javascript:delMyReply('${rm.replySeq }')"><span class="replyCall">삭제하기</span></a>
																	</c:when>
																	<c:otherwise>
																		<span class="replyCall" onclick="fn_report('${replyOnBoard.inUserId}')">신고하기</span>
																	</c:otherwise>
								                               	</c:choose>
							                            	</div>
							                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
							                                	<span id="reModButBefore_${rm.replySeq }">
							                                	<a href="javascript:modReply('${rm.replySeq }')" class="reply-btn"><span id="reModBut_${rm.replySeq }">수정하기</span></a>
																</span>

																<span class="reModComBut" id="reModComButAfter_${rm.replySeq }">
								                                <a href="javascript:modMyReply('${rm.replySeq }')" class="reply-btn"><span id="reModComBut_${rm.replySeq }">수정완료</span></a>
																</span>
							                               	</c:if>
							                            </div>
							                        </div>
												</c:when>
												<c:when test="${rm.status eq 'd' }">
							                        <div class="dc-item reply-item">
							                            <div class="dc-pic">
							                                <img src="${pageContext.request.contextPath}/img/details/comment/comment-2.jpg" alt="">
							                            </div>
							                            <div class="dc-text">
							                                <h5>${rm.nickName }</h5>
							                                <span class="c-date">${rm.modDate }</span>
							                                <p class="userReplys"><a href="#">@${replyOnBoard.nickName }</a> ${rm.replyContent}</p>
							                                <div class="replyModArea" id="replyModArea_${rm.replySeq }">
				                            					<textarea class="replyMod" id="replyMod_${rm.replySeq }" rows="3" cols="57">${rm.replyContent }</textarea>
			                                				</div>
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
							                                <p><span id="callPolice_${rm.replySeq }"><a class="blackClick" href="javascript:showBlackReply('${rm.replySeq }')">신고 접수로 블라인드 처리 된 댓글입니다. 내용을 보려면 클릭해주세요.</a></span></p>
							                                <div class="blackReplys" id="blackReply_${rm.replySeq }">${rm.replyContent }</div>
							                                <div class="replyModArea" id="replyModArea_${rm.replySeq }">
				                            					<textarea class="replyMod" id="replyMod_${rm.replySeq }" rows="3" cols="57">${rm.replyContent }</textarea>
			                                				</div>
							                                <div class="actForReply">
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','1')"><span class="replyHate">비공감 <span id="replyHateCnt_${rm.replySeq }">${replyOnBoard.hateCnt }</span></span></a>
								                                <a href="javascript:ReplyLikeHate('${rm.replySeq }','0')"><span class="replyLike">공감 <span id="replyLikeCnt_${rm.replySeq }">${replyOnBoard.likeCnt }</span></span></a>
								                                <c:choose>
									                               	<c:when test="${sessionScope.id eq rm.inUserId}">
										                                <a href="javascript:delMyReply('${rm.replySeq }')"><span class="replyCall">삭제하기</span></a>
																	</c:when>
																	<c:otherwise>
																		<span class="replyCall" onclick="fn_report('${replyOnBoard.inUserId}')">신고하기</span>
																	</c:otherwise>
								                               	</c:choose>
								                            </div>
							                               	<c:if test="${sessionScope.id eq replyOnBoard.inUserId}">
							                               		<span id="reModButBefore_${rm.replySeq }">
							                                	<a href="javascript:modReply('${rm.replySeq }')" class="reply-btn"><span id="reModBut_${rm.replySeq }">수정하기</span></a>
																</span>

																<span class="reModComBut" id="reModComButAfter_${rm.replySeq }">
								                                <a href="javascript:modMyReply('${rm.replySeq }')" class="reply-btn"><span id="reModComBut_${rm.replySeq }">수정완료</span></a>
																</span>
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