<%

%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <g:set var="entityName" value="${message(code: 'scrapedData.label', default: 'ScrapedData')}"/>
    <asset:javascript src="application.js"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<select name="chartSelect" id="chartSelect">
    <option></option>
    <option value="bar">bar</option>
    <option value="pie">pie</option>
</select>


<div>
    <canvas id="barChart"></canvas>
</div>
<div  style="height: 800px; width: 800px;">
    <canvas id="pieChart"></canvas>
</div>

<g:javascript>
    $(document).ready(function () {
        function getRandomColor() {
          var letters = '0123456789ABCDEF';
          var color = '#';
          for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
          }
          return color;
        }
        var barColors = [];
        for (var i = 0; i < 51; i++) {
          barColors.push(getRandomColor());
        }

        var keysArray = "${raw(keysArr)}";
        keysArray = keysArray.replace("[","").replace("]","").split(",")
        var valuesArray = "${raw(valuesArr)}";
        valuesArray = valuesArray.replace("[","").replace("]","").split(",")
        // console.log("keysArray = "+  keysArray);
        // console.log("valuesArray = "+  valuesArray);
        let selected = $("#chartSelect ")[0].value
        $("#chartSelect").change(function(){
            selected = $(this).val();
                    if (selected == 'bar'){
                        $("#barChart").show();
                        $("#pieChart").hide();
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
                    } else if (selected == 'pie'){
                        $("#barChart").hide();
                        $("#pieChart").show();
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
                    }

        });


});
</g:javascript>
</body>
</html>