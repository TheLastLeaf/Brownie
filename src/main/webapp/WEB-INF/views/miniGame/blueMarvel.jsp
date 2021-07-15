<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="../layout/header.jsp"/>

<script src="${pageContext.request.contextPath}/js/marvel.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/marvel.css" type="text/css">

<style>
.pan {
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

#dice-side-2{
	display: none;
}

.dicePic{
	display: inline-block;
}

#status{
	font-weight: 900;
	font-size : 45px;
	font-family: "strato-roman";
}

.wrapper{
	border-radius: 14px;
	display: block;
	height: 100%;
	width: 100%;
	background-image: none;
	background-repeat:no-repeat;
	background-position:center center;
	background-size: 100% 100%;
}

.tamin{
	height:200px;
	position: relative;
	top:160px;
}

.startLine{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/use/start.png");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
	
.l1{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[0].kind}/${infoList[0].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l2{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[1].kind}/${infoList[1].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l3{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[2].kind}/${infoList[2].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l4{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[3].kind}/${infoList[3].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l5{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[4].kind}/${infoList[4].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l6{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[5].kind}/${infoList[5].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l7{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[6].kind}/${infoList[6].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l8{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[7].kind}/${infoList[7].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l9{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[8].kind}/${infoList[8].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l10{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[9].kind}/${infoList[9].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l11{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[10].kind}/${infoList[10].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l12{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[11].kind}/${infoList[11].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l13{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[12].kind}/${infoList[12].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l14{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[13].kind}/${infoList[13].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
}
.l15{
	background-image:url("${pageContext.request.contextPath}/img/miniGame/${infoList[14].kind}/${infoList[14].imgName}");
	background-repeat : no-repeat;
	background-position: center;
	background-size: 128px;
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
	var playerPos   = ${player.position};
	var round   	= ${player.round};
    var hp  		= ${player.hp};
    var item 		= '${player.item}';
    var point   	= ${player.point};
    var recentMap 	= '${player.recentMap}';
    recentMap = recentMap.replace("[", "");
	recentMap = recentMap.replace("]", "");
	recentMap = recentMap.split(", ");
	console.log("first"+recentMap);
    var quest   	= '${player.quest}';
    var dicetimes	= ${player.dicetimes};
    var recentHp	= ${player.recentHp};
	
	//설정
	var playerImg = "<div class='player'><i style='color: red;' class='fas fa-chess-knight fa-8x'></i></div>";
	var diceSpeed = 450; // 주사위속도
	
	
	/* 주사위 */
	window.onload = function() {
		$(".l"+playerPos+"").append(playerImg);
		
		for (var i = 0; i < bubblyButtons.length; i++) {
			bubblyButtons[i].addEventListener('click', animateButton, false);
		}
		//클릭중
		$('#btnRoll')
				.mousedown(
						function() {
							$('.wrapper')
									.css('background-image',
											"url('${pageContext.request.contextPath}/img/miniGame/rolling.gif')")
							$('.tamin').css('visibility', 'hidden')
						});
		$('#btnRoll')
				.mouseup(//클릭끝
						function() {
							$('.wrapper')
									.css('background-image',
											"url('${pageContext.request.contextPath}/img/miniGame/diceDrop.gif')")
							setTimeout("reset()", 2000);
							setTimeout("diceDis()", 250);
							
						});
	}
	
	
	var animateButton = function(e) {
		e.preventDefault;
		//reset animation
		e.target.classList.remove('animate');

		e.target.classList.add('animate');
		setTimeout(function() {
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
			if(i!=0){
				temp += ", "
			}
			temp += recentMap[i]
			if(i==14){
				temp += "]"
			}
		}
		console.log("temp"+temp);
		$.ajax({
			url : "./ajax.autorenew",
			type : "post",
			data : {
					"position" : playerPos,
					"round" : round,   	
					"hp" : hp,  		
					"item" : item, 		
					"point" : point,   	
					"recentMap" : temp, 	
					"quest" : quest,   	
					"dicetimes" : dicetimes,	
					"recentHp" : recentHp	
			},
			success : function(data) {
				if(data==1){
					console.log("갱신저장 성공!");
				}
			},
			error : function() {
				console.log("갱신저장 실패!");
			}
		})
	}
	
	function rndMapCreate() {
		$.ajax({
			url : "./ajax.rndmapcreate",
			type : "post",
			async: false,
			data : {
					"position" : playerPos,
					"round" : round,   	
					"hp" : hp,  		
					"item" : item, 		
					"point" : point,   	
					"quest" : quest,   	
					"dicetimes" : dicetimes,	
					"recentHp" : recentHp	
			},
			success : function(data) {
				 //$(".pan").load(window.location.href + ".pan");
				 //location.href='${pageContext.request.contextPath}/gallery/detail?boardSeq=${galleryVO.boardSeq}';
				 
				 recentMap = [];
				 for (var i = 0; i < data.length; i++) {
					 recentMap.push(data[i].seq);
				 }
				 
				 /*recentMap = "[";
				 for (var i = 0; i < data.length; i++) {
					if(i!=0){
						recentMap += ", "
					}
					recentMap += data[i].seq
					if(i==14){
						recentMap += "]"
					}
				}*/
				
				 $('.l1').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[0].kind+"/"+data[0].imgName);
				 $('.l2').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[1].kind+"/"+data[1].imgName);
				 $('.l3').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[2].kind+"/"+data[2].imgName);
				 $('.l4').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[3].kind+"/"+data[3].imgName);
				 $('.l5').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[4].kind+"/"+data[4].imgName);
				 $('.l6').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[5].kind+"/"+data[5].imgName);
				 $('.l7').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[6].kind+"/"+data[6].imgName);
				 $('.l8').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[7].kind+"/"+data[7].imgName);
				 $('.l9').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[8].kind+"/"+data[8].imgName);
				 $('.l10').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[9].kind+"/"+data[9].imgName);
				 $('.l11').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[10].kind+"/"+data[10].imgName);
				 $('.l12').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[11].kind+"/"+data[11].imgName);
				 $('.l13').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[12].kind+"/"+data[12].imgName);
				 $('.l14').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[13].kind+"/"+data[13].imgName);
				 $('.l15').css('background-image',"url('${pageContext.request.contextPath}/img/miniGame/"+data[14].kind+"/"+data[14].imgName);
			},
			error : function() {
				alert("글이 등록되지 않았습니다.");
			}
		})
	}
	
	//랜드효과발동
	function effectAct() {
		var objposition = "start";
		if (playerPos!=0) {
			objposition = recentMap[playerPos-1];
			console.log(recentMap[playerPos-1]);
			console.log(objposition);
		}
		$.ajax({
			url : "./ajax.effectact",
			type : "post",
			data : {
					"UserPosition" : playerPos,
					"ObjPosition" : objposition
			},
			success : function(data) {
				autoRenew();
			},
			error : function() {
				alert("글이 등록되지 않았습니다.");
			}
		})
	}
	
	//디폴트주사위
	function dice() {
		const buttonRoolDice = document.querySelector('.learn-more');

		const diceSide1 = document.getElementById('dice-side-1');
		const status1 = document.getElementById('status');

		const side1 = Math.floor(Math.random() * 6) + 1;

		var num = side1 ;


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

		setTimeout('move(' + 9+ ')', 1900);
	}
	
	//한번더! 주사위 더블이벤트
	function doubleDice() {
		const buttonRoolDice = document.querySelector('.learn-more');

		const diceSide1 = document.getElementById('dice-side-1');
		const diceSide2 = document.getElementById('dice-side-2');
		const status1 = document.getElementById('status');

		const side1 = Math.floor(Math.random() * 6) + 1;
		const side2 = Math.floor(Math.random() * 6) + 1;

		var num = [ side1, side2 ];

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

		setTimeout('move(' + diceTotal + ')', 2000);
	}
	
	//상인
	function merchant(){
		
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
			if (playerPos==16) {
				playerPos = 0;
				rndMapCreate();
			}
		}
		effectAct();
		
		setTimeout('diceApper()', 1500);
	}
	
	//시각적 이동
	function leftMove() {
		$(".player").animate({
			left : "+=186"
		}, diceSpeed);
	}

	function rightMove() {
		$(".player").animate({
			left : "-=186"
		}, diceSpeed);
	}

	function downMove() {
		$(".player").animate({
			top : "+=186"
		}, diceSpeed);
	}

	function upMove() {
		$(".player").animate({
			top : "-=186"
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
						<td class="td_tb startLine corner l0">
						</td>

						<td class="td_tb l1">
						</td>

						<td class="td_tb l2">
						</td>

						<td class="td_tb l3">
						</td>


						<td class="td_tb rightUp corner l4">
						</td>
					</tr>
					<!-- 세로축 -->
					<tr class="verti">
						<td class="td_rl l15">
						</td>
						
						<td class="center" id="gameAlert1" colspan="3" rowspan="3">
						
								<div class="wrapper">
									<div class="tamin">
										<div id="dice-side-1" class="dicePic"></div>
										<div id="dice-side-2" class="dicePic"></div>
										<h2 id="status"></h2>
									</div>
									<button id="btnRoll" onclick="dice()" class="learn-more">LET'S<br>ROLL</button>
								</div> 
								
						</td>
						
						<td class="td_rl l5">
						</td>
					</tr>


					<tr class="verti">
						<td class="td_rl l14">
						</td>

						<td class="td_rl l6">
						</td>
					</tr>

					<tr class="verti">
						<td class="td_rl l13">
						</td>

						<td class="td_rl l7">
						</td>
					</tr>
					<!-- 세로축 -->
					<tr style="margin-bottom: 30px">
						<td class="td_tb leftDown corner l12">                           
						</td>                                                        
						<td class="td_tb l11">                                           
						</td>                                                        
						<td class="td_tb l10">                                           
						</td>                                                        
						<td class="td_tb l9">                                           
						</td>                                                        
						<td class="td_tb rightDown corner l8">                          
						</td>                                                        
					</tr>                                                            
				</tbody>
			</table>
			<!-- 보드 끝 -->

		</div>
		<!-- 갤러리끝 -->
			</div>
	</div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp"/>