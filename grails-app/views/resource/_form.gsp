<%@ page import="com.linksharing.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="resource.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${resourceInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="resource.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${resourceInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="resource.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${resourceInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="resource.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${resourceInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'readingItem', 'error')} ">
	<label for="readingItem">
		<g:message code="resource.readingItem.label" default="Reading Item" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${resourceInstance?.readingItem?}" var="r">
    <li><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="readingItem" action="create" params="['resource.id': resourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'readingItem.label', default: 'ReadingItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'resourceRating', 'error')} ">
	<label for="resourceRating">
		<g:message code="resource.resourceRating.label" default="Resource Rating" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${resourceInstance?.resourceRating?}" var="r">
    <li><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resourceRating" action="create" params="['resource.id': resourceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resourceRating.label', default: 'ResourceRating')])}</g:link>
</li>
</ul>


</div>

