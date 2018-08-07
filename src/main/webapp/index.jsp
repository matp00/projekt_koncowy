<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mateusz
  Date: 30.07.18
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="resources/js/app.js" type="text/javascript"></script>
    <link src="resources/css/style.css" type="text/css">
    <style>
        body { background-image: url("resources/images/arena.jpg"); background-size: 100%;}
        .kafelek{ width: 300px; height: 200px; float: left; margin: 10px; border-radius: 20px;
            background-color: white; border: 1px black solid; opacity: 0.3;}
        .kafelekl{ width: 300px; height: 200px; float: left; margin: 10px; border-radius: 20px;
            background-color: white; border: 1px black solid; opacity: 0.3;}
        #container{ width:645px;  margin-left: auto; margin-right: auto; margin-top: 100px;}
        .ramka {position:relative; }
        p { color: grey; line-height: 150px; text-align: center;font-size: 25px; opacity: 1;}
        .kafelek:hover{background-color: ghostwhite; opacity: 0.6;}
        .kafelek:hover > p {color: grey; opacity: 1;}
        .kafelekl:hover{ background-color: ghostwhite;
            opacity: 0.6;}

        .formchild { height: 25px; margin-left: auto; margin-right: auto; border: 1px black solid; width: 80%; margin-bottom: 10px; border-radius: 30px; text-align: center;
            line-height: 25px;}
        .form {margin-top: 70px;}
        .login {background-color: white; color:grey; border: 1px black solid; }
        .login:hover{background-color: rgba(232,147,72); color: white; }
        a {text-decoration: none;}
    </style>
</head>
<body>
<div >
    <div id="container">
       <a href="/dance">
           <div class="kafelek first ramka">
             <p>Dance Music ZONE</p>
            </div>
       </a>
       <a href = "/salsa">
            <div class="kafelek ramka">
               <p>Salsa ZONE</p>
           </div>
       </a>


        <a href="/sport">
       <div class="kafelek first ramka">
           <p>Sport Pubs</p>
       </div>
        </a>
       <div class="kafelekl ramka">
           <c:if test="${user != null}">
               <p>Witaj ${user.username}</p>
           </c:if>
           <div class="form">
                <c:if test="${user == null}">
                    <a href="/login"><div class="login formchild">Zaloguj sie</div></a>

                    <a href="/register"><div class="login formchild">Zarejestruj sie</div></a>
                </c:if>
           </div>
       </div>

        <div style="clear:both;"></div>
    </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
