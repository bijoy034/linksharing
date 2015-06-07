<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="master">
    <g:set var="entityName" value="${message(code: 'login.label', default: 'Home Page')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>


    <!--row-fluid-->

    <div id="main-col">

        <div class="widget kopa-article-list-widget">
            <g:render template="/layouts/trending_topics"/>
        </div><!--kopa-article-list-widget-->

    </div><!--main-col-->

    <div class="widget-area-3 sidebar">

        <div class="widget kopa-article-list-widget">
            <g:render template="/layouts/user_authenticate"/>

        </div>

    </div><!--widget-area-3-->

    <div class="clear"></div>


</body>
</html>