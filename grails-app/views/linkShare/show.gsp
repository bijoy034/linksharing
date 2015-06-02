
<%@ page import="com.linksharing.LinkShare" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkShare.label', default: 'LinkShare')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-linkShare" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-linkShare" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list linkShare">
			
				<g:if test="${linkShareInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="linkShare.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${linkShareInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="linkShare.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${linkShareInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="linkShare.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="userDetail" action="show" id="${linkShareInstance?.createdBy?.id}">${linkShareInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="linkShare.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${linkShareInstance?.topic?.id}">${linkShareInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="linkShare.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${linkShareInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="linkShare.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${linkShareInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="linkShare.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${linkShareInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.readingItem}">
				<li class="fieldcontain">
					<span id="readingItem-label" class="property-label"><g:message code="linkShare.readingItem.label" default="Reading Item" /></span>
					
						<g:each in="${linkShareInstance.readingItem}" var="r">
						<span class="property-value" aria-labelledby="readingItem-label"><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${linkShareInstance?.resourceRating}">
				<li class="fieldcontain">
					<span id="resourceRating-label" class="property-label"><g:message code="linkShare.resourceRating.label" default="Resource Rating" /></span>
					
						<g:each in="${linkShareInstance.resourceRating}" var="r">
						<span class="property-value" aria-labelledby="resourceRating-label"><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:linkShareInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${linkShareInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
