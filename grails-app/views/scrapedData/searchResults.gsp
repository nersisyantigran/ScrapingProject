
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
body {
    /*background-image: url('https://cdto.work/wp-content/uploads/2021/10/2f5d6e2eac78ae12ca9170c76d4262b2.jpg');
    background-repeat: no-repeat;
    background-size: 100% 100%;*/
}
</style>
<body>
<select name="chartSelect" class="form-select" style="margin-left:50px; margin-top: 20px; width: 50px; height: 20px;" id="chartSelect">
    <option value="">Select type</option>
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
         $("#barChart").hide();
         $("#pieChart").hide();
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
                    } else if (selected == 'pie'){
                        $("#barChart").hide();
                        $("#pieChart").show();
                    } else if (selected == ''){
                         $("#barChart").hide();
                        $("#pieChart").hide();
                    }

        });


});
</g:javascript>
</body>
</html>