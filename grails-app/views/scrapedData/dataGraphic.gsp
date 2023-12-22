
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
ul {
    list-style-type: none;
    font-weight: bold;
}
#leftBg {
    background-image: url('https://i0.wp.com/iosolutions.com/wp-content/uploads/2017/02/aboutbackground.jpg?resize=700%2C450&ssl=1');
    background-repeat: no-repeat;
    background-size: 100% 100%;
}
</style>
<body>
<nav class="nav  bg-secondary " style="background-color: cadetblue;">
    <div class="container-fluid">
        <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>
        <g:link  controller="scrapedData" action="dataGraphic" class="btn btn-secondary ">Data graphic</g:link>
        <g:link  controller="scrapedData" action="search" class="btn btn-secondary ">Search job</g:link>
    </div>
</nav>
<select name="chartSelect" class="form-select" style="margin-left:10px; width: 50px; height: 20px; position: fixed;" id="chartSelect">
    <option value="">Select type</option>
    <option value="bar">bar</option>
    <option value="pie">pie</option>
</select>

<div id="content" style="text-align: left; margin-left: 100px; width: 100%;
background-image: linear-gradient(to right, rgba(255,0,0,0), #808080);
">
</div>

<div>
    <canvas id="barChart"></canvas>
</div>
<div  style="height: 800px; width: 800px; margin-left: 300px;">
    <canvas id="pieChart"></canvas>
</div>
<g:javascript>
    $(document).ready(function () {
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