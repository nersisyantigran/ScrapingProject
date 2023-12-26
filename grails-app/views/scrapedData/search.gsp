<style>
    body {
        background-image: url("https://www.life.gov.sg/img/wasj/banner_support-for-your-job-search.png");
        background-size: 60%;
        background-repeat: no-repeat;

    }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<g:render template="navBar"/>



<br>
<br>
<br>

<div style="margin-left: 900px;">
    <span style="margin-left: 70px">    Աշխատանքի որոնում </span><br><br>
    <g:form controller="scrapedData" action="searchResults">
        <div class="align-content-center">
            <p>
                <input type="submit" value=" Փնտրել" class="btn btn-success my-2 my-sm-0" id="FormButton" style="margin-right: 25px; margin-left: 25px;">
                <g:textField name="searchedWord" type="text" placeholder="Փնտրվող բառ" value='${params.searchedWord}' />
            </p>

        </div>

    </g:form>
</div>

