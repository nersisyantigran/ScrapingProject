<g:link controller="scrapedData" action="searchResults">your scrapedData</g:link>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<br>
<br>
<br>
<g:form controller="scrapedData" action="index">
    <p>
        <label>Application Group or Area</label>
        <g:textField name="searchedWord" type="text" placeholder="Search word" value='${params.searchedWord}' />
    </p>

    <p>
        <input type="submit" value="Search" id="FormButton" >
    </p>
</g:form>