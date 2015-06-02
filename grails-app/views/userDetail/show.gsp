
<%@ page import="com.linksharing.UserDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userDetail.label', default: 'UserDetail')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userDetail" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userDetail">
			
				<g:if test="${userDetailInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="userDetail.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userDetailInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="userDetail.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userDetailInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="userDetail.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userDetailInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.username}">
				<li class="fieldcontain">
					<span id="username-label" class="property-label"><g:message code="userDetail.username.label" default="Username" /></span>
					
						<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userDetailInstance}" field="username"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="userDetail.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userDetailInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="userDetail.photo.label" default="Photo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="userDetail.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:formatBoolean boolean="${userDetailInstance?.admin}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.active}">
				<li class="fieldcontain">
					<span id="active-label" class="property-label"><g:message code="userDetail.active.label" default="Active" /></span>
					
						<span class="property-value" aria-labelledby="active-label"><g:formatBoolean boolean="${userDetailInstance?.active}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="userDetail.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${userDetailInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="userDetail.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${userDetailInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.readingItem}">
				<li class="fieldcontain">
					<span id="readingItem-label" class="property-label"><g:message code="userDetail.readingItem.label" default="Reading Item" /></span>
					
						<g:each in="${userDetailInstance.readingItem}" var="r">
						<span class="property-value" aria-labelledby="readingItem-label"><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.resource}">
				<li class="fieldcontain">
					<span id="resource-label" class="property-label"><g:message code="userDetail.resource.label" default="Resource" /></span>
					
						<g:each in="${userDetailInstance.resource}" var="r">
						<span class="property-value" aria-labelledby="resource-label"><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.resourceRating}">
				<li class="fieldcontain">
					<span id="resourceRating-label" class="property-label"><g:message code="userDetail.resourceRating.label" default="Resource Rating" /></span>
					
						<g:each in="${userDetailInstance.resourceRating}" var="r">
						<span class="property-value" aria-labelledby="resourceRating-label"><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.subscription}">
				<li class="fieldcontain">
					<span id="subscription-label" class="property-label"><g:message code="userDetail.subscription.label" default="Subscription" /></span>
					
						<g:each in="${userDetailInstance.subscription}" var="s">
						<span class="property-value" aria-labelledby="subscription-label"><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userDetailInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="userDetail.topic.label" default="Topic" /></span>
					
						<g:each in="${userDetailInstance.topic}" var="t">
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userDetailInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userDetailInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
