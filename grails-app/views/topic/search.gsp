
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<html>
<head>
	<meta name="layout" content="master">
	<g:set var="entityName" value="${message(code: 'label', default: 'Dashboard')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>

</head>

<body>
<div class="widget-area-3 sidebar">


	<div class="widget kopa-article-list-widget">
			<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Trending Topics</span></h3>
			<div class="list-container-1">
				<ul class="clearfix" id="ttopic">
					<li class="active" style="font-weight: bold;">
						<g:remoteLink controller="ajax" action="trendingTopic" params="${[day:"today"]}" update="trending-body" >
							Today
						</g:remoteLink>
					</li>
					<li>
						<g:remoteLink controller="ajax" action="trendingTopic" params="${[day:"week"]}" update="trending-body" >
							Week
						</g:remoteLink>
					</li>
					<li>
						<g:remoteLink controller="ajax" action="trendingTopic" params="${[day:"month"]}" update="trending-body" >
							Month
						</g:remoteLink>
					</li>
					<li>
						<g:remoteLink controller="ajax" action="trendingTopic" params="${[day:"year"]}" update="trending-body" >
							Year
						</g:remoteLink>
					</li>
				</ul><!--tabs-1-->
			</div>

			<div class="tab-container-1" id="trending-body">

				<g:render template="/layouts/trending_topics"/>

			</div>

	</div>

	<div class="widget kopa-article-list-widget">
		<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Top Posts</span></h3>
		<div class="list-container-1">
			<ul class="clearfix" id="tpost">
				<li class="active" style="font-weight: bold;">
					<g:remoteLink controller="ajax" action="topPost" params="${[day:"today"]}" update="top-post-body" >
						Today
					</g:remoteLink>
				</li>
				<li>
					<g:remoteLink controller="ajax" action="topPost" params="${[day:"week"]}" update="top-post-body" >
						Week
					</g:remoteLink>
				</li>
				<li>
					<g:remoteLink controller="ajax" action="topPost" params="${[day:"month"]}" update="top-post-body" >
						Month
					</g:remoteLink>
				</li>
				<li>
					<g:remoteLink controller="ajax" action="topPost" params="${[day:"year"]}" update="top-post-body" >
						Year
					</g:remoteLink>
				</li>
			</ul><!--tabs-1-->
		</div>

		<div class="tab-container-1" id="top-post-body">

			<g:render template="/topic/top_post"/>

		</div>

	</div>
</div>
<div id="main-col">
	<div class="widget kopa-article-list-widget">
		<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Search Result</span></h3>
		<g:render template="/topic/search_result"/>
	</div><!--kopa-article-list-widget-->


</div><!--main-col-->

<!--widget-area-3-->

<!--row-fluid-->




<div class="clear"></div>

</body>
</html>