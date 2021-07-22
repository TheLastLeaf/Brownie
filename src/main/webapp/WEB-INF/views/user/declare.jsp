<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Amin Template">
    <meta name="keywords" content="Amin, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Declare</title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" type="text/css">
</head>
<style>
    body {
        background: black;
    }

    .signup-section {
        overflow: hidden;
    }

    .custom-control {
        margin: 15px 0px 10px;
        display: flex;
        justify-content: center;
    }

    .signup-text {
        padding-top: 45px;
    }

    .nameInfo {
        display: flex;
        justify-content: center;
    }

    .suspect {
        border: 0.5px solid white;
        color: white;
        margin-bottom: 10px;
        font-size: 15px;
        border-radius: 8px;
    }

    input[type="text"] {
        margin: 10px;
        border: 1px solid white;
        text-align: center;
    }

    button {
        margin-top: 5px;
        width: 30%;
    }

    .content {
        background-color: black;
        color: white;
        width: 50%;
    }
</style>
<script>
    function fn_submit() {
        const userId = $(".userId").val();
        const reportName = []
        const content = $(".content").val();
        const log = $(".log").val();

        $("input[name='reportName']:checked").each(function (i) {
            reportName.push($(this).val())
        })
        if (reportName.length === 0) {
            alert("신고 사유를 체크해주세요!")
            return false;
        }

        $.ajax({
            url: "./report",
            type: "POST",
            data: {
                "userId": userId,
                "reportName": reportName,
                "content": content,
                "log": log
            },
            success: function (data) {
                console.log(data)
                if (data === 1) {
                    alert("신고가 접수되었습니다.")
                    window.close();
                }
            },
            error: function () {
                alert("신고 접수 실패");
            }
        })
    }
</script>

<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="signup-section" style="display: block;">
    <div class="signup-text">
        <div class="container" style="text-align: center">
            <div class="signup-title" style="margin: 10px;">
                <h3 class="title" style="color: white;">You Die</h3>
            </div>
            <input type="hidden" name="log" value="${log}" class="log" id="log">
            <div class="nameInfo row">
                <input type="hidden" value="${userId}" name="userId" id="UserId" class="userId">
                <div class="suspect col-4">용의자:&nbsp; ${nickName}</div>
            </div>
            <div class="sf-input-list ">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" id="jb-checkbox2" class="custom-control-input reportName" name="reportName"
                           value="혐오발언">
                    <label class="custom-control-label" for="jb-checkbox2" style="color: white;">혐오발언</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" id="jb-checkbox3" class="custom-control-input reportName" name="reportName"
                           value="티어사칭">
                    <label class="custom-control-label" for="jb-checkbox3" style="color: white;">티어사칭</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" id="jb-checkbox4" class="custom-control-input reportName" name="reportName"
                           value="욕설리폿">
                    <label class="custom-control-label" for="jb-checkbox4" style="color: white;">욕설리풋</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" id="jb-checkbox1" class="custom-control-input reportName" name="reportName"
                           value="맘에안듬">
                    <label class="custom-control-label" for="jb-checkbox1" style="color: white;">맘에안듬</label>
                </div>
                <div class="comment label">
                    <input type="text" placeholder="기타 사유를 적어주세요!" maxlength="1000" class="form-control-sm content"
                           name="content">
                </div>
            </div>
            <button type="button" onclick="fn_submit()" class="btn btn-outline-danger btn-sm">
                <span>신고하기</span>
            </button>
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