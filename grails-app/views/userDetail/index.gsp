
<%@ page import="com.linksharing.UserDetail" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userDetail.label', default: 'UserDetail')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userDetail" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userDetail" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="firstName" title="${message(code: 'userDetail.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'userDetail.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'userDetail.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'userDetail.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'userDetail.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="photo" title="${message(code: 'userDetail.photo.label', default: 'Photo')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userDetailInstanceList}" status="i" var="userDetailInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userDetailInstance.id}">${fieldValue(bean: userDetailInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: userDetailInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: userDetailInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: userDetailInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: userDetailInstance, field: "password")}</td>
					
						<td>${fieldValue(bean: userDetailInstance, field: "photo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userDetailInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
