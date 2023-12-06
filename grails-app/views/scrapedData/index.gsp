<%
data = data
%>
<!DOCTYPE html>
<html>
    <head>
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
    <body>
    <div style="display: -webkit-inline-box;">
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