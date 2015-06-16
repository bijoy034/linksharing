
<%@ page contentType="text/html;charset=UTF-8" %>
<%@page import="com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<html>
<head>
	<meta name="layout" content="master">
	<g:set var="entityName" value="${message(code: 'label', default: 'Dashboard')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>

</head>

<body>

<div id="main-col">

	<div class="widget kopa-article-list-widget">
		<div class="tab-container-1">
			<ul>
				<li>
						<article class="entry-item clearfix" >
							<div class="entry-content" >
								<c:viewResource resource="${post}"/>
								<c:editViewOption post="${post}" user="${session.user}" viewLink="hide" editPost="show"/>
								<c:resourceCreatedByDetail resource="${post}"/>
								<c:sharingOptions />
								<c:ratingOption resource="${post}" user="${session?.user}" />
							</div>
						</article>
					</li>

			</ul>
		</div>
	</div><!--kopa-article-list-widget-->

</div><!--main-col-->

<div class="widget-area-3 sidebar">

	<div class="widget kopa-article-list-widget">
		<g:if test="${session.user}">
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
		</g:if>
		<g:else>
			<g:render template="/layouts/user_authenticate"/>
		</g:else>
	</div>

</div><!--widget-area-3-->

<!--row-fluid-->




<div class="clear"></div>

</body>
</html>