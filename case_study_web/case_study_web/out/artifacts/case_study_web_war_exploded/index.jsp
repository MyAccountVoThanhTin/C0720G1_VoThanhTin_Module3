<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 11/9/2020
  Time: 3:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
        .nav-link:hover {
            background-color: cornflowerblue;
        }

        /*body {*/
        /*    background-image: url("https://khachsandanang.info/wp-content/uploads/2015/03/Furama-Resort-Danang-3-750x450.jpg");*/
        /*}*/
    </style>
</head>
<body>
<div class="header-content">
    <div class="container">
        <div class="row">
            <div class="col-auto col-sm-5 col-lg-3 d-flex align-items-center bestel-logo">
                <a href="#" class="header-logo"><img id="logo"
                                                     src="https://furamavietnam.com/wp-content/uploads/2018/08/logo@2x.png"
                                                     alt="logo " class="img-fluid" width="63" height="100"></a>
            </div>
            <div class="col col-md-auto col-lg-3 d-flex">
                <div class="catalog-widget d-none d-sm-block">
                    <div class="catalog-widget-inside" style="visibility: visible;">
                        <a href="#" target="_blank">
                            <div class="widget-tripadvisor">
                                <div class="inside">
                                    <div class="widget-tripadvisor-logo"><img
                                            src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                                            alt=""></div>
                                    <div class="widget-tripadvisor-rating"><img
                                            src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png"
                                            alt=""></div>
                                </div>
                            </div>
                        </a>
                        <span class="catalog-widget-toggle js-catalog-widget-toggle"></span></div>
                </div>
                <div class="catalog-widget-mobile d-flex d-sm-none align-items-center mx-auto">
                </div>
            </div>
        </div>
    </div>
</div>
<form action="" method="get">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="?action=comeBack">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent" style="background-color: #64f3ff">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/employee">Employee<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contract</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Service
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Villa</a>
                        <a class="dropdown-item" href="#">House</a>
                        <a class="dropdown-item" href="#">Room</a>
                    </div>
                </li>
            </ul>
<%--            <form class="form-inline my-2 my-lg-0">--%>
          <%--                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
          <%--                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
          <%--            </form>--%>
        </div>
    </nav>
</form>
<form action="">
    <div class="container-fluid">
        <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://furamavietnam.com/wp-content/uploads/2018/07/Vietnam_Danang_Furama_Resort_Exterior_Courtyard.jpg"
                         class="d-block w-100" alt="">
                </div>
                <div class="carousel-item">
                    <img src="https://cdn.dealtoday.vn/img/s630x420/d38fe9badc684c6791c1550af4f3644c.jpg?sign=LWlvv9u8pMgLhR1Jk6LxFg" class="d-block w-100"
                         alt="">
                </div>
                <div class="carousel-item">
                    <img src="https://du-lich.chudu24.com/f/m/1603/18/furama-resort-da-nang.jpg" class="d-block w-100"
                         alt="">
                </div>
                <div class="carousel-item">
                    <img src="https://furama-booking.com/wp-content/uploads/2018/09/ho-boi-view-bien-tai-furama-da-nang-850x567.jpg"
                         class="d-block w-100" alt="">
                </div>
                <div class="carousel-item">
                    <img src="https://s3-ap-southeast-1.amazonaws.com/viettrip/Products/bdbb3094-7e0f-4c05-8f97-821c5258ff8e/123116_21032019_furama-villas-da-nang-2.jpg"
                         class="d-block w-100" alt="">
                </div>
            </div>
        </div>
    </div>
</form>
<div class="card-footer" style="background:#117a8b;margin-top: 5px ;height: 50px"></div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
</body>
</html>