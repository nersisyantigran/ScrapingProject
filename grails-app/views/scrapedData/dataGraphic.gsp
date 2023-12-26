
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <g:set var="entityName" value="${message(code: 'scrapedData.label', default: 'ScrapedData')}"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <asset:javascript src="application.js"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>
<style>
ul {
    list-style-type: none;
    font-weight: bold;
}
</style>
<body>
    <g:render template="navBar"/>

<div style=" position: fixed; margin-left:10px; width: 50px; ">
    <label for="chartSelect">Ցուցադրման ձևը</label>
    <select name="chartSelect" class="form-select" style="margin-left:10px; width: 50px; height: 20px;" id="chartSelect">
        <option value="">Տեքստային</option>
        <option value="bar">Սյունյակային</option>
        <option value="pie">Շրջանաձև</option>
    </select>
</div>

<div style="position: relative">
    <div style=" position: fixed; margin-left:1400px; width: 50px; ">
        <label for="chartSelect" style="width: 300px;">Տվյալների հավաքագրում ըստ՝ </label>
        <select name="byWhat" class="form-select" style="margin-left:10px; width: 50px; height: 20px;" id="byWhat">
            <option value="categories">Կատեգորիաների</option>
            <option value="job_city">Քաղաքների</option>
        </select>
    </div>
</div>

<div id="content" style="text-align: left; margin-left: 100px; width: 100%;display: flex;">
</div>



<div>
    <canvas id="barChart"></canvas>
</div>
<div  style="height: 800px; width: 800px; margin-left: 300px;">
    <canvas id="pieChart"></canvas>
</div>
<g:javascript>
    $(document).ready(function () {

         $("#byWhat").change(function(){
              var selectedValue = $(this).val();

            // Check if a valid option is selected
            if (selectedValue !== "") {
                // Redirect to the 'dataGraphic' action with the selected value
                window.location.href = "${createLink(controller: 'scrapedData', action: 'dataGraphic')}" + "?byWhat=" + selectedValue;
            }

    });
    $("#barChart").hide();
    $("#pieChart").hide();
    var keysArray = "${raw(keysArr)}";
        keysArray = keysArray.replace("[","").replace("]","").split(",")
        var valuesArray = "${raw(valuesArr)}";
        valuesArray = valuesArray.replace("[","").replace("]","").split(",")
        var displayData = '<ul>';

function getRandomColor() {
var letters = '0123456789ABCDEF';
var color = '#';
for (var i = 0; i < 6; i++) {
color += letters[Math.floor(Math.random() * 16)];
}
return color;
}
var barColors = [];
for (var i = 0; i < keysArray.length; i++) {
barColors.push(getRandomColor());

displayData += '<li>' + keysArray[i] + ': ' + valuesArray[i] + '</li>';
}
displayData += '</ul>';
displayData += "<div>                <img src='https://pyjamahr.com/wp-content/uploads/2021/12/shutterstock_1814645042_ys5h7t.jpg'> </div>";
            document.getElementById('content').innerHTML = displayData;

        $("#content").innerHTML = displayData;

                                new Chart("barChart", {
                            type: 'bar',
                            data: {
                                labels: keysArray,
                                datasets: [{
                                    label: '# of Votes',
                                    data: valuesArray,
                                    backgroundColor: barColors,
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                }
                            }
                        });


                                new Chart("pieChart", {
                              type: "pie",
                              data: {
                                labels: keysArray,
                                datasets: [{
                                  backgroundColor: barColors,
                                  data: valuesArray
                                }]
                              },
                              options: {
                                title: {
                                  display: true,
                                  text: "World Wide Wine Production"
                                }
                              }
                        });

        let selected = $("#chartSelect ")[0].value
        $("#chartSelect").change(function(){
            selected = $(this).val();
                    if (selected == 'bar'){
                        $("#barChart").show();
                        $("#pieChart").hide();
                        $("#content").hide();
                    } else if (selected == 'pie'){
                        $("#barChart").hide();
                        $("#content").hide();
                        $("#pieChart").show();
                    } else if (selected == ''){
                         $("#barChart").hide();
                        $("#pieChart").hide();
                        $("#content").show();
                    }
        });
});
</g:javascript>
</body>
</html>