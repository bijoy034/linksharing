
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
						<article class="entry-item clearfix">
							<div class="entry-thumb" style="width: 10%;float: left;"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${post.createdBy.username?:'user.png'}")}" alt=""/></a> </div>

							<div class="entry-content" style="width: 80%;float:left;">
								<h4 class="entry-title">
									<a href="#">${post.createdBy.firstName+" "+post.createdBy.lastName}</a>
									<label style="color:#B2B2B2;display: inline;">@${post.createdBy.username}</label>
									<label style="color:#B2B2B2;display: inline;"> / 5 mnt before</label>
								</h4>
								<a href="#">${post.topic.name}</a>
								<p class="entry-description" style="max-height: none;overflow: auto;">${post.description}</p>
								<span class="entry-date">
									<a href="#"><asset:image src="placeholders/facebook-icon.png" alt="" /></a>
									<a href="#"><asset:image src="placeholders/Linkedin.png" alt="" /></a>
									<a href="#"><asset:image src="placeholders/googleplus.png" alt="" /></a>
									<div class="modify">

										<g:if test="${!post.readingItem*.userDetail.id.contains(session.user.id)}">
											<a href="#">Mark as read</a>
										</g:if>
										<%
											LinkShare link = LinkShare.get(post.id)
											DocumentResource doc = DocumentResource.get(post.id)
										%>
										<g:if test="${link}">
											<a href="${link.url}" target="_blank">View full site</a>
										</g:if>
										<g:if test="${doc}">
											<g:link controller="documentResource" action="downloadDoc" id="${post.id}" target="_blank">Download</g:link>
										</g:if>
										<g:if test="${post.createdBy.id == session.user?.id}">
											<a href="#" >Edit</a>
											<a href="#" >Delete</a>
										</g:if>


									</div>
								</span>
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
			<g:render template="/layouts/trending_topics"/>
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