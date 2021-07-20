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
        height: auto;
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
        window.open("teamGame/makeRoom", "makeTeam",
            "width=660, height=570, left=250,top=200");
    }

    function fn_chatRoom(selectObject) {
        console.log(selectObject)
        var top = 'n';
        var mid = 'n';
        var sup = 'n';
        var jun = 'n';
        var bot = 'n';

        var selectPosi = selectObject.id;
        var roomNumber = selectObject.className.split(" ")[2];

        $.ajax({
            url: "./insert-position",
            type: "post",
            data: {
                "userId": "1786827527"
                , "roomNumber" : roomNumber
                , "position": selectPosi
            },
            success: function (data) {
                alert("귀여운 우디 "+data);
                //openRoom("7286");
            },
            error: function () {
                alert("에러나요");
            }
        })

    }

    function fn_blockRoom() {
        alert("해당 포지션을 선택한 유저가 존재합니다. 다른 포지션을 선택해주세요.");
        window.location.reload();
    }
    function openRoom(roomNumber){
        console.log('방 번호 : ', roomNumber);
        var chatPop= document.roomInfo;
        var url = 'http://192.168.41.27/websocket/chat2';
        window.open('','chatingRoom'+roomNumber,'width=1100, height=720, scroll=no, left=500, top=250');

        chatPop.action = url;
        chatPop.target = 'chatingRoom'+roomNumber;
        chatPop.roomNumber.value = roomNumber;
        chatPop.submit();
    }
</script>
<!-- Main Content Post Section Begin -->

<section class="details-post-section spad" style="padding: 0;">
    <!-- class="container"는 글을 가운데 정렬해주는 역할 -->
    <div class="container" style="width: 900px;">

        <!-- 검색 랭크기준 | 제목 | 라인 | 닉네임 -->
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

                <!-- 검색 box begin -->
                <div style="border: 1px solid white; display: block; color: #d5d5d5; font-size: 13px; margin-bottom: 10px;"
                     class="dt-share">
                    <table style="width: 100%;">
                        <tr>
                            <th>방 제목</th>
                            <td>
                                <input type="text"
                                       style="margin-bottm:7px; background: #ffffff; border: 1px solid black; width: 300px;"/>
                            </td>
                            <th rowspan="3" style="width: 100px; text-align: center;"><input type='submit' value="검색">
                            </th>
                        </tr>
                        <tr>
                            <th style="width: 140px;">게임 모드</th>
                            <td style="width: auto;">
                                <input type='checkbox' name='gametype' value='solo'/>
                                솔로 랭크
                                <input type='checkbox' name='gametype' value='free'/>
                                자유 랭크
                                <input type='checkbox' name='gametype' value='normal'/>
                                일반 게임
                                <input type='checkbox' name='gametype' value='abyss'/>
                                칼바람
                            </td>
                        <tr>
                            <th>희망 포지션</th>
                            <td>
                                <input type='checkbox' name='position' value='t'/>
                                탑
                                <input type='checkbox' name='position' value='m'/>
                                미드
                                <input type='checkbox' name='position' value='j'/>
                                정글
                                <input type='checkbox' name='position' value='b'/>
                                바텀
                                <input type='checkbox' name='position' value='a'/>
                                젓가락
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 검색 box end -->
                <!------------------------------------------------------------------->
                <form name="roomInfo">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" name="roomNumber">
                </form>
                <!------------------------------------------------------------------->
                <div class="dt-desc" style="display: block;">
                    <div class="row outBox" style="margin: auto;">
                        <!-- 방만들기 begin -->
                        <div class="innerBox text-center justify-content-center align-items-center d-flex">
                            <label for="makeRoom" onclick="fn_makeRoom()">
                                <img id="makeRoom" style="width: 50px; margin: 5px"
                                     src="${pageContext.request.contextPath}/img/teamGame/button.png">
                                &nbsp; 방만들기
                            </label>
                        </div>

                        <c:forEach var="teamGameList" items="${teamGameList }">

                            <div class="innerBox text-center" id="roomBox">
                                <div class="row text-white" style="margin: 0; background: black; font-size: 14px;">
                                    <p class="col-sm gmode" style="text-align: left;">
                                        <b>${teamGameList.matchMode}</b>
                                    </p>
                                    <p class="col-sm" style="margin: 0; text-align: right;">
                                        <img class="micPic"
                                             src="${pageContext.request.contextPath}/img/teamGame/mic_o.jpg"/>
                                    </p>
                                </div>
                                <div class="roomTitle">${teamGameList.teamGameSeq} ${teamGameList.title}</div>
                                <p style="margin: 10px 0px 3px;">
                                    <c:set var="posiSeq" value="${teamGameList.positionSeq}"/>
                                    <c:choose>
                                        <c:when test="${teamPosition[posiSeq][0].top eq 'y'}">
                                            <button type="button" class="positionTop checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Top.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="positionTop blank-position ${teamGameList.teamGameSeq}"
                                                    onclick="fn_chatRoom(this)" id="top">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Top.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${teamPosition[posiSeq][0].jun eq 'y'}">
                                            <button type="button" class="positionJun checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Jungle.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="positionJun blank-position ${teamGameList.teamGameSeq}"
                                                    onclick="fn_chatRoom(this)" id="jun">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Jungle.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${teamPosition[posiSeq][0].mid eq 'y'}">
                                            <button type="button" class="positionMid checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Mid.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="positionMid blank-position ${teamGameList.teamGameSeq}"
                                                    onclick="fn_chatRoom(this)" id="mid">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Mid.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${teamPosition[posiSeq][0].bot eq 'y'}">
                                            <button type="button" class="positionAd checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Bot.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="positionAd blank-position ${teamGameList.teamGameSeq}"
                                                    onclick="fn_chatRoom(this)" id="bot">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Bot.png"/>
                                            </button>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:choose>
                                        <c:when test="${teamPosition[posiSeq][0].sup eq 'y'}">
                                            <button type="button" class="positionSup checked-position"
                                                    onclick="fn_blockRoom()">
                                                <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Grandmaster-Support.png"/>
                                            </button>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="positionSup blank-position ${teamGameList.teamGameSeq}"
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
                                    <div class="col-sm-6"
                                         style="margin: 0; display: flex; justify-content: flex-end;">${teamGameList.inUserId}</div>
                                    <div class="col-sm-6"
                                         style="margin: 0; display: flex; justify-content: flex-start;">
                                        <img class="tierImg"
                                             src="${pageContext.request.contextPath}/img/lol/lolTier/grandMaster.png"/>
                                        [G·M]
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- 만들어진 방 end -->


                    </div>
                </div>

                <!-- 페이징 처리 -->
                <div class="pagind" style="display: flex; justify-content: center;">
                    <a href="#">[prev]</a>
                    <a href="#">[1]</a>
                    <a href="#">[2]</a>
                    <a href="#">[3]</a>
                    <a href="#">[4]</a>
                    <a href="#">[next]</a>
                </div>
                <br/>

            </div>
        </div>
    </div>
</section>
<!-- Details Post Section End -->

<c:import url="../layout/footer.jsp">
    <c:param name="path" value="${pageContext.request.contextPath}"/>
</c:import>