<g:link controller="scrapedData" action="searchResults">your scrapedData</g:link>
<br>
<br>
<br>
<g:form controller="scrapedData" action="index">
    <p>
        <label>Application Group or Area</label>
        <g:textField name="searchedWord" type="text" placeholder="Place Holder Text Field 1" value='${params.searchedWord}' />
    </p>

    <p>
        <input type="submit" value="Submit Form" id="FormButton" >
    </p>
</g:form>