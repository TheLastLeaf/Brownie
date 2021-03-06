<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Team Maker</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
          integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@icon/elegant-icons@0.0.1-alpha.4/elegant-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://raw.githubusercontent.com/9bitStudios/barfiller/master/css/style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css"
          integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css"
          integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>

<style>
    div {
        color: white
    }

    /* ?????? ??????????????? */
    body {
        background: black;
        font-size: 12px;
    }

    p {
        margin: 20px 0px 0px 0px;
        color: #D8D8D8;
    }

    input[type=text] {
        background: black;
        border: 1px solid white;
        color: white;
    }

    .btn-primary {
        background-color: #660099;
        border: none;
    }

    h5 {
        color: white;
    }

    div > div > div > label > img {
        width: 20px;
        height: 20px;
    }

    .btn-danger:not(:disabled):not(.disabled).active {
        background-color: lightblue;
        border-color: lightblue;
        color: purple;
    }

    .btn-danger:hover {
        background-color: coral;
        text-decoration: none;
    }

    /* ??????,??????,??????,????????? ?????? ??????????????? */
    .btn-gmode {
        color: black;
        background-color: #FF8000;
        border: white;
        text-decoration: none;
    }

    /* ????????? ????????? */
    .btn-usepoint {
        color: black;
        background-color: #F2F2F2;
        border: white;
        text-decoration: none;
    }

    input[type="submit"] {
        background: lightgrey;
    }

    /* ????????? ????????? CHECKBOX */
    input.apple-switch {
        position: relative;
        appearance: none;
        outline: none;
        width: 50px;
        height: 30px;
        background-color: #ffffff;
        border: 1px solid #D9DADC;
        border-radius: 50px;
        box-shadow: inset -20px 0 0 0 lightgrey;
        transition-duration: 200ms;
    }

    input.apple-switch:after {
        content: "";
        position: absolute;
        top: 1px;
        left: 1px;
        width: 26px;
        height: 26px;
        background-color: transparent;
        border-radius: 50%;
        box-shadow: 2px 4px 6px rgba(0, 0, 0, 0.2);
    }

    input.apple-switch:checked {
        border-color: #4ED164;
        box-shadow: inset 20px 0 0 0 #4ED164;
    }

    input.apple-switch:checked:after {
        left: 20px;
        box-shadow: -2px 4px 3px rgba(0, 0, 0, 0.05);
    }

    .submit {
        margin: 15px;
    }

    .appleSwitchDiv , .chooseModeDiv, .choosePositionDiv {
        margin-top: 20px;
    }

    .appleSwitch{
        margin: 15px;
    }
</style>

<body>
<script type="text/javascript">
    function fn_chatRoom() {
        const IN_USER_ID = '${sessionScope.id}';
        if(IN_USER_ID==''){
            alert("????????? ??? ?????? ???????????????.");
            return;
        }

        var title = document.getElementById('roomTitle').value;
        var message = document.getElementById('roomContent').value;
        if(title == "" || message == ""){
        	alert("??? ?????? ??????????????????.");
        	return;
        }

        var matchMode = $('#chooseMode').children('.active').get();
        if(matchMode.length < 1) {
            alert("?????? ????????? ??????????????????.");
            return;
        } else if (matchMode.length == 1) {
            matchMode = matchMode[0].id;
            if (matchMode == "normal-game") {
                matchMode = "????????????";
            } else if (matchMode == "rank-game") {
                matchMode = "????????????";
            } else if (matchMode == "free-game") {
                matchMode = "????????????";
            } else if (matchMode == "howling-abyss") {
                matchMode = "?????????";
            }
        }

        var myPosition = $('#chooseMyPosition').children('.active').get();
        console.log("myPosition : "+myPosition)
        if(myPosition == null || myPosition.length < 1){
            alert("?????? ??????????????? ????????? ???????????? ??????????????????");
            return;
        } else if (myPosition.length > 0) {
            myPosition = myPosition[0].id.substring(1, 4);
        }

        var top = 'y';
        var mid = 'y';
        var sup = 'y';
        var jun = 'y';
        var bot = 'y';
        var positions = [];
        var selectPositions = $('#choosePosition').children('.active').get()

        console.log("selectPositions : "+selectPositions)
        if(selectPositions == null || selectPositions.length < 1){
        	alert("?????? ??????????????? ????????? ???????????? ??????????????????");
        	return;
        } else if (selectPositions.length > 0) {
            for(i = 0 ; i < selectPositions.length ; i++){
                positions.push(selectPositions[i].id);
                console.log(selectPositions[i].id);
            }
        }
        if(positions.includes('top')){
            top = 'n';
        }
        if(positions.includes('mid')){
            mid = 'n';
        }
        if(positions.includes('sup')){
            sup = 'n';
        }
        if(positions.includes('jun')){
            jun = 'n';
        }
        if(positions.includes('bot')){
            bot = 'n';
        }

        // var mike = 'n';
        // if($('#flexSwitchCheck:checked').length == 1){
        //     mike = 'y';
        // }

        //????????? ????????? ??????????????? ???????????? ??????????????? *

        var usePoint = 'n';
        if($('#usePointCheck:checked').length == 1){
            usePoint = 'y';
        }

        $.ajax({
            url: "./insert-room",
            type: "POST",
            data: {
                "userId": IN_USER_ID
                , "title": title
                , "message": message
                , "matchMode": matchMode
                , "leader": "y"
                , "status": "y"
                , "usePoint": usePoint
                , "top": top
                , "mid": mid
                , "sup": sup
                , "jun": jun
                , "bot": bot
                , "mike": 'n'
                , "position": myPosition
            },
            success: function (data) {
                var responseData = JSON.parse(data);

                if(responseData.result == 0){
                    alert("???????????? ???????????????. [ ?????? ????????? : "+ responseData.browniePoint + " ]");
                    $('#usePointCheck').prop('checked',false);
                    return;
                } else {
                    openRoom(responseData.TEAMGAME_SEQ, responseData.nickName, responseData.lolId, myPosition);
                    window.close();
                }
            },
            error: function () {
                alert("????????????");
            }
        })
    }
    function openRoom(roomNumber, nickName, lolId, position){
        var chatPop= document.roomInfo;
        var url = '/websocket/chat2';
        window.open('','chatingRoom' + roomNumber,'width=1000, height=700, scroll=no, left=500, top=250');

        chatPop.method = 'post';
        chatPop.action = url;
        chatPop.target = 'chatingRoom' + roomNumber;
        chatPop.roomNumber.value = roomNumber;
        chatPop.nickName.value = nickName;
        chatPop.lolId.value = lolId;
        chatPop.userId.value = '${sessionScope.id}';
        chatPop.position.value = position;
        chatPop.submit();
    }

    $(document).ready(function() {
        //?????? ?????? ??????????????? ???????????? ??? ??????????????? ???????????? ???????????????????????? ?????????
        var topNum = 1;
        $('#top').on("change", function () {
            if(topNum % 2 != 0) {
                $('#mmtop').prop('disabled',true);
                topNum += 1;
            } else {
                $('#mmtop').prop('disabled',false);
                topNum += 1;
            }
        })

        var midNum = 1;
        $('#mid').on("change", function () {
            if(midNum % 2 != 0) {
                $('#mmmid').prop('disabled',true);
                midNum += 1;
            } else {
                $('#mmmid').prop('disabled',false);
                midNum += 1;
            }
        })

        var junNum = 1;
        $('#jun').on("change", function () {
            if(junNum % 2 != 0) {
                $('#mmjun').prop('disabled',true);
                junNum += 1;
            } else {
                $('#mmjun').prop('disabled',false);
                junNum += 1;
            }
        })

        var botNum = 1;
        $('#bot').on("change", function () {
            if(botNum % 2 != 0) {
                $('#mmbot').prop('disabled',true);
                botNum += 1;
            } else {
                $('#mmbot').prop('disabled',false);
                botNum += 1;
            }
        })

        var supNum = 1;
        $('#sup').on("change", function () {
            if(supNum % 2 != 0) {
                $('#mmsup').prop('disabled',true);
                supNum += 1;
            } else {
                $('#mmsup').prop('disabled',false);
                supNum += 1;
            }
        })

        //????????? ????????? ????????? ????????????????????? ????????????
        $('input[type="radio"][name="myPosi"]').click(function(){
            if($(this).prop('checked')){
                $('input[type="checkbox"][name="positions"]').prop('disabled',false);
                var chp = $('#'+this.value).children('.tp').get()[0].id;
                console.log(chp);
                $('#'+chp).prop('disabled',true);
            }
        });
    });

</script>

<div id="preloder">
    <div class="loader"></div>
</div>

<div class="container d-flex justify-content-end">Point : ${userInfo.browniePoint}</div>
<div class="container">
    <div class="row">
        <div class="col text-center" style="border: 1px solid white;">
            <p>
            <h5 class="font-family-maple-light">?????? : ${userInfo.nickName} [ ${userInfo.lolId} ]</h5>
            </p>
            <!------------------------------------------------------------------->
            <form name="roomInfo">
                <input type="hidden" name="roomNumber">
                <input type="hidden" name="position">
                <input type="hidden" name="lolId">
                <input type="hidden" name="userId">
                <input type="hidden" name="nickName">
            </form>
            <!------------------------------------------------------------------->
            <p id="title" class="botton" style="margin-bottom: 10px;">
                <b class="font-family-maple-light">?????? :&nbsp; <input id="roomTitle" type="text" maxlength='12'/></b>
            </p>
            <p id="message" style="margin-top: 10px; margin-bottom: 20px;">
                <b class="font-family-maple-light">?????? :&nbsp; <input id="roomContent" type="text" maxlength='30'/></b>
            </p>

            <div id="chooseMode" class="chooseModeDiv btn-group btn-group-toggle font-family-maple-light"
                 data-toggle="buttons">
                <label class="btn btn-danger btn-gmode Gmode" id="normal-game">
                    <input type="radio" name="jb-radio" class="jb-radio-1 gameMode" value="normal-game">
                    ????????????
                </label>
                &nbsp;
                <label class="btn btn-danger btn-gmode Gmode" id="rank-game">
                    <input type="radio" name="jb-radio" class="jb-radio-2 gameMode" value="rank-game">
                    ????????????
                </label>
                &nbsp;
                <label class="btn btn-danger btn-gmode Gmode" id="free-game">
                    <input type="radio" name="jb-radio" class="jb-radio-3 gameMode" value="free-rank">
                    ????????????
                </label>
                &nbsp;
                <label class="btn btn-danger btn-gmode Gmode" id="howling-abyss">
                    <input type="radio" name="jb-radio" class="jb-radio-4 gameMode" value="howling-abyss">
                    ?????????
                </label>
                &nbsp;
            </div>

            <div class="choosePositionDiv">
                <p class="font-family-maple-light">?????? ????????? ???????????? ???????????????</p>
                <div class="font-family-maple-light btn-group btn-group-toggle" id="chooseMyPosition"
                     data-toggle="buttons">
                    <label class="btn btn-danger position" id="mtop">
                        <input type="radio" name="myPosi" value="top" class="mp" id="mmtop">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="mjun">
                        <input type="radio" name="myPosi" value="jun" class="mp" id="mmjun">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png"
                             alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="mmid">
                        <input type="radio" name="myPosi" value="mid" class="mp" id="mmmid" >
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="mbot">
                        <input type="radio" name="myPosi" value="bot" class="mp" id="mmbot" >
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="msup">
                        <input type="radio" name="myPosi" value="sup" class="mp" id="mmsup" >
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png"
                             alt=""/>
                    </label>
                    &nbsp;
                </div>
            </div>

            <div class="choosePositionDiv">
                <p class="font-family-maple-light">????????? ???????????? ???????????????</p>
                <div class="font-family-maple-light btn-group btn-group-toggle" id="choosePosition"
                     data-toggle="buttons">
                    <label class="btn btn-danger position" id="top">
                        <input type="checkbox" name="positions" value="top" class="tp" id="otop">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="jun">
                        <input type="checkbox" name="positions" value="jun" class="tp" id="ojun">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png"
                             alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="mid">
                        <input type="checkbox" name="positions" value="mid" class="tp" id="omid">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="bot">
                        <input type="checkbox" name="positions" value="bot" class="tp" id="obot">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png" alt=""/>
                    </label>
                    &nbsp;
                    <label class="btn btn-danger position" id="sup">
                        <input type="checkbox" name="positions" value="sup" class="tp" id="osup">
                        <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png"
                             alt=""/>
                    </label>
                    &nbsp;
                </div>
            </div>

            <br/>

            <div class="container appleSwitchDiv">
                <div class="appleSwitch">
                    <label class="form-check-label font-family-maple-light" for="usePointCheck">
                        <input class="apple-switch" type="checkbox" id="usePointCheck" value="usePointForTop">
                        <br/>500???????????? ????????? 10?????? ????????? ????????????
                    </label>
                </div>
<%--                <div class="appleSwitch">--%>
<%--                    <label class="form-check-label font-family-maple-light" for="flexSwitchCheck">--%>
<%--                        <input class="apple-switch" type="checkbox" id="flexSwitchCheck">--%>
<%--                        <br/>????????? ????????? ??????--%>
<%--                    </label>--%>
<%--                </div>--%>
            </div>
            <br/>
            <div class="submit font-family-maple-light">
                <input type="submit" value="??? ????????? ??????????????? ??????!" onclick="fn_chatRoom()">
            </div>
        </div>
    </div>
</div>

<!-- Js Plugins -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"
        integrity="sha512-IsNh5E3eYy3tr/JiX2Yx4vsCujtkhwl7SLqgnwLNgf04Hrt9BT9SXlLlZlWx+OK4ndzAoALhsMNcCmkggjZB1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js"
        integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://raw.githubusercontent.com/9bitStudios/barfiller/master/js/jquery.barfiller.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/jquery.slicknav.js"
        integrity="sha512-AmJ0T6lpw/ZQtCleMyfbraDy8AGQ9tWaB/PmRkXdKxH9Kvo0oTuW6+2hTEQ89mHkFIO/LpColEe3+QE+FJtgIg=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
        integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"
        integrity="sha512-2rNj2KJ+D8s1ceNasTIex6z4HWyOnEYLVC3FigGOmyQCZc2eBXKgOxQmo3oKLHyfcj53uz4QMsRCWNbLd32Q1g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>