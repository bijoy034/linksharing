
<%@ page import="com.linksharing.ReadingItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'readingItem.label', default: 'ReadingItem')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-readingItem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-readingItem" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="readingItem.resource.label" default="Resource" /></th>
					
						<th><g:message code="readingItem.userDetail.label" default="User Detail" /></th>
					
						<g:sortableColumn property="isRead" title="${message(code: 'readingItem.isRead.label', default: 'Is Read')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${readingItemInstanceList}" status="i" var="readingItemInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${readingItemInstance.id}">${fieldValue(bean: readingItemInstance, field: "resource")}</g:link></td>
					
						<td>${fieldValue(bean: readingItemInstance, field: "userDetail")}</td>
					
						<td><g:formatBoolean boolean="${readingItemInstance.isRead}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${readingItemInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
