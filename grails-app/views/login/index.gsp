<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="master">
	<g:set var="entityName" value="${message(code: 'login.label', default: 'Home Page')}"/>
	<title><g:message code="default.list.label" args="[entityName]"/></title>
	<asset:stylesheet src="css/flexslider.css"/>
</head>

<body>


<div class="widget-area-1">

	<div class="widget home-slider-widget">

		<div class="home-slider flexslider">
			<ul class="slides">
				<li>
					<article class="entry-item">
						<h2 class="entry-title"><a href="#">Should There be Lights on the Park Arthur Sledding Hill?</a></h2>
						<asset:image src="placeholders/slider/slide-1.jpg"/>
					</article>
				</li>
				<li>
					<article class="entry-item">
						<h2 class="entry-title"><a href="#">Should There be Lights on the Park Arthur Sledding Hill?</a></h2>
						<asset:image src="placeholders/slider/slide-2.jpg" alt="" />
					</article>
				</li>
				<li>
					<article class="entry-item">
						<h2 class="entry-title"><a href="#">Should There be Lights on the Park Arthur Sledding Hill?</a></h2>
						<asset:image src="placeholders/slider/slide-3.jpg" alt="" />
					</article>
				</li>
			</ul><!--slides-->
		</div><!--home-slider-->
	</div><!--home-slider-widget-->

</div><!--widget-area-1-->

<div id="main-col">

	<div class="widget kopa-article-list-widget ">
		<h3 class="widget-title clearfix">
			<span class="title-text">Trending Topics
				<span class="triangle-right"></span>
				<span class="triangle-left"></span>
				<span class="triangle-bottom"></span>
			</span>
		</h3>

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

		</div><!--tab-container-1-->
	</div>


</div><!--main-col-->

<div class="widget-area-3 sidebar">

	<div class="widget kopa-article-list-widget">
		<g:render template="/layouts/user_authenticate"/>

	</div>

</div><!--widget-area-3-->

<div class="clear"></div>


</body>
</html>