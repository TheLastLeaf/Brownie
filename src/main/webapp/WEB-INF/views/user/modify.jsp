<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>MODIFY</title>

    <!-- favicon -->
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.css"
          integrity="sha512-WEQNv9d3+sqyHjrqUZobDhFARZDko2wpWdfcpv44lsypsSuMO0kHGd3MQ8rrsBn/Qa39VojphdU6CMkpJUmDVw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/SlickNav/1.0.10/slicknav.min.css"
          integrity="sha512-heyoieAHmpAL3BdaQMsbIOhVvGb4+pl4aGCZqWzX/f1BChRArrBy/XUZDHW9WVi5p6pf92pX4yjkfmdaIYa2QQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
<style>
    body {
        background: black;
    }

    .signup-section {
        overflow: hidden;
    }

    .profileBox {
        display: inline-block;
        width: 160px;
        height: 160px;
        border: 1px solid white;
        border-radius: 5px;
        color: white;
        margin: 0 0 10px 0;
        position: relative;
        background: #1C1C1C;
    }

    .profile {
        object-fit: cover;
        width: 158px;
        height: 158px;
        border-radius: 15px;
    }

    .profileBox input[type="file"] { /* ?????? ?????? ????????? */
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip: rect(0, 0, 0, 0);
        border: 0;
    }

    input[name="position"] {
        width: 20px;
        height: 20px;
    }

    .advice {
        color: #CEF6F5;
    }

    .chooseLane {
        color: white;
    }

    .input-value {
        width: 80%;
        text-align: center;
    }

    /* ??????????????? ????????? */
    .btn-danger {
        background: yellow;
        border-color: white;
    }

    /* ????????? ???????????? ?????? */
    .btn-danger:not(:disabled):not(.disabled).active {
        background-color: #FF0040;
        border-color: #FF0040;
        color: purple;
    }

    /* ????????? ?????? ?????? (?????? .btn-danger??? background ??????????????? ??????)*/
    .btn-danger.focus, .btn-danger:focus {
        background: #D7DF01;
    }

    /* ????????? ?????????????????? ?????? */
    .btn-danger:hover {
        background-color: coral;
        border-color: red;
        text-decoration: none;
    }

    .signup-text {
        padding-top: 40px;
    }

    .check_success {
        border-color: #28a745 !important;
        padding-right: calc(1.5em + .75rem) !important;
        background-image: url('https://upload.wikimedia.org/wikipedia/commons/5/59/Feedbin-Icon-check.svg') !important;
        background-repeat: no-repeat !important;
        background-position: center right calc(.375em + .1875rem) !important;
        background-size: calc(.75em + .375rem) calc(.75em + .375rem) !important;
    }

    .check_fail {
        border-color: #28a745 !important;
        padding-right: calc(1.5em + .75rem) !important;
        background-image: url('https://upload.wikimedia.org/wikipedia/commons/5/5f/Red_X.svg') !important;
        background-repeat: no-repeat !important;
        background-position: center right calc(.375em + .1875rem) !important;
        background-size: calc(.75em + .375rem) calc(.75em + .375rem) !important;
    }

    #submitButton:disabled {
        background-color: rgb(191, 64, 64);
    }
</style>

<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="signup-section" style="display: block;">
    <!-- 		<div class="signup-close"> -->
    <!-- 			<i class=fas fa-times" onclick="fn_close()"></i> -->
    <!-- 		</div> -->
    <div class="signup-text">
        <div class="container">
            <div class="signup-title" style="margin-bottom: 20px;">
                <h2 class="font-family-maple-bold text-white">????????????</h2>
                <p class="advice">????????? ????????? ???????????? ???????????????!</p>
            </div>
            <!-- form?????? begin -->
            <form action="${pageContext.request.contextPath}/user/info" name="frm" class="signup-form" id="form"
                  method="POST"
                  enctype="multipart/form-data">
                <div class="sf-input-list ">
                    <div class="profileBox" style="border: none;">
                        <label for="file">
                            <img class="profile" id="img"
                                 src="${pageContext.request.contextPath}${userOneSelect.image}">
                            <input type="file" id="file" name="file"/>
                        </label>
                    </div>
                    <!-- ????????? ?????? -->
                    <div>
                        <input type="text" id="user_nick" class="input-value check_success" name="nickNameBox"
                               placeholder="????????? ?????? ??? 31??? ?????? ?????????????????????*" value="${userOneSelect.nickName}">
                        <input type="hidden" name="nickNameHidden" value="${userOneSelect.nickName}">
                        <!-- 							<div id="regCheckMsg"></div> -->
                    </div>
                    <!-- ????????? ?????? -->
                    <div style="margin-bottom: 3px; margin-top: 3px;" class="btn-group btn-group-toggle"
                         data-toggle="buttons">
                        <label class="btn btn-danger position">
                            <input type="checkbox" name="positions" value="top"
                            <c:if test='${fn:containsIgnoreCase(userOneSelect.userPosition, "top")}'>
                                   checked
                            </c:if>>
                            <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Top.png"
                                 alt=""/>
                        </label>
                        &nbsp;
                        <label class="btn btn-danger position">
                            <input type="checkbox" name="positions" value="jun"
                            <c:if test='${fn:containsIgnoreCase(userOneSelect.userPosition, "jun")}'>
                                   checked
                            </c:if>>
                            <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Jungle.png"
                                 alt=""/>
                        </label>
                        &nbsp;
                        <label class="btn btn-danger position">
                            <input type="checkbox" name="positions" value="mid"
                            <c:if test='${fn:containsIgnoreCase(userOneSelect.userPosition, "mid")}'>
                                   checked
                            </c:if>>
                            <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Mid.png"
                                 alt=""/>
                        </label>
                        &nbsp;
                        <label class="btn btn-danger position">
                            <input type="checkbox" name="positions" value="bot"
                            <c:if test='${fn:containsIgnoreCase(userOneSelect.userPosition, "bot")}'>
                                   checked
                            </c:if>>
                            <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Bot.png"
                                 alt=""/>
                        </label>
                        &nbsp;
                        <label class="btn btn-danger position">
                            <input type="checkbox" name="positions" value="sup"
                            <c:if test='${fn:containsIgnoreCase(userOneSelect.userPosition, "sup")}'>
                                   checked
                            </c:if>>
                            <img src="${pageContext.request.contextPath}/img/lol/lolLaneTier/Position_Diamond-Support.png"
                                 alt=""/>
                        </label>
                        &nbsp;
                    </div>
                </div>
                <div class="radio-check" style="margin: 10px;">
                    <label for="rc-agree">
                        ???????????? 31????????? ?????????????????????. ???????????? ??????????????????!
                        <input type="checkbox" id="rc-agree">
                        <span class="checkbox"></span>
                    </label>
                </div>
                <div class="box on">
                    <button id="submitButton" type="button" style="margin: 10px;" onclick="fn_submit()">
                        <span>update</span>
                    </button>
                </div>
            </form>
            <!-- form?????? end -->
        </div>
    </div>
</div>

<script>
    $(".box button").attr("disabled", true);
    $("#rc-agree").on('click', function () {
        var chk = $('input:checkbox[id="rc-agree"]').is(":checked");
        if (chk === true && $('#user_nick').hasClass("check_success")) {
            $(".box button").removeAttr('disabled');
            $(".box").removeClass("on");

        } else if (chk === false || $('#user_nick').hasClass("check_fail")) {
            $(".box button").attr("disabled", true);
            $(".box").addClass("on");
        }
    });

    $("#user_nick").change(function () {
        $(".box button").attr("disabled", true);
        const chk = $('input:checkbox[id="rc-agree"]').is(":checked");
        if (chk === true && $('#user_nick').hasClass("check_success")) {
            $(".box button").removeAttr('disabled');
            $(".box").removeClass("on");
        } else if (chk === false || $('#user_nick').hasClass("check_fail")) {
            $(".box button").attr("disabled", true);
            $(".box").addClass("on");
        }
    });
    let sel_file;

    $(function () {
        $("#file").on("change", handleImgFileSelect);
    });

    function handleImgFileSelect(e) {
        const files = e.target.files;
        const filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function (f) {
            if (!f.type.match("image.*")) {
                alert("???????????? ????????? ???????????? ???????????????.");
                return;
            }
            sel_file = f;
            var reader = new FileReader();
            reader.onload = function (e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }

    //???????????? ???????????????
    //??????, ??????, ??????????????? 10?????? ?????? ???????????? ???????????????
    var nickRegcheck = /[0-9]|[a-z]|[A-Z]|[???-???]/;
    const userNick = $('#user_nick');
    userNick.keyup(
        function () {
            userNick.removeClass('check_success');
            userNick.removeClass('check_fail');
            if (userNick.val() === $('input[name=nickNameHidden]').val()) {
                $('#user_nick').addClass('check_success');
            } else {
                const sendData = {userNickname: userNick.val()}
                $.ajax({
                        url: "/user/idCheck.ajax",
                        type: "POST",
                        data: sendData,
                        success: function (data) {
                            if (userNick.val() === "" || userNick.val() == null || data === "ng") { // ???????????? ?????????
                                $('#user_nick').addClass('check_fail');
                            } else { // ???????????? ????????? ????????? ????????? ??????
                                if (nickRegcheck.test(userNick.val())) {
                                    $('#user_nick').addClass(
                                        'check_success');
                                } else {
                                    $('#user_nick').addClass(
                                        'check_fail');
                                }
                            }
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    }
                );
            }
        });

    function fn_submit() {
        //???????????? ?????? ----------
        //???????????? ??? -----------
        const positions = []
        $('input[name=positions]:checked').each(function () {
            positions.push($(this).val());
        });
        if (positions.length === 0) {
            positions.push("empty");
        }

        const inputFile = $("input[name='file']");
        const files = inputFile[0].files;

        const formData = new FormData();
        formData.append("nickNameBox", $("input[name=nickNameBox]").val());
        formData.append("positions", positions);
        formData.append("agree", $("#rc-agree").val());
        formData.append("uploadFile", files[0]);

        $.ajax({
            url: "/user/info",
            type: "POST",
            data: formData,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            dataType: "json",
            success: function (data) {
                alert(data.message);
                opener.parent.location.reload();
                window.close();
            },
            error: function (e) {
                alert("???????????? err");
                console.log(e);
            }
        });
    }

    function fn_loginPlz() {
        alert("???????????? ???????????????!")
    }
</script>


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