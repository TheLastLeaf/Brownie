<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>REPORT</title>

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
<script>
    $(document).ready(function () {
        $('#content').on('keyup', function () {
            $('#content_cnt').html("(" + $(this).val().length + " / 1000)");

            if ($(this).val().length > 1000) {
                $(this).val($(this).val().substring(0, 1000));
                $('#content_cnt').html("(1000 / 1000)");
            }
        });
    });

    function fn_submit() {
        const reportName = []
        $("input[name='reportName']:checked").each(function (i) {
            reportName.push($(this).val())
        })
        if (reportName.length == 0) {
            alert("신고 사유를 체크해주세요!")
            return false;
        }

        const formData = new FormData();
        formData.append("userId",$(".userId").val());
        formData.append("reportName", reportName);
        formData.append("content", $(".content").val());
        formData.append("log",$(".log").val());

        if(!confirm("정말 신고하시겠습니까?")){
            alert("신고 접수가 취소되었습니다")
            window.close();
            return false;
        }


        $.ajax({
            url: "./reportReply",
            type: "POST",
            data: formData,
            processData: false,
            enctype: 'multipart/form-data',
            contentType: false,
            dataType: "json",
            success: function (res) {
                if (res.message === "success") {
                    alert("신고 접수 성공");
                    window.close();
                } else if (res.message === "fail") {
                    alert("신고 접수 실패");
                } else if (res.message === "loginCheck") {
                    alert("로그인 후 이용 가능한 서비스입니다.");
                    window.close();
                }
            },
            error: function () {
                alert("신고 접수 실패");
            }
        })
    }

</script>
<style>
    .userName {
        color: white;
    }

    #content_cnt {
        color: white;
    }


    input[id="abusecon"] {
        position: relative;
        top: 1.5px;
    }

    label[for="abuseId"] {
        position: relative;
        top: -1.5px;
    }

    label {
        color: white;
    }

    .form-check {
        font-family: MapleLight;
        margin-bottom: 10px;
    }

    .container {
        height: 490px;
    }
</style>
<body style="background-color: black">
<div class="container" style="border: 1px solid white;">
    <div class="row">
        <div class="col text-center">
            <input type="hidden" name="userId" value="${replyVO.userId}" class="userId">
            <input type="hidden" name="log" value="${replyVO.replyContent}" class="log">
            <p>
            <h5 class="font-family-maple-bold userName">REPORT할 계정 : ${replyVO.nickName}</h5>
            </p>
            <div class="form-check">
                <input class="form-check-input reportName" type="checkbox" value="욕설" name="reportName" id="abuse">
                <label class="form-check-label" for="abuse">
                    욕설
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input reportName" type="checkbox" value="부적절한 내용" name="reportName"
                       id="abusecon">
                <label class="form-check-label" for="abusecon">
                    부적절한 내용
                </label>
            </div>
            <div class="form-check">
                <input class="form-check-input reportName" type="checkbox" value="부적절한 아이디" name="reportName"
                       id="abuseId">
                <label class="form-check-label" for="abuseId">
                    부적절한 아이디
                </label>
            </div>
            <p>
                <b class="font-family-maple-bold">신고내용</b>
                <br/>
                <textarea cols="30" rows="5" id="content" name="content" class="content"></textarea>
            <div id="content_cnt">(0 / 1000)</div>
            </p>
            <div class="submit">
                <input type="button" value="신고하기" class="btn btn-light" onclick="fn_submit()">
            </div>
        </div>
    </div>
</div>

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
