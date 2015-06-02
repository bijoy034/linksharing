<%@ page import="com.linksharing.Topic" %>



<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="topic.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${topicInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'visibility', 'error')} required">
	<label for="visibility">
		<g:message code="topic.visibility.label" default="Visibility" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="visibility" from="${com.linksharing.Visibility?.values()}" keys="${com.linksharing.Visibility.values()*.name()}" required="" value="${topicInstance?.visibility?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="topic.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${topicInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'resource', 'error')} ">
	<label for="resource">
		<g:message code="topic.resource.label" default="Resource" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topicInstance?.resource?}" var="r">
    <li><g:link controller="resource" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resource" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resource.label', default: 'Resource')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: topicInstance, field: 'subscription', 'error')} ">
	<label for="subscription">
		<g:message code="topic.subscription.label" default="Subscription" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${topicInstance?.subscription?}" var="s">
    <li><g:link controller="subscription" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="subscription" action="create" params="['topic.id': topicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'subscription.label', default: 'Subscription')])}</g:link>
</li>
</ul>


</div>

