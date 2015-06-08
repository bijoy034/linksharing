
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
		<h3 class="widget-title"><span class="title-line"></span><span class="title-text">${topicList[0].name}</span></h3>
		<g:render template="/layouts/topic_list"/>
	</div>

	<div class="widget kopa-article-list-widget">
		<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Subscribers</span></h3>
		<g:render template="/layouts/user_profile"/>
	</div>

</div><!--widget-area-3-->

<!--row-fluid-->

<div id="main-col">

	<div class="widget kopa-article-list-widget">
		<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Posts</span></h3>
		<g:render template="/layouts/topic_posts"/>
	</div><!--kopa-article-list-widget-->

</div><!--main-col-->


<div class="clear"></div>

</body>
</html>