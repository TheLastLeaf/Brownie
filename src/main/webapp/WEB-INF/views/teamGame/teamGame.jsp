<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:import url="../layout/header.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>
<style>
    #floating-left {
        position: fixed;
        left: 6%;
        top: 300px;
        margin-left: 50px;
        width: 150px;
    }

    #floating-right {
        position: fixed;
        right: 50%;
        top: 300px;
        margin-right: -750px;
        width: 150px;
    }

    .innerBox {
        display: inline-block;
        width: 24%;
        height: 160px;
        border: 1px solid white;
        border-radius: 5px;
        color: white;
        margin: 3px 4px 7px;
        text-align: center;
        position: relative;
        background: #1C1C1C;
    }

    .outBox {
        border: none;
    }

    .positionTop {
        color: white;
        border-radius: 5px;
    }

    .blank-position {
        background: white;
    }

    .checked-position {
        background: red;
    }

    .positionJun {
        color: black;
        border-radius: 5px;
    }

    .positionMid {
        color: black;
        border-radius: 5px;
    }

    .positionAd {
        color: white;
        border-radius: 5px;
    }

    .positionSup {
        color: black;
        border-radius: 5px;
    }

    button > img {
        width: 17px;
        height: 17px;
    }

    .message {
        margin: 5px;
        word-break: break-all;
    }

    .roomTitle {
        font-family: maplelight;
        font-weight: bolder;
        margin: 5px;
        border-radius: 5px;
        background: grey;
    }

    .micUse {
        width: 25px;
        height: 25px;
        margin: 3px;
    }

    .tierImg {
        width: 25px;
        height: 25px;
    }

    .micPic {
        width: 25px;
        height: 25px;
        margin: 3px;
    }

    .gmode {
        margin: 0px;
        display: flex;
        align-items: center;
    }
</style>

<script type="text/javascript">
    function fn_makeRoom() {
        if(${sessionScope.id == null}){
            alert('????????? ??? ??????????????????.');
            return;
        }
        window.open("teamGame/makeRoom", "makeTeam",
            "width=660, height=570, left=250,top=200");
    }

    function fn_chatRoom(selectObject) {
        var userId = '${sessionScope.id}';

        if(userId==''){
            alert("????????? ??? ?????? ???????????????.");
            return;
        }

        var selectPosi = selectObject.id;
        var roomNumber = selectObject.className.split(" ")[2];
        var positionSeq = selectObject.className.split(" ")[3];

        console.log("positionSeq : "+positionSeq)
        console.log("roomNumber : "+roomNumber)
        console.log("positionSeq : "+positionSeq)

        const data = {
            "userId": userId,
            "teamGameSeq" : roomNumber,
            "roomNumber" : roomNumber,
            "positionSeq": positionSeq,
            "position": selectPosi
        }

        $.ajax({
            url: "./teamGame/update-position",
            type: "POST",
            data: data,
            dataType: "json",
            success: function (data) {
                //?????? ????????? ??????????????? ???????????? ????????? ??????
                if(data.info=="exist"){
                    alert("?????? ????????? ??????????????????.");
                    location.reload();
                } else if(data.info=="good") {
                    console.log(data.roomNumber, data.position, data.positionSeq);
                    openRoom(data.roomNumber, data.position, data.positionSeq);
                    location.reload();
                } else if(data.info=="nobody") {
                    alert(" ?????? ????????? ?????? ????????? ");
                    console.log(data.roomNumber);
                    openRoom(data.roomNumber, data.position, data.positionSeq);
                    location.reload();
                } else {
                    alert(" ??????????????? ?????????????????? ! ");
                    location.reload();
                }
            },
            error: function () {
                alert("????????????");
            }
        })

    }

    function fn_blockRoom() {
        alert("?????? ???????????? ????????? ????????? ???????????????. ?????? ???????????? ??????????????????.");
        window.location.reload();
    }

    function openRoom(roomNumber, position, positionSeq) {
        console.log('??? ?????? : ', roomNumber);
        var chatPop = document.roomInfo;
        var url = '/websocket/chat2';
        window.open('', 'chatingRoom' + roomNumber, 'width=1000, height=700, scroll=no, left=500, top=250');

        chatPop.action = url;
        chatPop.method = 'post';
        chatPop.target = 'chatingRoom' + roomNumber;
        chatPop.roomNumber.value = roomNumber;
        chatPop.positionSeq.value = positionSeq;
        chatPop.position.value = position;
        chatPop.userId.value = '${userInfo.userId}';
        chatPop.nickName.value = '${userInfo.nickName}';
        chatPop.lolId.value = '${userInfo.lolId}';
        chatPop.submit();
    }
</script>
<!-- Main Content Post Section Begin -->

<section class="details-post-section spad" style="padding: 0;">
    <!-- class="container"??? ?????? ????????? ??????????????? ?????? -->
    <div class="container" style="width: 900px;">

        <!-- ?????? ???????????? | ?????? | ?????? | ????????? -->
        <div class="p-0">
            <div class="details-text typography-page" style="width: 1050px; margin-left: -90px;">

                <div class="dt-breadcrumb" style="margin-bottom: 10px;">
                    <div class="dt-bread-option" style="margin-bottom: 20px;">
                        <a href="#">team</a>
                        <span>slave</span>
                    </div>
                    <div>
                        <h4 class="text-white">Make your own TEAM</h4>
                    </div>
                </div>

                <!-- ?????? box begin -->
                <div style="border: 1px solid white; display: block; color: #d5d5d5; font-size: 13px; margin-bottom: 10px;"
                     class="dt-share">
                    <table style="width: 100%;">
                        <tr>
                            <th>??? ??????</th>
                            <td>
                                <input type="text" name="searchRoomTitle" style="margin-bottm: 7px; background: #ffffff; border: 1px solid black; width: 300px;" />
                            </td>
                            <th rowspan="3" style="width: 100px; text-align: center;">
                            <!-- ????????????????????? (??????)------------------------------------------------>
								<button type="submit" id="searchBtn" class="btn btn-primary">??????</button>
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 140px;">?????? ??????</th>
                            <td style="width: auto;">
                                <!-- ????????????????????? (??????)------------------------------------------------>
								<label for="all">
									<input type='radio' id="all" name='gametype' value='all' checked="checked"/>
									??????
								</label>
								<label for="solo">
									<input type='radio' id="solo" name='gametype' value='????????????'/>
									?????? ??????
								</label>
								<label for="free">
									<input type='radio' id="free" name='gametype' value='????????????' />
									?????? ??????
								</label>
								<label for="normal">
									<input type='radio' id="normal" name='gametype' value='????????????' />
									?????? ??????
								</label>
								<label for="abyss">
									<input type='radio' id="abyss" name='gametype' value='?????????' />
									?????????
								</label>
								<!-- ????????????????????? (??????)------------------------------------------------>
                            </td>
                        <tr>
                            <th>?????? ?????????</th>
                            <td>
                                <!-- ????????????????????? (??????)------------------------------------------------>
								<label for="topP">
									<input type='checkbox' id="topP" name='position' value='t' />
									???
								</label>
								<label for="junP">
									<input type='checkbox' id="junP" name='position' value='j' />
									??????
								</label>
								<label for="midP">
									<input type='checkbox' id="midP" name='position' value='m' />
									??????
								</label>
								<label for="botP">
									<input type='checkbox' id="botP" name='position' value='b' />
									??????
								</label>
								<label for="supP">
									<input type='checkbox' id="supP" name='position' value='s' />
									?????????
								</label>
								<!-- ????????????????????? (??????)------------------------------------------------>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- ?????? box end -->
                <!------------------------------------------------------------------->
                <form name="roomInfo">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="roomNumber">
                    <input type="hidden" name="positionSeq">
                    <input type="hidden" name="position">
                    <input type="hidden" name="lolId">
                    <input type="hidden" name="userId">
                    <input type="hidden" name="nickName">
                </form>
                <!------------------------------------------------------------------->
                <div class="dt-desc" style="display: block;">
                    <div class="row outBox" style="margin: auto;">
                        <!-- ???????????? begin -->
                        <div class="innerBox text-center justify-content-center align-items-center d-flex">
                            <!-- ????????????????????? (??????)------------------------------------------------>
							<label for="makeRoom" onclick="fn_makeRoom()" style="cursor: pointer;">
								<img id="makeRoom" style="width: 50px; margin: 5px;" src="${pageContext.request.contextPath}/img/teamGame/button.png">
								&nbsp; ????????????
							</label>
                        </div>

                        <c:forEach var="teamGameList" items="${teamGameList }">
                            <div class="innerBox text-center" id="roomBox">
                                <div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
                                    <p class="col-sm gmode" style="text-align: left;">
                                        <b>${teamGameList.matchMode}</b>
                                    </p>
                                    <p class="col-sm" style="margin: 0; text-align: right;">
                                        <c:if test='${teamGameList.mike eq "y"}'>
                                            <img class="micPic"
                                                 src="${pageContext.request.contextPath}/img/teamGame/mic_o.jpg"/>
                                        </c:if>
                                    </p>
                                </div>
                                <div class="roomTitle">[${teamGameList.teamGameSeq}] ${teamGameList.title}</div>
                                <p style="margin: 10px 0px 3px;">
                                    <c:set var="TGSeq" value="${teamGameList.teamGameSeq}"/>
                                    <c:choose>
                                        <c:when test='${teamPosition[TGSeq].top eq "y"}'>
                                            <button type="button" class="positionTop checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Top.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button"
                                                    class="positionTop blank-position ${teamGameList.teamGameSeq} ${teamGameList.positionSeq}"
                                                    onclick="fn_chatRoom(this)" id="top">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Top.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test='${teamPosition[TGSeq].jun eq "y"}'>
                                            <button type="button" class="positionJun checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Jungle.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button"
                                                    class="positionJun blank-position ${teamGameList.teamGameSeq} ${teamGameList.positionSeq}"
                                                    onclick="fn_chatRoom(this)" id="jun">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Jungle.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test='${teamPosition[TGSeq].mid eq "y"}'>
                                            <button type="button" class="positionMid checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Mid.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button"
                                                    class="positionMid blank-position ${teamGameList.teamGameSeq} ${teamGameList.positionSeq}"
                                                    onclick="fn_chatRoom(this)" id="mid">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Mid.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test='${teamPosition[TGSeq].bot eq "y"}'>
                                            <button type="button" class="positionAd checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Bot.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button"
                                                    class="positionAd blank-position ${teamGameList.teamGameSeq} ${teamGameList.positionSeq}"
                                                    onclick="fn_chatRoom(this)" id="bot">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Bot.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test='${teamPosition[TGSeq].sup eq "y"}'>
                                            <button type="button" class="positionSup checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Support.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button"
                                                    class="positionSup blank-position ${teamGameList.teamGameSeq} ${teamGameList.positionSeq}"
                                                    onclick="fn_chatRoom(this)" id="sup">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Support.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <div class=""
                                     style="width: 100%; display: flex; justify-content: center; margin-bottom: 30px;">
                                    <p class="message">${teamGameList.message}</p>
                                </div>
                                <div class="row text-white"
                                     style="margin: 0; position: absolute; bottom: 0; width: 100%; border-top: 1px solid white; border-radius: 10px;">
                                    <div class="col-sm-8"
                                         style=" white-space: nowrap; margin: 0; display: flex;">
                                        <img class="tierImg" src="${pageContext.request.contextPath}/img/lol/lolTier/grandMaster.png"/>
                                        <span style="text-overflow: ellipsis; overflow: hidden; width: 100px; white-space: nowrap;">
                                                ${teamGameList.lolId}
                                        </span>
                                    </div>

                                    <div class="col-sm-4"
                                         style=" white-space: nowrap; margin: 0; display: flex; justify-content: flex-end;">${teamGameList.nickName}
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                        <!-- ???????????? ??? end -->


                    </div>
                </div>

                <!-- ??????????????? begin -->
				<!-- ????????????????????? (???????????????)------------------------------------------------>
				<div class="paging col-12 pagination-item" style="position: relative;">
					<div class="col-12" style="display: flex; justify-content: center;">
						<c:if test="${page.prev}">
							<a href="/teamGame?num=${page.startPageNum-1}&searchRoomTitle=${page.searchRoomTitle}&searchGameType=${page.searchGameType}&searchPositions=${page.searchPositions}">prev</a>
						</c:if>
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
							<c:choose>
								<c:when test="${page.num != num}">
									<a href="/teamGame?num=${num}&searchRoomTitle=${page.searchRoomTitle}&searchGameType=${page.searchGameType}&searchPositions=${page.searchPositions}">${num}</a>
								</c:when>
								<c:otherwise>
									<a href="#">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${page.next}">
							<a href="/teamGame?num=${page.endPageNum+1}&searchRoomTitle=${page.searchRoomTitle}&searchGameType=${page.searchGameType}&searchPositions=${page.searchPositions}">next</a>
							<%-- 							<a href="/user/info/${userOneSelect.userId}?num=${page.endPageNum+1}&searchType=${page.searchType}&keyword=${page.keyword}">next</a> --%>
						</c:if>
					</div>
				</div>
				<!-- ??????????????? end -->
				<!-- ????????????????????? (???????????????)------------------------------------------------>
                <br/>

            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->
<!-- ????????????????????? (????????????)------------------------------------------------>
<script>
var searchPositions = [];
document.getElementById("searchBtn").onclick = function() {
	var searchRoomTitle = $("input[name='searchRoomTitle']").val();
	let searchGameType = $("input[name='gametype']:checked").val();
	$('input[name=position]:checked').each(function() {
		searchPositions.push($(this).val());
	});
	location.href = "/teamGame?num=1" + "&searchRoomTitle="
			+ searchRoomTitle + "&searchGameType=" + searchGameType
			+ "&searchPositions=" + searchPositions;
}
</script>

<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>