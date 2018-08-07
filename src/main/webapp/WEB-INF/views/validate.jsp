<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: mateusz
  Date: 01.08.18
  Time: 00:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Main</title>
    <style>
        body {background-color: #dddddd;}
        #container { width: 40%;  margin-left: auto; margin-right: auto; padding: 20px; margin-top: 100px;
            border: 1px black solid; background-color: white;}
    </style>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-color: #dddddd;">
<div id="container">
    <form:form method="post" modelAttribute="club">
        <div class="form-group">
            <label for="exampleInputUsername">Name</label>
            <form:input path="name"   class="form-control" id="exampleInputUsername"  placeholder="Enter name"/>
            <form:errors path="name"/>
        </div>
        <div class="form-group">
            <label for="exampleFormControlInput1">Address</label>
            <form:input path="address"  class="form-control" id="exampleFormControlInput1" placeholder="Enter address"/>
            <form:errors path="address"/>
        </div>
            <div class="form-group">
                <label for="exampleFormControlInput1">Lat</label>
                <form:input path="lat"  class="form-control" id="exampleFormControlInput1" placeholder="Enter lat"/>
            </div>
            <div class="form-group">
                <label for="exampleFormControlInput1">Lon</label>
                <form:input path="lon"  class="form-control" id="exampleFormControlInput1" placeholder="Enter lon"/>
            </div>

        <div class="form-group">
            <label for="exampleFormControlSelect1">Type</label>
            <form:select path="type" class="form-control" id="exampleFormControlSelect1">
                <option>dance</option>
                <option>salsa</option>
                <option>sport pub</option>
            </form:select>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form:form>
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