<!doctype html>
<html lang="en">
<head>
    <asset:javascript src="application.js"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Login #7</title>
</head>
<style>
body{
    background-image: url("https://learn.g2.com/hubfs/iStock-955148158.jpg");
    background-repeat: no-repeat;
    background-size: 100%;
}

</style>
    <script>
        $(document).ready(function () {
            $("#login").click(function () {
                let username = $("username").value;
                let password = $("password").value;
                %{--if (username === password) {--}%
                %{--    <g:render template="scrapedData/index"/>--}%
                %{--}--}%
            });
        });
    </script>

<body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<asset:javascript src="application.js"/>

<nav class="nav  bg-secondary " style="background-color: cadetblue;">
        <div class="container-fluid">
            <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>
            <g:link  controller="scrapedData" action="dataGraphic" class="btn btn-secondary ">Data graphic</g:link>
            <g:link  controller="scrapedData" action="search" class="btn btn-secondary ">Search job</g:link>
        </div>
</nav>

<div class="form-group first" style="margin-top: 50px; margin-left: 30px;">
    <label for="intensive">Տվյալների պահպանման ինտենսիվություն</label><br>
    <select class="" id="intensive" aria-label="Տվյալների պահպանման ինտենսիվություն">
        <option value="1">1 շաբաթ</option>
        <option value="2">1 օր</option>
        <option value="3">1 ամիս</option>
    </select>
    <button style="/*margin-left: 50px;margin-top: 100px;*/" class="btn btn-success">Սահմանել</button>

</div>


</body>
</html>

