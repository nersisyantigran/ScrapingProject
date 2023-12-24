%{--<style>--}%
%{--    body {--}%
%{--        background-image: linear-gradient(to right, rgba(255,0,0,0), #808080);--}%
%{--    }--}%
%{--</style>--}%
%{--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--}%
%{--<nav class="nav  bg-secondary " style="background-color: cadetblue;">--}%
%{--    <div class="container-fluid">--}%
%{--        <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>--}%
%{--        <g:link class="btn btn-secondary ">Data graphic</g:link>--}%
%{--        <g:link controller="scrapedData" action="searchResults" class="btn btn-secondary ">Search job</g:link>--}%
%{--    </div>--}%
%{--</nav>--}%
%{--<br>--}%
%{--<br>--}%
%{--<br>--}%

%{--<g:form controller="scrapedData" action="index">--}%
%{--    <div class="align-content-center">--}%
%{--        <p>--}%
%{--            <input type="submit" value="Search" class="btn btn-outline-success my-2 my-sm-0" id="FormButton" style="margin-right: 25px; margin-left: 25px;">--}%
%{--            <g:textField name="searchedWord" type="text" placeholder="Search word" value='${params.searchedWord}' />--}%
%{--        </p>--}%
%{--    </div>--}%
%{--</g:form>--}%

%{--<style>--}%
%{--    body {--}%
%{--        background-image: linear-gradient(to right, rgba(255,0,0,0), #808080);--}%

%{--    }--}%
%{--</style>--}%
%{--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--}%
%{--<nav class="nav  bg-secondary " style="background-color: cadetblue;">--}%
%{--    <div class="container-fluid">--}%
%{--        <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>--}%

%{--        <g:link class="btn btn-secondary ">Data graphic</g:link>--}%
%{--        <g:link controller="scrapedData" action="searchResults" class="btn btn-secondary ">Search job</g:link>--}%


%{--    </div>--}%
%{--</nav>--}%


%{--<br>--}%
%{--<br>--}%
%{--<br>--}%

%{--<g:form controller="scrapedData" action="index">--}%
%{--    <div class="align-content-center">--}%
%{--        <p>--}%
%{--            <input type="submit" value="Search" class="btn btn-outline-success my-2 my-sm-0" id="FormButton" style="margin-right: 25px; margin-left: 25px;">--}%
%{--            <g:textField name="searchedWord" type="text" placeholder="Search word" value='${params.searchedWord}' />--}%
%{--        </p>--}%

%{--    </div>--}%

%{--</g:form>--}%


<!doctype html>
<html lang="en">
<head>
    <asset:javascript src="application.js"/>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Login #7</title>
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
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="https://preview.colorlib.com/theme/bootstrap/login-form-07/images/undraw_remotely_2j6y.svg" alt="Image" class="img-fluid">
            </div>
            <div class="col-md-6 contents" style="margin-top: 50px;">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="mb-4">
                            <h3>Sign In</h3>
                            <p class="mb-4">Մուտք գործեք ձեր անձնական էջ.</p>
                        </div>
                        <g:form controller="scrapedData" action="index" method="post">
                            <div class="form-group first">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" id="username">
                            </div>
                            <div class="form-group last mb-4">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" id="password">
                            </div>
                            <input id="login" type="submit" value="Log In" class="btn btn-block btn-primary">
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>