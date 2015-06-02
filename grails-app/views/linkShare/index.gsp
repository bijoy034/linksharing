
<%@ page import="com.linksharing.LinkShare" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'linkShare.label', default: 'LinkShare')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-linkShare" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-linkShare" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'linkShare.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'linkShare.description.label', default: 'Description')}" />
					
						<th><g:message code="linkShare.createdBy.label" default="Created By" /></th>
					
						<th><g:message code="linkShare.topic.label" default="Topic" /></th>
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'linkShare.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'linkShare.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${linkShareInstanceList}" status="i" var="linkShareInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${linkShareInstance.id}">${fieldValue(bean: linkShareInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: linkShareInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: linkShareInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: linkShareInstance, field: "topic")}</td>
					
						<td><g:formatDate date="${linkShareInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${linkShareInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${linkShareInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
