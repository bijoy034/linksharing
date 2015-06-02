
<%@ page import="com.linksharing.DocumentResource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'documentResource.label', default: 'DocumentResource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-documentResource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-documentResource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list documentResource">
			
				<g:if test="${documentResourceInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="documentResource.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${documentResourceInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="documentResource.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${documentResourceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="documentResource.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:link controller="userDetail" action="show" id="${documentResourceInstance?.createdBy?.id}">${documentResourceInstance?.createdBy?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.topic}">
				<li class="fieldcontain">
					<span id="topic-label" class="property-label"><g:message code="documentResource.topic.label" default="Topic" /></span>
					
						<span class="property-value" aria-labelledby="topic-label"><g:link controller="topic" action="show" id="${documentResourceInstance?.topic?.id}">${documentResourceInstance?.topic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="documentResource.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${documentResourceInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="documentResource.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${documentResourceInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.filePath}">
				<li class="fieldcontain">
					<span id="filePath-label" class="property-label"><g:message code="documentResource.filePath.label" default="File Path" /></span>
					
						<span class="property-value" aria-labelledby="filePath-label"><g:fieldValue bean="${documentResourceInstance}" field="filePath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.readingItem}">
				<li class="fieldcontain">
					<span id="readingItem-label" class="property-label"><g:message code="documentResource.readingItem.label" default="Reading Item" /></span>
					
						<g:each in="${documentResourceInstance.readingItem}" var="r">
						<span class="property-value" aria-labelledby="readingItem-label"><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${documentResourceInstance?.resourceRating}">
				<li class="fieldcontain">
					<span id="resourceRating-label" class="property-label"><g:message code="documentResource.resourceRating.label" default="Resource Rating" /></span>
					
						<g:each in="${documentResourceInstance.resourceRating}" var="r">
						<span class="property-value" aria-labelledby="resourceRating-label"><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:documentResourceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${documentResourceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
