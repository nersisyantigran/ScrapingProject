<%
data = data
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

        <style>
        .hb_list_item {
            width: 200px;
            margin-right: 10px;
        }
        img{
            width: 200px;
        }
        </style>

        <g:set var="entityName" value="${message(code: 'scrapedData.label', default: 'ScrapedData')}" />
        <asset:javascript src="application.js"/>
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body style="background-image: linear-gradient(to right, rgba(255,0,0,0), #808080);
    ">
    <nav class="nav  bg-secondary " style="background-color: cadetblue;">
        <div class="container-fluid">
            <g:link  controller="scrapedData" action="index" class="btn btn-secondary ">Home</g:link>

            <g:link class="btn btn-secondary ">Data graphic</g:link>
            <g:link controller="scrapedData" action="searchResults" class="btn btn-secondary ">Search job</g:link>
        </div>
    </nav>
    <div style="display: -webkit-inline-box; margin-top: 25px;">
${raw("""
    ${data}
            """)}
    </div>
    <g:javascript>
        $(document).ready(function () {
            $( ".job-list-item-add" ).remove();

            document.querySelectorAll('a').forEach(function(anchor) {
                anchor.removeAttribute('href');
            });
            $('.btn_follow_block').remove();
            $(".load-more").remove();
            $('img[src="/img/staff/verifed.png"]').remove();
            $('img[src="https://cdn.staff.am/shared/images/new_en.png"]').remove();
        });
    </g:javascript>
    </body>
</html>