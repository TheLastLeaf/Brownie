<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marvel.css" type="text/css">

<style>

    .point {
        font-weight: bolder;
        color: black;
        font-size: 30px;
    }

    .logWrite {
        font-weight: bold;
        color: black;
        font-size: 14px;
    }

    .sideKick {
        display: inline-block;
        float: left;
        position: absolute;
        background-color: cornflowerblue;
        width: 450px;
        height: 920px;
        top: 700px;
        border-radius: 10px;
    }


    .pan {
        display: inline-block;
        border-collapse: separate;
        border-spacing: 6px;
        border: 3px solid black;
        vertical-align: middle;
        text-align: center;
    }

    .pan td {
        border-radius: 14px;
        width: 180px;
        height: 180px;
    }

    .td_tb {
        border: 2px solid black;
        background: white;
    }

    .td_rl {
        border: 2px solid black;
        background: white;
    }

    .corner {
        background: white;
        text-align: center;
    }

    .center {
        background: white;
        border-bottom: 2px solid black;
    }

    .player {
        z-index: inherit;
        position: relative;
    }

    .land {
        width: 128px;
        height: 128px;
    }

    /*주사위*/

    #dice-side-2 {
        display: none;
    }

    .dicePic {
        display: inline-block;
    }

    #status {
        font-weight: 900;
        font-size: 45px;
        font-family: "strato-roman";
    }

    .wrapper {
        border-radius: 14px;
        display: block;
        height: 100%;
        width: 100%;
        background-image: none;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: 100% 100%;
    }

    .tamin {
        height: 200px;
        position: relative;
        top: 160px;
    }

    .startLine {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/use/start.png");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        
    }

    .l1 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[0].kind}/${infoList[0].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[0]};
    }

    .l2 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[1].kind}/${infoList[1].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[1]};
    }

    .l3 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[2].kind}/${infoList[2].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[2]};
    }

    .l4 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[3].kind}/${infoList[3].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[3]};
    }

    .l5 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[4].kind}/${infoList[4].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[4]};
    }

    .l6 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[5].kind}/${infoList[5].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[5]};
    }

    .l7 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[6].kind}/${infoList[6].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[6]};
    }

    .l8 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[7].kind}/${infoList[7].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[7]};
    }

    .l9 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[8].kind}/${infoList[8].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[8]};
    }

    .l10 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[9].kind}/${infoList[9].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[9]};
    }

    .l11 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[10].kind}/${infoList[10].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[10]};
    }

    .l12 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[11].kind}/${infoList[11].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[11]};
    }

    .l13 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[12].kind}/${infoList[12].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[12]};
    }

    .l14 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[13].kind}/${infoList[13].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[13]};
    }

    .l15 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[14].kind}/${infoList[14].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[14]};
    }

</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
         data-setbg="${pageContext.request.contextPath}/img/miniGame/banner3.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb-text">
                    <h3>
                        <h1 data-heading="Brownie Marble" style="z-index: 5">
							<span data-heading="Brownie Marble" contenteditable>
								Brownie Marble
							</span>
                        </h1>
                        <span style="z-index: -100;"> <i
                                class="fas fa-dice fa-8x fa-spin"></i>
						</span>

                    </h3>
                    <div class="bt-option"></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<script type="text/javascript">
    var playerPos = ${player.position};
    var round = ${player.round};
    var hp = ${player.hp};
    var item = '${player.item}';
    var point = ${player.point};
    var browniePoint = ${player.browniePoint};
    var recentMap = '${player.recentMap}';
    recentMap = recentMap.replace("[", "");
    recentMap = recentMap.replace("]", "");
    recentMap = recentMap.split(", ");
    console.log("first" + recentMap);
    var quest = '${player.quest}';
    var dicetimes = ${player.dicetimes};
    var recentHp = ${player.recentHp};

    //설정
    var playerImg = "<div class='player'><i style='color: red;' class='fas fa-chess-knight fa-8x'></i></div>";
    var diceSpeed = 450; // 주사위속도
    var side1 = 0;

    /* 주사위 */
    window.onload = function () {
        $(".l" + playerPos + "").append(playerImg);

        for (var i = 0; i < bubblyButtons.length; i++) {
            bubblyButtons[i].addEventListener('click', animateButton, false);
        }
        //클릭중
        $('#btnRoll')
            .mousedown(
                function () {
                    $('.wrapper')
                        .css('background-image',
                            "url('${pageContext.request.contextPath}/img/miniGame/rolling.gif')")
                    $('.tamin').css('visibility', 'hidden')
                });
        $('#btnRoll')
            .mouseup(//클릭끝
                function () {
                    $('.wrapper')
                        .css('background-image',
                            "url('${pageContext.request.contextPath}/img/miniGame/diceDrop.gif')")
                    setTimeout("reset()", 2000);
                    setTimeout("diceDis()", 250);

                });
    }


    var animateButton = function (e) {
        e.preventDefault;
        //reset animation
        e.target.classList.remove('animate');

        e.target.classList.add('animate');
        setTimeout(function () {
            console.log(2);
            e.target.classList.remove('animate');
        }, 700);
    };

    var bubblyButtons = document.getElementsByClassName("learn-more");

    /*  */


    function diceDis() {
        $('#btnRoll').css('visibility', 'hidden')
    }

    function diceApper() {
        $('#btnRoll').css('visibility', 'visible')
    }

    function reset() {
        $('.wrapper').css('background-image', "none")
        $('.tamin').css('visibility', 'visible')
    }

    //반환점 돌면 맵랜덤리셋하기(ajax)
    function autoRenew() {
        temp = "[";
        for (var i = 0; i < 15; i++) {
            if (i != 0) {
                temp += ", "
            }
            temp += recentMap[i]
            if (i == 14) {
                temp += "]"
            }
        }
        console.log("temp" + temp);
        $.ajax({
            url: "./ajax.autorenew",
            type: "post",
            data: {
                "position": playerPos,
                "round": round,
                "hp": hp,
                "item": item,
                "point": point,
                "recentMap": temp,
                "quest": quest,
                "dicetimes": dicetimes,
                "recentHp": recentHp
            },
            success: function (data) {
                if (data == 1) {
                    console.log("갱신저장 성공!");
                }
            },
            error: function () {
                console.log("갱신저장 실패!");
            }
        })
    }

    function rndMapCreate() {
        $.ajax({
            url: "./ajax.rndmapcreate",
            type: "post",
            async: false,
            data: {
                "position": playerPos,
                "round": round,
                "hp": hp,
                "item": item,
                "point": point,
                "quest": quest,
                "dicetimes": dicetimes,
                "recentHp": recentHp
            },
            success: function (data) {
                recentMap = [];
                for (var i = 0; i < data.length; i++) {
                    recentMap.push(data[i].seq);
                }

                $('.l1').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[0].kind + "/" + data.info[0].imgName);
                $('.l2').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[1].kind + "/" + data.info[1].imgName);
                $('.l3').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[2].kind + "/" + data.info[2].imgName);
                $('.l4').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[3].kind + "/" + data.info[3].imgName);
                $('.l5').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[4].kind + "/" + data.info[4].imgName);
                $('.l6').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[5].kind + "/" + data.info[5].imgName);
                $('.l7').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[6].kind + "/" + data.info[6].imgName);
                $('.l8').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[7].kind + "/" + data.info[7].imgName);
                $('.l9').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[8].kind + "/" + data.info[8].imgName);
                $('.l10').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[9].kind + "/" + data.info[9].imgName);
                $('.l11').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[10].kind + "/" + data.info[10].imgName);
                $('.l12').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[11].kind + "/" + data.info[11].imgName);
                $('.l13').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[12].kind + "/" + data.info[12].imgName);
                $('.l14').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[13].kind + "/" + data.info[13].imgName);
                $('.l15').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[14].kind + "/" + data.info[14].imgName);
                
                $('.l1').css('background-color', data.landColor[0]);
                $('.l2').css('background-color', data.landColor[1]);
                $('.l3').css('background-color', data.landColor[2]);
                $('.l4').css('background-color', data.landColor[3]);
                $('.l5').css('background-color', data.landColor[4]);
                $('.l6').css('background-color', data.landColor[5]);
                $('.l7').css('background-color', data.landColor[6]);
                $('.l8').css('background-color', data.landColor[7]);
                $('.l9').css('background-color', data.landColor[8]);
                $('.l10').css('background-color', data.landColor[9]);
                $('.l11').css('background-color', data.landColor[10]);
                $('.l12').css('background-color', data.landColor[11]);
                $('.l13').css('background-color', data.landColor[12]);
                $('.l14').css('background-color', data.landColor[13]);
                $('.l15').css('background-color', data.landColor[14]);
            },
            error: function () {
                alert("맵생성 실패");
            }
        })
    }

    //랜드효과발동
    function effectAct() {
        var objposition = "start";
        if (playerPos != 0) {
            objposition = recentMap[playerPos - 1];
        }
        $.ajax({
            url: "./ajax.effectact",
            type: "post",
            data: {
                "UserPosition": playerPos,
                "ObjPosition": objposition,
                "diceNum" : side1
            },
            success: function (data) {
                   console.log("data 삽입성공!");
                   
                   console.log("player");
                   console.log(data.player);
                   console.log("player.point");
                   console.log(data.player.point);
                   console.log("player.hp");
                   console.log(data.player.hp);
                   console.log("log");
                   console.log(data.log);
                   console.log("site");
                   console.log(data.site);
                   
                   $(".bpoint").html("마블게임 포인트 : "+data.site.browniePoint);
                   $(".mpoint").html("브라우니 포인트 : "+data.player.point);
                   $("#logHome").html(data.log);
                   
                   autoRenew();
            },
            error: function () {
                alert("효과 실패!");
            }
        })
    }

    //디폴트주사위
    function dice() {
        const buttonRoolDice = document.querySelector('.learn-more');

        const diceSide1 = document.getElementById('dice-side-1');
        const status1 = document.getElementById('status');

        side1 = Math.floor(Math.random() * 6) + 1;

        var num = side1;


        if (num == 1) {
            num = "<i class='fas fa-dice-one fa-7x'></i>";
        }
        if (num == 2) {
            num = "<i class='fas fa-dice-two fa-7x'></i>";
        }
        if (num == 3) {
            num = "<i class='fas fa-dice-three fa-7x'></i>";
        }
        if (num == 4) {
            num = "<i class='fas fa-dice-four fa-7x'></i>";
        }
        if (num == 5) {
            num = "<i class='fas fa-dice-five fa-7x'></i>";
        }
        if (num == 6) {
            num = "<i class='fas fa-dice-six fa-7x'></i>";
        }

        diceSide1.innerHTML = num;

        status1.innerHTML = side1 + "!";

        setTimeout('move(' + side1 + ')', 1900);
    }

    //한번더! 주사위 더블이벤트
    function doubleDice() {
        const buttonRoolDice = document.querySelector('.learn-more');

        const diceSide1 = document.getElementById('dice-side-1');
        const diceSide2 = document.getElementById('dice-side-2');
        const status1 = document.getElementById('status');

        side1 = Math.floor(Math.random() * 6) + 1;
        const side2 = Math.floor(Math.random() * 6) + 1;

        var num = [side1, side2];

        const diceTotal = side1 + side2;

        for (var i = 0; i < num.length; i++) {
            if (num[i] == 1) {
                num[i] = "<i class='fas fa-dice-one fa-7x'></i>";
            }
            if (num[i] == 2) {
                num[i] = "<i class='fas fa-dice-two fa-7x'></i>";
            }
            if (num[i] == 3) {
                num[i] = "<i class='fas fa-dice-three fa-7x'></i>";
            }
            if (num[i] == 4) {
                num[i] = "<i class='fas fa-dice-four fa-7x'></i>";
            }
            if (num[i] == 5) {
                num[i] = "<i class='fas fa-dice-five fa-7x'></i>";
            }
            if (num[i] == 6) {
                num[i] = "<i class='fas fa-dice-six fa-7x'></i>";
            }
        }

        diceSide1.innerHTML = num[0];
        diceSide2.innerHTML = num[1];

        status1.innerHTML = diceTotal + "!";

        if (side1 === side2) {
            status1.innerHTML += ' 더블! 한접시 더!<br>';
        }

        setTimeout('move(' + side1 + ')', 2000);
    }

    //상인
    function merchant() {

    }

    //이동
    function move(diceTotal) {
        for (var i = 0; i < diceTotal; i++) {
            if (0 <= playerPos && playerPos <= 3) {
                leftMove();
                ++playerPos;
            } else if (4 <= playerPos && playerPos <= 7) {
                downMove();
                ++playerPos;
            } else if (8 <= playerPos && playerPos <= 11) {
                rightMove();
                ++playerPos;
            } else if (12 <= playerPos && playerPos <= 15) {

            	upMove();
                ++playerPos;
            }
            if (playerPos == 16) {
                playerPos = 0;
                rndMapCreate();
            }
        }
        effectAct(side1);

        setTimeout('diceApper()', 1500);
    }

    //시각적 이동
    function leftMove() {
        $(".player").animate({
            left: "+=186"
        }, diceSpeed);
    }

    function rightMove() {
        $(".player").animate({
            left: "-=186"
        }, diceSpeed);
    }

    function downMove() {
        $(".player").animate({
            top: "+=186"
        }, diceSpeed);
    }

    function upMove() {
        $(".player").animate({
            top: "-=186"
        }, diceSpeed);
    }
</script>

<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
    <div class="container">
        <div class="row">
            <div style="margin-left: auto; margin-right: auto;">
                <table class="pan">
                    <tbody>
                    <tr>
                        <td class="td_tb startLine corner l0"></td>
                        <td class="td_tb l1"></td>
                        <td class="td_tb l2"></td>
                        <td class="td_tb l3"></td>
                        <td class="td_tb rightUp corner l4"></td>
                    </tr>
                    <!-- 세로축 -->
                    <tr class="verti">
                        <td class="td_rl l15"></td>
                        <td class="center" id="gameAlert1" colspan="3" rowspan="3">
                            <div class="wrapper">
                                <div class="tamin">
                                    <div id="dice-side-1" class="dicePic"></div>
                                    <div id="dice-side-2" class="dicePic"></div>
                                    <h2 id="status"></h2>
                                </div>
                                <button id="btnRoll" onclick="dice()" class="learn-more">
                                    LET'S<br>ROLL
                                </button>
                            </div>
                        </td>
                        <td class="td_rl l5"></td>
                    </tr>
                    <tr class="verti">
                        <td class="td_rl l14"></td>

                        <td class="td_rl l6"></td>
                    </tr>
                    <tr class="verti">
                        <td class="td_rl l13"></td>

                        <td class="td_rl l7"></td>
                    </tr>
                    <!-- 세로축 -->
                    <tr style="margin-bottom: 30px">
                        <td class="td_tb leftDown corner l12"></td>
                        <td class="td_tb l11"></td>
                        <td class="td_tb l10"></td>
                        <td class="td_tb l9"></td>
                        <td class="td_tb rightDown corner l8"></td>
                    </tr>
                    </tbody>
                </table>
                <!-- 보드 끝 -->

                <div class="sidebar-option sideKick">
                    <div class="best-of-post">
                        <div style="padding: 10px; margin-top:30px;   overflow: overlay;   width: 390px;    height: 400px;    background-color: lightcyan;">
                            <div style="text-align: center; font-weight: bolder; color: black; padding-top: 10px;">
                                <span>GAME LOG</span></div>
                                <div id="logHome">
                            <c:forEach var="log" items="${ logs }" varStatus="status">
                                <p class="logWrite"><i class="far fa-clock"></i> ${log.time} (주사위눈 : ${log.dicenum})
                                    (${log.result})<br>
                                        ${ log.round }-${ log.logSeq }. ${log.userId}은(는) ${log.object}을(를) ${log.act}했다.
                                </p>
                            </c:forEach>
                            	</div>
                        </div>

                        <div style="padding-top: 10px;">

                            <p class="point bpoint">브라우니 포인트 : ${player.browniePoint}</p>

                            <p class="point mpoint">마블게임 포인트 : ${player.point}</p>

                        </div>


                        <div class="hp" style="margin-top:20px;">
                            <table class="" style="width: 390px; background-color: floralwhite; border-radius: 1.3em;">
                                <tbody>
                                <!-- spring hp 데이타 -->
                                <tr>
                                    <td class="hp"><img
                                            src="${pageContext.request.contextPath}/img/miniGame/use/heart.png"/></td>
                                    <td class="hp"><img
                                            src="${pageContext.request.contextPath}/img/miniGame/use/heart.png"/></td>
                                    <td class="hp"><img
                                            src="${pageContext.request.contextPath}/img/miniGame/use/heart.png"/></td>
                                    <td class="hp"><img
                                            src="${pageContext.request.contextPath}/img/miniGame/use/heart.png"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <!-- 시간나면 -->
                        <div class="itemList">

                        </div>
                        <!-- 시간나면 -->

                    </div>
                </div>
            </div>
        </div>
    </div>


</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp"/>