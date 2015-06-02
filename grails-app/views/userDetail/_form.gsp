<%@ page import="com.linksharing.UserDetail" %>



<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="userDetail.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userDetailInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="userDetail.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userDetailInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="userDetail.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="password" required="" value="${userDetailInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="userDetail.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${userDetailInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="userDetail.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${userDetailInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'photo', 'error')} required">
	<label for="photo">
		<g:message code="userDetail.photo.label" default="Photo" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="photo" name="photo" />

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'admin', 'error')} ">
	<label for="admin">
		<g:message code="userDetail.admin.label" default="Admin" />
		
	</label>
	<g:checkBox name="admin" value="${userDetailInstance?.admin}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'active', 'error')} ">
	<label for="active">
		<g:message code="userDetail.active.label" default="Active" />
		
	</label>
	<g:checkBox name="active" value="${userDetailInstance?.active}" />

</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'readingItem', 'error')} ">
	<label for="readingItem">
		<g:message code="userDetail.readingItem.label" default="Reading Item" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDetailInstance?.readingItem?}" var="r">
    <li><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="readingItem" action="create" params="['userDetail.id': userDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'readingItem.label', default: 'ReadingItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'resource', 'error')} ">
	<label for="resource">
		<g:message code="userDetail.resource.label" default="Resource" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDetailInstance?.resource?}" var="r">
    <li><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resource" action="create" params="['userDetail.id': userDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resource.label', default: 'Resource')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'resourceRating', 'error')} ">
	<label for="resourceRating">
		<g:message code="userDetail.resourceRating.label" default="Resource Rating" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDetailInstance?.resourceRating?}" var="r">
    <li><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resourceRating" action="create" params="['userDetail.id': userDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resourceRating.label', default: 'ResourceRating')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'subscription', 'error')} ">
	<label for="subscription">
		<g:message code="userDetail.subscription.label" default="Subscription" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDetailInstance?.subscription?}" var="s">
    <li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscription" action="create" params="['userDetail.id': userDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userDetailInstance, field: 'topic', 'error')} ">
	<label for="topic">
		<g:message code="userDetail.topic.label" default="Topic" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userDetailInstance?.topic?}" var="t">
    <li><g:link controller="topic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="topic" action="create" params="['userDetail.id': userDetailInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'topic.label', default: 'Topic')])}</g:link>
</li>
</ul>


</div>

