<style>
    body {
        background-image: linear-gradient(to right, rgba(255,0,0,0), #808080);

    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<nav class="nav  bg-secondary " style="background-color: cadetblue;">
    <div class="container-fluid">
        <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>

        <g:link class="btn btn-secondary ">Data graphic</g:link>
        <g:link controller="scrapedData" action="searchResults" class="btn btn-secondary ">Search job</g:link>


    </div>
</nav>


<br>
<br>
<br>

<g:form controller="scrapedData" action="index">
    <div class="align-content-center">
        <p>
            <input type="submit" value="Search" class="btn btn-outline-success my-2 my-sm-0" id="FormButton" style="margin-right: 25px; margin-left: 25px;">
            <g:textField name="searchedWord" type="text" placeholder="Search word" value='${params.searchedWord}' />
        </p>

    </div>

</g:form>