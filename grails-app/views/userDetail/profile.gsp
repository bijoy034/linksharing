
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="master">
    <g:set var="entityName" value="${message(code: 'label', default: 'Dashboard')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
    <div class="widget-area-3 sidebar">
        <div class="widget kopa-article-list-widget">
            <g:render template="/userDetail/user_profile"/>
        </div>
        <div class="widget kopa-article-list-widget">
            <h3 class="widget-title" style="margin-bottom: 3px;"><span class="title-line"></span><span class="title-text">My Topic</span></h3>
            <g:render template="/layouts/topic_list"/>
        </div><!--kopa-article-list-widget-->


    </div><!--widget-area-3-->

<!--row-fluid-->

    <div id="main-col">
    <div class="widget kopa-article-list-widget">
    <h3 class="widget-title" style="margin-bottom: 3px;"><span class="title-line"></span><span class="title-text">Update</span></h3>
    <div class="list-container-3">
        <ul class="tabs-3 clearfix">
            <li class="active"><a href="#tab-3-1">Profile</a></li>
            <li><a href="#tab-3-2">Change password</a></li>
        </ul><!--tabs-3-->
    </div>

    <div class="tab-container-3">
        <div class="tab-content-3" id="tab-3-1">
           <g:render template="profile_change"/>
        </div><!--tab-content-3-->
        <div class="tab-content-3" id="tab-3-2">
            <g:render template="password_change"/>
        </div><!--tab-content-3-->

    </div>
</div>
    </div><!--main-col-->


    <div class="clear"></div>

</body>
</html>