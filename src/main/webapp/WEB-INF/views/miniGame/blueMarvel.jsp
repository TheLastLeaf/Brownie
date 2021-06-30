<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="../layout/header.jsp">
	<c:param name="path" value="${path}" />
</c:import>

<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="${path}/js/marvel.js"></script>

<link rel="stylesheet" href="${path}/css/marvel.css" type="text/css">

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

@keyframes player {
  0%   {left:0px; top:0px;}
  100%  {left:200px; top:0px;}
}

.player {
	z-index: inherit;
	position: relative;
	animation-name: player;
	animation-duration: 5s;
	animation-iteration-count: infinite;
	animation-timing-function: linear;
	animation-direction: alternate;
}

.land {
	width: 128px;
	height: 128px;
}

/*주사위*/

.dicePic{
	display: inline-block;
}

#status{
	font-weight: 900;
	font-size : 45px;
	font-family: "strato-roman";
}

.wrapper{
	display: block;
	height: 250px;
}

</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg spad"
	data-setbg="${path}/img/miniGame/banner3.jpg">
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
 	/* 주사위 */

	function dis() {
		const buttonRoolDice = document.querySelector('.learn-more');

		const diceSide1 = document.getElementById('dice-side-1');
		const diceSide2 = document.getElementById('dice-side-2');
		const status1 = document.getElementById('status');

		const side1 = Math.floor(Math.random() * 6) + 1;
		const side2 = Math.floor(Math.random() * 6) + 1;
		
		var num = [side1, side2];
		
		const diceTotal = side1 + side2;
		
		for (var i = 0; i < num.length; i++) {
			if (num[i]==1){
				num[i] = "<i class='fas fa-dice-one fa-9x'></i>";
			}
			if (num[i]==2){
				num[i] = "<i class='fas fa-dice-two fa-9x'></i>";
			}
			if (num[i]==3){
				num[i] = "<i class='fas fa-dice-three fa-9x'></i>";
			}
			if (num[i]==4){
				num[i] = "<i class='fas fa-dice-four fa-9x'></i>";
			}
			if (num[i]==5){
				num[i] = "<i class='fas fa-dice-five fa-9x'></i>";
			}
			if (num[i]==6){
				num[i] = "<i class='fas fa-dice-six fa-9x'></i>";
			}
		}
		
		diceSide1.innerHTML = num[0];
		diceSide2.innerHTML = num[1];

		status1.innerHTML =  diceTotal+'<br>';

		if (side1 === side2) {
			status1.innerHTML += '더블! 한접시 더!<br>';
		}
		
		buttonRoolDice.addEventListener('click', rollDice, false);

		if ($('#dis').css('visibility') == 'hidden') {
			$('#dis').css('visibility', 'visible')
		} else {
			$('#dis').css('visibility', 'hidden')
		}
	}
</script>

<!-- Categories Grid Section Begin -->
<section class="categories-grid-section spad">
	<div class="container">
		<div style="padding-left: 30px; padding-right: 30px; padding-top: 30px;">
			<table class="pan">
				<tbody>
					<tr>
						<td class="td_tb startLine corner">
							<div class="player">
								<i style="color: red;" class="fas fa-chess-knight fa-8x"></i>
							</div>
						</td>

						<td class="td_tb">
							<i class="fas fa-bomb fa-8x"></i>
						</td>


						<td class="td_tb">
							<i class="fas fa-box fa-8x"></i>
						</td>

						<td class="td_tb">
							<i class="fas fa-coins fa-8x"></i>
						</td>


						<td class="td_tb rightUp corner"></td>
					</tr>
					<!-- 세로축 -->
					<tr class="verti">
						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/lucky_shamrock.png">
						</td>
						
						<td class="center" id="gameAlert1" colspan="3" rowspan="3">
						
							<div class="wrapper">
								<div id="dice-side-1" class="dicePic"></div>
								<div id="dice-side-2" class="dicePic"></div>
								<h2 id="status"></h2>
							</div> 
							
							<%-- <img id="dis" style="width: 100%; visibility: hidden;" src="${path}/img/miniGame/rollDice.gif"> --%>
							
							<button onclick="dis()" class="learn-more">LET'S<br> ROLL</button>
						</td>
						
						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/lucky_drive.png">
						</td>
					</tr>


					<tr class="verti">
						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/token_yinyang.png">
						</td>

						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/wallet.png">
						</td>
					</tr>

					<tr class="verti">
						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/the_one_ring.png">
						</td>

						<td class="td_rl">
							<img class="land" src="${path}/img/miniGame/coins.png">
						</td>
					</tr>
					<!-- 세로축 -->
					<tr style="margin-bottom: 30px">
						<td class="td_tb leftDown corner">
							<img class="land" src="${path}/img/miniGame/black_cat (2).png">
						</td>
						<td class="td_tb">
							<img class="land" src="${path}/img/miniGame/black_cat (1).png">
						</td>
						<td class="td_tb">
							<i class="fas fa-book fa-8x"></i>
						</td>
						<td class="td_tb">
							<img class="land" src="${path}/img/miniGame/black_cat.png">
						</td>
						<td class="td_tb rightDown corner">
							<img class="land" src="${path}/img/miniGame/asd.png">
						</td>
					</tr>
				</tbody>
			</table>
			<!-- 보드 끝 -->

		</div>
		<!-- 갤러리끝 -->
	</div>
</section>
<!-- Categories Grid Section End -->
<c:import url="../layout/footer.jsp">
	<c:param name="path" value="${path}" />
</c:import>