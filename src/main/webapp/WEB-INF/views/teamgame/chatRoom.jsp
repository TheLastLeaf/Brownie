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
    <title>Chat System</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,800,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cinzel:400,700,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/${path}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/${path}/css/style.css" type="text/css">
</head>
<style>
    body {
        background: black;
    }

    #cr_title {
        display: flex;
        justify-content: flex-start;
        color: white;
    }

    .container {
        margin: 8px;
        /* 	border: 1px solid white; */
    }

    #containBox {
        height: 400px;
        display: flex;
        justify-content: center;
    }

    #enterBox {
        position: absolute;
        bottom: 0;
    }

    #userBox {
        color: white;
        border: 1px solid white;
    }

    #includeBox {
        color: white;
        border: 1px solid white;
    }
</style>

<body>
<div id="preloder">
    <div class="loader"></div>
</div>

<div class="container">
    <div id="cr_title" class="row">&nbsp;Faker | 그마이상구함!</div>
    <div id="containBox" class="row">
        <div id="includeBox" class="col-sm-9">
            <div id="chatBox">너는 위에 찍혀야행</div>
            <div id="enterBox">아래에 찍혀라 제발</div>
        </div>
        <div id="userBox" class="col-sm-3">
            <div id="userOne">1</div>
            <div id="userTwo">2</div>
            <div id="userThr">3</div>
            <div id="userFour">4</div>
            <div id="userFiv">5</div>
        </div>
    </div>
</div>


<!-- Js Plugins -->
<script src="/${path}/js/jquery-3.3.1.min.js"></script>
<script src="/${path}/js/bootstrap.min.js"></script>
<script src="/${path}/js/jquery.magnific-popup.min.js"></script>
<script src="/${path}/js/circle-progress.min.js"></script>
<script src="/${path}/js/jquery.barfiller.js"></script>
<script src="/${path}/js/jquery.slicknav.js"></script>
<script src="/${path}/js/owl.carousel.min.js"></script>
<script src="/${path}/js/main.js"></script>

</body>
</html>