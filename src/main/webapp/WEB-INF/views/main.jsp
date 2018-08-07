<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: mateusz
  Date: 31.07.18
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Main</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>Title</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        body { background-image: url("resources/images/arena.jpg"); background-size: 100%;}
        #banner {position: relative; width: 1102px;height: 40%; margin-right: auto; margin-left: auto;
            border: 1px black solid; background-color: white;  text-align: center;}
        ol {padding: 0;margin: 0;list-style-type: none;font-size: 18px;height: 35px;line-height: 40px;display: inline-block;}
        #navbar{ position: absolute; left: 0; bottom: 0; width: 100%;}
        ol a {color: #6c757d; text-decoration: none;display: block;}
        ul a {color: #6c757d;;text-decoration: none;display: block;}
        ol > li {float: left;width: 275px;height: 35px;text-align: center;}
        ol > li:hover {background-color: #dddddd;}
        ol > li:hover > a {color: #000000; text-decoration: none;}
        ol > li > ul {list-style-type: none;padding: 0;margin: 0;height: 40px;display: none;}
        ol > li:hover > ul {display: block; }
        ol > li > ul > li {position: relative;z-index: 100;border-top:1px solid black;background-color: black; opacity:0.8;}
        ol > li > ul > li:hover {background-color: darkgrey; opacity: 0.8;}
        ol > li > ul > li:hover > a {color: black; text-decoration: none;}
        .btn-group {position: absolute; top: 0px; right: 0px; margin:10px;}
        h1{margin-top: 40px; color: rgba(232,147,72); font-size: 60px;}
        .valid {width:100%; height: 100px; margin-right: auto; margin-left: auto; margin-top: 10px;
            border: 1px black solid; background-color: white; border-radius: 20px; position: relative; opacity: 0.3;}
        .notvalid  { opacity: 0.5;}
        .sticky {width: 100%;position: fixed;left: 0;top: 0;z-index: 100;}
        .hidden{display: none;}
        #map {position: relative; width: 1102px;height: 100%; margin-right: auto; margin-left: auto;
            border: 1px black solid; background-color: white; border-radius: 20px; text-align: center; margin-top: 10px;}
        #map1 {position: relative; width: 1102px;height: 100%; margin-right: auto; margin-left: auto;
            border: 1px black solid; background-color: white; border-radius: 20px; text-align: center; margin-top: 10px;}
        img {width: 120px; height: 98px;}
        .img { float: left; position: absolute; left:200px; bottom: 0px;}
        .first {position: absolute; bottom: 60px; left: 500px; font-weight: 700; font-size: 20px;}
        .second {position: absolute; bottom: 35px; left: 500px;}
        .third {position: absolute; bottom: 10px; left: 500px;}
        #button {position: absolute; bottom: 10px;right: 100px;}
        #button1 {position: absolute; bottom: 10px;right: 100px;}
    </style>
</head>
<body>
<div class="container">
    <div id="banner" class="hidden">
       <img src="resources/images/club.jpg" style="width: 1102px; height:100%;">

        <div class="btn-group">
            <button class="btn btn-secondary " type="button" >
                <c:if test="${user != null}">
                    ${user.username}
                </c:if>
                <c:if test="${user == null}">
                    | | |
                </c:if>
            </button>
            <button type="button" class="btn btn-lg btn-secondary dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="sr-only">Toggle Dropdown</span>
            </button>
            <c:if test="${user == null}">
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/login">Login</a>
                    <a class="dropdown-item" href="/register">Register</a>
                    <a class="dropdown-item" href="/salsa">Salsa Zone</a>
                    <a class="dropdown-item" href="/sport">Sport Pubs Zone</a>
                </div>
            </c:if>
            <c:if test="${user != null}">
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="/add">Add club</a>
                    <a class="dropdown-item" href="#">Edit account</a>
                    <a class="dropdown-item" href="/salsa">Salsa Zone</a>
                    <a class="dropdown-item" href="/sport">Sport Pubs Zone</a>
                    <a class="dropdown-item" href="/logout">Log out</a>
                </div>
            </c:if>
        </div>
        <div id="navbar">
            <ol>
                <li><a href="/home">Wroc</a></li>
                <li id="limap"><a  href="#">Mapa</a></li>
                <li id="find"><a href="#">Znajdz</a></li>
                <li><a href="#">Sortowanie</a>
                    <ul>
                        <li><a href="#">Oceny</a></li>
                        <li><a href="#">Odleglosc</a></li>
                    </ul>
                </li>
                <div style="clear:both;"></div>
            </ol>
        </div>
    </div>
    <div id = "map" class="hidden" ></div>
 <c:forEach items="${clubs}" var="club">
     <c:if test="${club.validated == 'true'}">
        <div class="valid">
            <div class="img">
                <img src="resources/images/nologo.jpg"/>
            </div>
            <span class="first">${club.name}</span>
            <span class="second">Rating: ${club.rating}</span>
            <span class="third">${club.address} </span>
            <a href="#"><button id="button1" class="btn btn-secondary " type="button" >
                <span >Show route</span>
            </button></a>
        </div>
         <div id = "map1" class="hidden" ></div>
    </c:if>
     <c:if test="${club.validated == 'null'}">

         <div class="valid notvalid">
             <div class="img">
                 <img src="resources/images/nologo.jpg"/>
             </div>
             <span class="first">${club.name}</span>
             <span class="second">Rating: ${club.rating}</span>
             <span class="third">${club.address} </span>
                <c:if test="${user.type == 'admin'}">
                 <a href="/validate/${club.id}"><button id="button" class="btn btn-secondary " type="button" >
                     <span >Validate</span>
                </button></a>
                </c:if>
         </div>
     </c:if>
 </c:forEach>

</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
<script >

    $(document).ready(function() {
        var NavY = $('#navbar').offset().top;

        var stickyNav = function(){
            var ScrollY = $(window).scrollTop();

            if (ScrollY > NavY) {
                $('#navbar').addClass('sticky');
            } else {
                $('#navbar').removeClass('sticky');
            }
        };

        stickyNav();

        $(window).scroll(function() {
            stickyNav();
        });
    });

</script>


<script src="https://maps.googleapis.com/maps/api/js" type="text/javascript"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
        $('#limap').on('click', function() {
            $("div .valid").toggleClass("hidden");
            $("#map").toggleClass("hidden");

            var mapa;

            function dodajMarker(lat, lon, opcjeMarkera) {

                opcjeMarkera.position = new google.maps.LatLng(lat, lon);

                opcjeMarkera.map = mapa;
                var marker = new google.maps.Marker(opcjeMarkera);
            }


            var opcjeMapy =
                {
                    center: new google.maps.LatLng(51.1101985757782, 17.031989604842895),
                    zoom: 15,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
            mapa = new google.maps.Map(document.getElementById("map"), opcjeMapy);

            $.ajax({
                url: "/dance/get",
                data: {},
                type: "GET",
                dataType: "json",
                success: function (json) {
                    for (var klucz of json) {
                        dodajMarker(klucz.lat, klucz.lon, {title: klucz.name});
                    }
                }
            });
        });

            $('#button1').on('click', function() {
                $("#map1").toggleClass("hidden");

                var mapa;

                function dodajMarker(lat,lon,opcjeMarkera)
                {

                    opcjeMarkera.position = new google.maps.LatLng(lat,lon);

                    opcjeMarkera.map = mapa;
                    var marker = new google.maps.Marker(opcjeMarkera);
                }


                var opcjeMapy =
                    {
                        center: new google.maps.LatLng(51.1101985757782,17.031989604842895),
                        zoom: 15,
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                mapa = new google.maps.Map(document.getElementById("map1"), opcjeMapy);
                dodajMarker(51.1101985757782, 17.031989604842895,{title: "ja"});

        });




</script>

</body>
</html>
