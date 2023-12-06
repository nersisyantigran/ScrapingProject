<%

%>
<!DOCTYPE html>
<html>
<head>

    <g:set var="entityName" value="${message(code: 'scrapedData.label', default: 'ScrapedData')}" />
    <asset:javascript src="application.js"/>
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
%{--${keysArray}--}%
%{--${valuesArray}--}%

<div >
    <canvas id="myChart"></canvas>

</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<g:javascript>
    $(document).ready(function () {

        const ctx = document.getElementById('myChart');
        var keysArray = ${raw(arr1)};


        console.log("keysArray = "+keysArray);
        // console.log("valuesArray = "+valuesArray.join('').replace(/\\u002c/g, ','));


        // new Chart(ctx, {
        //     type: 'bar',
        //     data: {
        //         labels: keysArray,
        //         datasets: [{
        //             label: '# of Votes',
        //             data: valuesArray,
        //             borderWidth: 1
        //         }]
        //     },
        //     options: {
        //         scales: {
        //             y: {
        //                 beginAtZero: true
        //             }
        //         }
        //     }
        // // });
});
</g:javascript>
</body>
</html>