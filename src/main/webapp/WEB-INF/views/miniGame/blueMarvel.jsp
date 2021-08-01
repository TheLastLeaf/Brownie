<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="../layout/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js"></script>

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
    	margin-top: 0px;
        display: inline-block;
        width: 450px;
        height: 928px;
        top: 695px;
        border-radius: 10px;
    }
    
    .side1{
    	float: left;
	    background-color: seagreen;
    }
    
    .side2{
    	float: left;
    	background-color: cornflowerblue;
    }
	
	.middle{
		background-color: white;
		float:left;
		display: inline-block;
        position: relative;
        border-radius: 10px;
        margin: 0 10px 0 10px;
	}
	
    .pan {
        display: inline-block;
        border-collapse: separate;
        border-spacing: 13px;
        vertical-align: middle;
        text-align: center;
    }

    .pan td {
        border-radius: 15px;
        width: 170px;
        height: 170px;
    }

    .td_tb {
        background: white;
    }

    .td_rl {
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
        margin-bottom: -25px;
    }

	
	 #btnRoll:hover {
	  box-shadow: inset 0 28px 56px rgba(0,0,0,0.25), inset 0 10px 10px rgba(0,0,0,0.22);
	}

    
    td:hover:not(.center) {
	  box-shadow: inset 0 28px 56px rgba(0,0,0,0.25), inset 0 10px 10px rgba(0,0,0,0.22);
	}
    
    td {
    	-moz-box-shadow: 0 0 4px 4px #888;
		-webkit-box-shadow: 0 0 4px 7px#888;
		box-shadow: 0 0 4px 4px #888;
    }

    .l1 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[0].degree}/${infoList[0].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[0]};
    }
    .l2 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[1].degree}/${infoList[1].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[1]};
    }

    .l3 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[2].degree}/${infoList[2].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[2]};
    }

    .l4 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[3].degree}/${infoList[3].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[3]};
    }

    .l5 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[4].degree}/${infoList[4].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[4]};
    }

    .l6 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[5].degree}/${infoList[5].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[5]};
    }

    .l7 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[6].degree}/${infoList[6].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[6]};
    }

    .l8 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[7].degree}/${infoList[7].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[7]};
    }

    .l9 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[8].degree}/${infoList[8].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[8]};
    }

    .l10 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[9].degree}/${infoList[9].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[9]};
    }

    .l11 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[10].degree}/${infoList[10].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[10]};
    }

    .l12 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[11].degree}/${infoList[11].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[11]};
    }

    .l13 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[12].degree}/${infoList[12].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[12]};
    }

    .l14 {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/${infoList[13].degree}/${infoList[13].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[13]};
    }

    .l15 {

        background: url("${pageContext.request.contextPath}/img/miniGame/${infoList[14].degree}/${infoList[14].imgName}");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: ${landColor[14]};
    }
    
    .startLine {
        background-image: url("${pageContext.request.contextPath}/img/miniGame/start/chr-merchant.png");
        background-repeat: no-repeat;
        background-position: center;
        background-size: 128px;
        background-color: snow;
    }
    .playerImg{
    	filter: drop-shadow(0 0 0 white);
    	width:128px;
    }
    
	.flipped {
		    transform:rotate(90deg);
	   -moz-transform: scaleX(-1); 
	     -o-transform: scaleX(-1); 
	-webkit-transform: scaleX(-1); 
	        transform: scaleX(-1);   
	       filter: FlipH;
	  -ms-filter: "FlipH";
	}
    
    #gameInfoImg{
    	text-align: center;
    }
    
    #infoImg{
    	width: 200px;
    }
    
    #gameInfoText{
    	padding: 10px;
    	text-align: left;
    	font-size: 25px;
    	font-weight:bold;
    }
    
    #gameInfoTitle{
    	font-size: 40px;
    	font-weight:bolder;
    	text-align: center;
    }
    
    .innerText{
    	font-size: 30px;
    	font-weight:bolder;
    
    }
    
    .modal{ 
	  position:absolute; 
	  background: rgba(0,0,0,0.2);
	  display:none;
	  height: 225%;
	}
	
	.modal_content{
	  width:500px; height:500px;
	  background:#fff; border-radius:10px;
	  position:relative; top:50%; left:50%;
      margin-top: -270px;
 	  margin-left: -250px;
	  text-align:center;
	  box-sizing:border-box; padding:74px 0;
	  line-height:23px; cursor:pointer;
	}	
	
	#modalImg{
		width: 200px;
	}
	
	#modalTitle{
		font-size: 40px;
    	font-weight:bolder;
    	text-align: center;
	}
	
	#modalCon{
		line-height:1.2em;
		padding: 10px;
    	text-align: center;
    	font-size: 25px;
    	font-weight:bold;
	}
	
	.hp{
		width:90px;
		margin:4px; 	
	}
	
	.item{
		width:90px;
		margin:4px; 	
	}
	
	.diceNum{
		color : black;
    	text-align: center;
    	font-size: 35px;
    	font-weight:bolder; 	
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
	//그라데이션 효과
	var colors = new Array(
	  [62,35,255],
	  [60,255,60],
	  [255,35,98],
	  [45,175,230],
	  [255,0,255],
	  [255,128,0]);
	
	var colors1 = new Array(
			  [62+20,35+20,255],
			  [60+20,255,60+20],
			  [255,35+20,98+20],
			  [45+20,175+20,230],
			  [255,0+20,255],
			  [255,128+20,0+20]);
	
	var step = 0;
	//color table indices for: 
	// current color left
	// next color left
	// current color right
	// next color right
	var colorIndices = [0,1,2,3];
	
	//transition speed
	var gradientSpeed = 0.001;
	
	function updateGradient()
	{
	  
	  if ( $===undefined ) return;
	  
	var c0_0 = colors[colorIndices[0]];
	var c0_1 = colors[colorIndices[1]];
	var c1_0 = colors[colorIndices[2]];
	var c1_1 = colors[colorIndices[3]];
	
	var istep = 1 - step;
	var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
	var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
	var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
	var color1 = "rgb("+r1+","+g1+","+b1+")";
	
	var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
	var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
	var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
	var color2 = "rgb("+r2+","+g2+","+b2+")";
	
	 $('#btnRoll').css({
	   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
	    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});
	 
	 $('#gameAlert1').css({
	   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color2+"))"}).css({
	    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color2+" 100%)"});
	 
	 $('#logBtn').css({
		 background: "-webkit-gradient(linear, left top, right top, from("+color2+"), to("+color2+"))"}).css({
	    background: "-moz-linear-gradient(left, "+color2+" 0%, "+color2+" 100%)"});
	 
	  step += gradientSpeed;
	  if ( step >= 1 )
	  {
	    step %= 1;
	    colorIndices[0] = colorIndices[1];
	    colorIndices[2] = colorIndices[3];
	    
	    //pick two new target color indices
	    //do not pick the same as the current one
	    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
	    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
	    
	  }
	}
	
	function updateGradient2()
	{
	  
	  if ( $===undefined ) return;
	  
	var c0_0 = colors[colorIndices[0]];
	var c0_1 = colors[colorIndices[1]];
	var c1_0 = colors[colorIndices[2]];
	var c1_1 = colors[colorIndices[3]];
	
	var istep = 1 - step;
	var r1 = Math.round(istep * c0_0[0] + step * c0_1[0]);
	var g1 = Math.round(istep * c0_0[1] + step * c0_1[1]);
	var b1 = Math.round(istep * c0_0[2] + step * c0_1[2]);
	var color1 = "rgb("+r1+","+g1+","+b1+")";
	
	var r2 = Math.round(istep * c1_0[0] + step * c1_1[0]);
	var g2 = Math.round(istep * c1_0[1] + step * c1_1[1]);
	var b2 = Math.round(istep * c1_0[2] + step * c1_1[2]);
	var color2 = "rgb("+r2+","+g2+","+b2+")";
	
	 $('.side1').css({
	   background: "-webkit-gradient(linear, left top, right top, from("+color1+"), to("+color1+"))"}).css({
	    background: "-moz-linear-gradient(left, "+color1+" 0%, "+color1+" 100%)"});
	 
	 $('.side2').css({
	   background: "-webkit-gradient(linear, left top, right top, from("+color2+"), to("+color2+"))"}).css({
	    background: "-moz-linear-gradient(left, "+color2+" 0%, "+color2+" 100%)"});
	  
	  step += gradientSpeed;
	  if ( step >= 1 )
	  {
	    step %= 1;
	    colorIndices[0] = colorIndices[1];
	    colorIndices[2] = colorIndices[3];
	    
	    //pick two new target color indices
	    //do not pick the same as the current one
	    colorIndices[1] = ( colorIndices[1] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
	    colorIndices[3] = ( colorIndices[3] + Math.floor( 1 + Math.random() * (colors.length - 1))) % colors.length;
	    
	  }
	}
	
	setInterval(updateGradient,10);
	setInterval(updateGradient2,10);
	//////////////
	//랜드 무지개 효과
		var hue = 1,
		button1 = document.getElementsByClassName('rainbow');
		function color() {
			var alpha = 0,
				  s = 1,
				  v = 1,
				  c, h, x, r1, g1, b1, m,
				  red, blue, green;
			hue %= 360;
			h = hue / 60;
			if (hue < 0) {
			    hue += 360;
			}
			c = v * s;
			h = hue / 60;
			x = c * (1 - Math.abs(h % 2 - 1));
			m = v - c;
			switch (Math.floor(h)) {
				case 0: r1 = c; g1 = x; b1 = 0; break;
				case 1: r1 = x; g1 = c; b1 = 0; break;
				case 2: r1 = 0; g1 = c; b1 = x; break;
				case 3: r1 = 0; g1 = x; b1 = c; break;
				case 4: r1 = x; g1 = 0; b1 = c; break;
				case 5: r1 = c; g1 = 0; b1 = x; break;
			}
			red = Math.floor((r1 + m) * 255);
			green = Math.floor((g1 + m) * 255);
			blue = Math.floor((b1 + m) * 255);
			for (var i = 0; i < button1.length; i++) {
				button1[i].style.backgroundColor = 'rgba(' + red + ',' + green + ',' + blue + ',' + 1 + ')';
			}
		  hue++;
		}
	////////////
	
	 function viewHp(recentHp,hp) {
		 var voidHp = hp-recentHp;
		 temp = "";
		 
		 for (var i = 0; i < recentHp; i++) {
		 	temp += "<img class='hp' src='${pageContext.request.contextPath}/img/miniGame/use/heart.png'/>";
		}
		 
		 for (var i = 0; i < voidHp; i++) {
		 	temp += "<img class='hp' src='${pageContext.request.contextPath}/img/miniGame/use/heart-void.png'/>";
		}
		 
		 console.log(temp);
		 
		 $('.hps').html(temp);
		 
	}
	
	 function viewItem(items) {
		temp="";
		for (var i = 0; i < items.length; i++) {
		 	temp += "<img id='"+items[i].seq+"' class='item landI' src='${pageContext.request.contextPath}/img/miniGame/"+items[i].degree+"/"+items[i].imgName+"'/>";
		}
		$('.itemList').html(temp);
	}
	 
	function changeRainbow() {
		temp="";
		$('.landI').each(function(index, item) {
			if("rgb(112, 128, 144)"==$(this).css("background-color")){
				$(this).addClass('rainbow');
			};
		});

		/* for (var i = 0; i < 15; i++) {
			var color = $.each(".landI").css("background-color");
			console.log(color);
		} */
	}
	
    var playerPos = ${player.position};	//플레이어 위치
    var round = "${player.hp}";		//회차
    var hp = Number(${player.hp});				//HP
    var item = '${player.item}';		//item
    var point = ${player.point};
    var browniePoint = ${player.browniePoint};
    var recentMap = '${player.recentMap}';
    recentMap = recentMap.replace("[", "");
    recentMap = recentMap.replace("]", "");
    recentMap = recentMap.split(", ");
    var quest = '${player.quest}';
    var dicetimes = ${player.dicetimes};
    var recentHp = Number(${player.recentHp});
    
    var voidHp = hp-recentHp;
    
    var view = "<div class='hp'><img id='self' class='playerImg landI' src='${pageContext.request.contextPath}/img/miniGame/chr/rabbit.png' /></div>"
    

    //설정
    var playerImg = "<div class='player'><img id='self' class='playerImg landI' src='${pageContext.request.contextPath}/img/miniGame/chr/rabbit.png' /></div>";
    $('.player').unbind('click');
    //var playerImg = "<div class='player'><i style='color: red;' class='fas fa-chess-knight fa-8x'></i></div>";
    var diceSpeed = 450; // 주사위속도
    var side1 = 0;
    var flagDouble = false;
    var flagoneMore = false;
    var listResult = [];
    
    /* 주사위 */
    window.onload = function () {
    	
    	if(dicetimes==0){
    		alert("주사위 기회가 모두 소진되었습니다.");
    		
    		$('#btnRoll').css('display', 'none');
    		$('#status').text("던질 주사위가 없습니다.");
    	}
    	viewHp(recentHp,hp);
    	playerPos = ${player.position};	//플레이어 위치
    	
    	//무지개 효과
		window.setInterval(color, 10);
    	//
		
        $(".l" + playerPos + "").append(playerImg);
		
        changeRainbow();
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
                })
                
    }

    
    var animateButton = function (e) {
    	if(0 <= playerPos && playerPos <= 3){
        	$(".playerImg").removeClass('flipped');
    		gsap.to('.player', {rotate: 360});
        } else if(4 <= playerPos && playerPos <= 7){
        	gsap.to('.player', {rotate: 0});
        } else if(8 <= playerPos && playerPos <= 11){
        	$(".playerImg").addClass('flipped');
        	gsap.to('.player', {rotate: 360});
        } else if(12 <= playerPos && playerPos <= 15){
        	gsap.to('.player', {rotate: 0});
        }
    	
        e.preventDefault;
        //reset animation
        e.target.classList.remove('animate');

        e.target.classList.add('animate');
        setTimeout(function () {
            e.target.classList.remove('animate');
        }, 700);
    };

    var bubblyButtons = document.getElementsByClassName("learn-more");


    function diceDis() {
        $('#btnRoll').css('visibility', 'hidden')
    }

    function diceApper() {
        $('#btnRoll').css('visibility', 'visible');
        $('#btnRoll').attr("disabled", false);
    }

    function reset() {
        $('.wrapper').css('background-image', "none")
        $('.tamin').css('visibility', 'visible')
    }


    function rndMapCreate() {
    	console.log("맵생성");
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
                for (var i = 0; i < data.info.length; i++) {
                    recentMap.push(data.info[i].seq);
                }

                $('.l1').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[0].degree + "/" + data.info[0].imgName);
                $('.l2').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[1].degree + "/" + data.info[1].imgName);
                $('.l3').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[2].degree + "/" + data.info[2].imgName);
                $('.l4').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[3].degree + "/" + data.info[3].imgName);
                $('.l5').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[4].degree + "/" + data.info[4].imgName);
                $('.l6').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[5].degree + "/" + data.info[5].imgName);
                $('.l7').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[6].degree + "/" + data.info[6].imgName);
                $('.l8').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[7].degree + "/" + data.info[7].imgName);
                $('.l9').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[8].degree + "/" + data.info[8].imgName);
                $('.l10').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[9].degree + "/" + data.info[9].imgName);
                $('.l11').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[10].degree + "/" + data.info[10].imgName);
                $('.l12').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[11].degree + "/" + data.info[11].imgName);
                $('.l13').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[12].degree + "/" + data.info[12].imgName);
                $('.l14').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[13].degree + "/" + data.info[13].imgName);
                $('.l15').css('background-image', "url('${pageContext.request.contextPath}/img/miniGame/" + data.info[14].degree + "/" + data.info[14].imgName);
                
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
                for (var i = 0; i < 15; i++) {
                	name = ".l"+(i+1)+"";
					if(data.landColor[i]=="slategray"){
						$(name).addClass('rainbow');						
					} else {
						$(name).removeClass('rainbow');
					}
				}
                
            },
            error: function () {
                alert("맵생성 실패");
            }
        })
    }
	
    //내기
    function bet(objposition){
        var thorwResult = "back";
        var thorwType = "half";
        if(objposition==15){
        	if(!confirm("내기꾼 : 동전던지기로 내기하지않을래 ?")) {
        	$("#gameInfoText").html("재미없네.");
        	} else {
        		if(confirm("내기꾼 : 전재산을 걸고??  (아니오 = 재산의 절반)")) {
        			$("#gameInfoText").html("전재산 가보자~가보자~");
        			if(confirm("앞면 : 예, 뒷면 : 아니오")){
        				thorwResult = "front";
        				thorwType="all";
        			} else {
        				thorwResult = "back";
        				thorwType="all";
        			}
        		} else {
        			$("#gameInfoText").html("반만걸고 가보자~가보자~");
        			if(confirm("앞면 : 예, 뒷면 : 아니오")){
        				thorwResult = "front";
        				thorwType="half";
        			}
        		}
        	}
        }
        listResult = [thorwResult,thorwType]; 
    }
    
    //랜드효과발동
    function effectAct(side1) {
    	changeRainbow()
        var objposition = "start";
        playerPos = Number(playerPos);
        if (playerPos != 0) {
            objposition = recentMap[playerPos - 1];
        } else {
        	objposition = 0;
        }
        
        temp2 = "[";
        for (var i = 0; i < 15; i++) {
            if (i != 0) {
                temp2 += ", "
            }
            temp2 += recentMap[i]
            if (i == 14) {
                temp2 += "]"
            }
        }
        
        
        $.ajax({
            url: "./ajax.effectact",
            type: "post",
            data: {
                "UserPosition": playerPos,
                "ObjPosition": objposition,
                "diceNum" : side1,
                "round": round,
                "hp": hp,
                "item": item,
                "point": point,
                "recentMap": temp2,
                "quest": quest,
                "dicetimes": dicetimes,
                "recentHp": recentHp,
                "throw": listResult[0],
                "throwType": listResult[1]            },
            success: function (data) {
                   console.log("data 삽입성공!");
                   $(".diceNum").html("남은횟수 : "+dicetimes);
                   if(data.dead==1){
 	                    $("#modalImgD").html("<img id='modalImg' src='${pageContext.request.contextPath}/img/miniGame/use/skull.png' />"); 
	               	   	$("#modalTitle").html("즉 사");
	   	           		$("#modalCon").html("당신은 끔찍하게 즉사했습니다.<br> 브라우니마블을 다시 시작합니다.");
                	    $(".modal").fadeIn();
		   	           	setTimeout(function(){
		   	           		location.reload();
		   	           	},5000);
		   	         	return ;
                   }
                   
                   $("#gameInfoImg").html("<img id='infoImg' src='${pageContext.request.contextPath}/img/miniGame/" + data.obj.degree + "/" + data.obj.imgName+"'/>");
                   
                   $("#gameInfoTitle").html(data.obj.name);
                   
                   $("#gameInfoText").html(data.obj.detailedExpl);
                   
                   $(".bpoint").html("브라우니 포인트 : "+data.site.browniePoint);
                   $(".mpoint").html("마블게임 포인트 : "+data.player.point);
                   
                   $("#logHome").html(data.log);
                   
				   hp=data.player.hp;
                   recentHp=data.player.recentHp;
                   item=data.player.item; 
                   viewItem(data.items);
                   
                   viewHp(recentHp,hp);
                   
                   if(playerPos<0){
                	   playerPos = 0;
                   }
                   
                   var inst = 1;
                   
                   var dT = 0; 
                   if(side1<2){
                	   dT = 0;
                   } else {
                	   dT = 300;
                   }
                   if (objposition==30) {
                	   inst = 2;
                	   setTimeout(function(){
                		   $(".modal").fadeIn();
		   	           	},side1*dT);
		           		selectmarbelInfo(data.boxIn, inst);
                   } else {
                	   setTimeout(function(){
                		   $(".modal").fadeIn();
		   	           	},side1*dT);
		           		selectmarbelInfo(playerPos, inst);
                   }
                   
                   if (data.doubleD) {
                	   flagDouble = true;
                   }
                   if (data.oneMore) {
                	   flagoneMore = true;
                   }
            },
            error: function () {
                alert("효과 실패!");
            }
        })
    }
    
    function deleteLog() {
    	if(!confirm("로그를 삭제하시겠습니까?")){
    		return;
    	}
        $.ajax({
            url: "./ajax.deletelog",
            type: "post",
            data: {
            },
            success: function (data) {
            	if(data!=0){
            		alert("로그 삭제 성공!");
            		$("#logHome").html("");
            		$("#logHome").html();
            	}
            },
            error: function () {
                alert("로그 삭제 실패!");
            }
        })
    }
    
    function selectmarbelInfo(landNum, typeInt) {
    	var type = Number(typeInt);
    	var number = 0;
    	if (Number(landNum)==0){
    		number = 0;
    	} else if (type==1||type==0) {
	    	number = recentMap[Number(landNum)-1];
    	} else if (type==2) {
    		number = Number(landNum);
    	} else if (landNum==="self") {
    		return;
    	}
    	
    	
        $.ajax({
            url: "./ajax.selectmarbelinfo",
            type: "post",
            data: {
            	"landNum": number,
            	"type": type
            },
            success: function (data) {
            	if (type==0) {
	           		$("#modalTitle").html(data.name);
	           		$("#modalCon").html(data.briefExpl);
	           		$("#modalImgD").html("<img id='modalImg' src='${pageContext.request.contextPath}/img/miniGame/" + data.degree + "/" + data.imgName+"'/>");
            	} else if(type==1) {
	           		$("#modalTitle").html(data.name);
	           		$("#modalCon").html(data.detailedExpl);
	           		$("#modalImgD").html("<img id='modalImg' src='${pageContext.request.contextPath}/img/miniGame/" + data.degree + "/" + data.imgName+"'/>");
            	} else {
            		$("#modalTitle").html("상자속에 있던것은...<br><br><br>"+data.name);
	           		$("#modalCon").html(data.detailedExpl);
	           		$("#modalImgD").html("<img id='modalImg' src='${pageContext.request.contextPath}/img/miniGame/" + data.degree + "/" + data.imgName+"'/>");
            	}
            },
            error: function () {
                alert("랜드정보 불러오기 실패ㅡ!");
            }
        })
    }
	var delayTime = 1500;
    //디폴트주사위
    function dice() {
    	if (flagDouble) {
    		doubleDice();
    		flagDouble = false;
    		return;
    	} 
    	
    	if (flagoneMore) {
    		oneMoreDice();
    		flagoneMore = false;
    		return;
    	} 
    	
    	if(dicetimes!=0){
    		dicetimes = dicetimes - 1;
   		}
    	
    	if(dicetimes==0){
    		$('#btnRoll').css('display', 'none');
    	} 
    	
    	$('#dice-side-2').css('display', 'none');
    	$('#btnRoll').attr("disabled", true);
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
		if(side1 > 3){
			delayTime = 2000;
		}
        
        setTimeout('move(' + side1 + ')', delayTime);
    }
    
    function oneMoreDice() {
    	
    	$('#dice-side-2').css('display', 'none');
    	$('#btnRoll').attr("disabled", true);
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
        if(side1 > 3){
			delayTime = side1*450;
		}
        setTimeout('move(' + side1 + ')', delayTime);
    }

    //한번더! 주사위 더블이벤트
    function doubleDice() {
    	$('#btnRoll').attr("disabled", true);
        $('#dice-side-2').css('display', 'inline-block');
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
        
		side1 = diceTotal;
		
        if(side1 > 5){
			delayTime = side1*450;
		}
        setTimeout('move(' + side1 + ')', delayTime);
    }


    //이동
    function move(diceTotal) {
        for (var i = 0; i < diceTotal; i++) {
            if (0 <= playerPos && playerPos <= 3) {
            	gsap.to('.player', {rotate: 360});
                leftMove();
                ++playerPos;
            } else if (4 <= playerPos && playerPos <= 7) {
                downMove();
                ++playerPos;
            } else if (8 <= playerPos && playerPos <= 11) {
            	$(".playerImg").addClass('flipped');
            	gsap.to('.player', {rotate: 0});
                rightMove();
                ++playerPos;
            } else if (12 <= playerPos && playerPos <= 15) {
            	upMove();
                ++playerPos;
            }
            if (playerPos == 16) {
            	$(".playerImg").removeClass('flipped');
            	gsap.to('.player', {rotate: 360});
                playerPos = 0;
                rndMapCreate();
            }
        }
		var objposition = "start";
        var tempList = [];
        
        if (playerPos != 0) {
            objposition = recentMap[playerPos - 1];
        } else {
        	objposition = 0;
        }
        
        if (objposition==15){
        	setTimeout('bet('+objposition+')', 1500);
        	setTimeout('effectAct('+side1+')', 1700);
        } else {
        	effectAct(side1);
        }
        
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
    
$(function(){ 

	$(".landI").click(function(){
		$(".modal").fadeIn();
		var landNum = $(this).attr('id');
		if (Number(landNum)>=40){
			selectmarbelInfo(landNum,2);
			
		} else {
			selectmarbelInfo(landNum,0);
			
		}
	});
	
	$(".modal_content").click(function(){
		$(".modal").fadeOut();
	});
	
	$(".modal").click(function(){
		$(".modal").fadeOut();
	});
});
</script>

<!-- 모달 -->
<div class="modal">
	<div class="modal_content">
		
		<p><div id="modalImgD"></div></p>
	
		<p><div id="modalTitle"></div></p>
		
		<p><div id="modalCon"></div></p>
		
	</div>
</div>

<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
    <div class="container">
        <div class="row" style="width: 1900px; margin-left: -380px;">
            <div style="margin-left: auto; margin-right: auto;">
            
            	<div class="sidebar-option sideKick side1">
                    <div class="best-of-post">
                        <div style="padding: 10px; margin-top:30px;  width: 390px;    height: 500px;    background-color: lightcyan;">
                            <div style="text-align: center; font-weight: bolder; color: black; padding-top: 10px;">
                                <div style="text-align: center; font-weight: bolder; color: black; padding-top: 10px;">
                                	<span class="innerText">GAME INFO</span>
                                </div>
                            </div>
                                
                            <p><div id="gameInfoImg">
                            	
                        	</div></p>
                        	
                            <p><div id="gameInfoTitle">
                            	
                        	</div></p>
                        	
                            <div id="gameInfoText">
                            	
                        	</div>
                        	
                        </div>
				
						<br/>
						
                        <div style="padding-top: 10px;">

                            <p class="point bpoint">브라우니 포인트 : ${player.browniePoint}</p>

                            <p class="point mpoint">마블게임 포인트 : ${player.point}</p>

                        </div>
                        
                        <br/>
                        
                        <div class="hps" style="margin-top:20px;">
                        </div>
						
						<br/>
						
                        <div class="diceNums" style="margin-top:20px;">
                        	<p class="diceNum">남은횟수 : ${player.dicetimes}</p>
                        </div>
						
                    </div>
                </div>
            
            
            	<div class="middle">
                <table class="pan">
                    <tbody>
                    <tr>
                        <td id="0" class="landI td_tb startLine corner l0 start"></td>
                        <td id="1" class="landI td_tb l1"></td>
                        <td id="2" class="landI td_tb l2"></td>
                        <td id="3" class="landI td_tb l3"></td>
                        <td id="4" class="landI td_tb rightUp corner l4"></td>
                    </tr>
                    <!-- 세로축 -->
                    <tr class="verti">
                        <td id="15" class="landI td_rl l15"></td>
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
                        <td id="5" class="landI td_rl l5"></td>
                    </tr>
                    <tr class="verti">
                        <td id="14" class="landI td_rl l14"></td>

                        <td id="6" class="landI td_rl l6"></td>
                    </tr>
                    <tr class="verti">
                        <td id="13" class="landI td_rl l13"></td>

                        <td id="7" class="landI td_rl l7"></td>
                    </tr>
                    <!-- 세로축 -->
                    <tr style="margin-bottom: 30px">
                        <td id="12" class="landI td_tb leftDown corner l12"></td>
                        <td id="11" class="landI td_tb l11"></td>
                        <td id="10" class="landI td_tb l10"></td>
                        <td id="9" class="landI td_tb l9"></td>
                        <td id="8" class="landI td_tb rightDown corner l8"></td>
                    </tr>
                    </tbody>
                </table>
                </div>
                <!-- 보드 끝 -->

                <div class="sidebar-option sideKick side2">
                    <div class="best-of-post">
                        <div style="padding: 10px; margin-top:30px;   overflow: overlay;   width: 390px;    height: 500px;    background-color: lightcyan;">
                            <div style="text-align: center; font-weight: bolder; color: black; padding-top: 10px;">
                                <span class="innerText">GAME LOG</span></div>
                                <div id="logHome">
                            <c:forEach var="log" items="${logs}" varStatus="status">
                                <p class="logWrite"><i class="far fa-clock"></i> ${log.time} (주사위눈 : ${log.dicenum})
                                    (${log.result})<br>
                                        ${log.logSeq}. ${log.userId}은(는) ${log.object}을(를) ${log.act}했다.
                                </p>
                            </c:forEach>
                            	</div>
                            	
                        </div>
                        <br>
                        <button id="logBtn" style="width:55px;" onclick="deleteLog()" >로그청소</button>
                        <br><br><br>
						<!-- 시간나면 -->
						<div class="itemList" style="margin-top:20px;">
							<c:forEach var="item" items="${playerItem}" varStatus="status">
							<img id='${item.seq}' class='item landI' src='${pageContext.request.contextPath}/img/miniGame/${item.degree}/${item.imgName}'/>
							</c:forEach>
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