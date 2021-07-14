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
	background-image:url("${pageContext.request.contextPath}/img/miniGame/etc/starting-point.jpeg");
	background-repeat : no-repeat;
	background-position: center;
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
	var playerPos = 0 //${marble.position};
	var pos = [];
	
	//설정
	var diceSpeed = 450; // 주사위속도
	
	var animateButton = function(e) {
		console.log(1);
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

	/* 주사위 */
	window.onload = function() {
		
		for (var i = 0; i < bubblyButtons.length; i++) {
			console.log(3);
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

		setTimeout('move(' + 13 + ')', 1900);
	}
	
	//주사위 더블
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
		oneInOne = true;

	}
	
	function merchant(){
		alert("안녕?");
	}
	
	//이동
	function move(diceTotal) {
		for (var i = 0; i < diceTotal; i++) {
			if (playerPos == 16) {
				playerPos = 0;
				merchant();
			} else if (0 <= playerPos && playerPos <= 3) {
				leftMove();
				playerPos++;
			} else if (4 <= playerPos && playerPos <= 7) {
				downMove();
				playerPos++;
			} else if (8 <= playerPos && playerPos <= 11) {
				rightMove();
				playerPos++;
			} else if (12 <= playerPos && playerPos <= 15) {
				upMove();
				playerPos++;
			}
		}
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
						<td class="td_tb startLine corner" background="">
							<div class="player">
								<i style="color: red;" class="fas fa-chess-knight fa-8x"></i>
							</div>
						</td>

						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[0].kind}/${infoList[0].imgName}">
						</td>


						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[1].kind}/${infoList[1].imgName}">
						</td>

						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/coin.png">
						</td>


						<td class="td_tb rightUp corner">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[3].kind}/${infoList[3].imgName}">
						</td>
					</tr>
					<!-- 세로축 -->
					<tr class="verti">
						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[4].kind}/${infoList[4].imgName}">
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
						
						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[5].kind}/${infoList[5].imgName}">
						</td>
					</tr>


					<tr class="verti">
						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[6].kind}/${infoList[6].imgName}">
						</td>

						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[7].kind}/${infoList[7].imgName}">
						</td>
					</tr>

					<tr class="verti">
						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[8].kind}/${infoList[8].imgName}">
						</td>

						<td class="td_rl">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[9].kind}/${infoList[9].imgName}">
						</td>
					</tr>
					<!-- 세로축 -->
					<tr style="margin-bottom: 30px">
						<td class="td_tb leftDown corner">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[10].kind}/${infoList[10].imgName}">
						</td>
						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[11].kind}/${infoList[11].imgName}">
						</td>
						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[12].kind}/${infoList[12].imgName}">
						</td>
						<td class="td_tb">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[13].kind}/${infoList[13].imgName}">
						</td>
						<td class="td_tb rightDown corner">
							<img src="${pageContext.request.contextPath}/img/miniGame/${infoList[14].kind}/${infoList[14].imgName}">
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