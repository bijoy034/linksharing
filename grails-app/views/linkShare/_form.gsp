<%@ page import="com.linksharing.LinkShare" %>



<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="linkShare.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="title" required="" value="${linkShareInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="linkShare.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" required="" value="${linkShareInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="linkShare.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="createdBy" name="createdBy.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${linkShareInstance?.createdBy?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="linkShare.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${linkShareInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'url', 'error')} required">
	<label for="url">
		<g:message code="linkShare.url.label" default="Url" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="url" name="url" required="" value="${linkShareInstance?.url}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'readingItem', 'error')} ">
	<label for="readingItem">
		<g:message code="linkShare.readingItem.label" default="Reading Item" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${linkShareInstance?.readingItem?}" var="r">
    <li><g:link controller="readingItem" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="readingItem" action="create" params="['linkShare.id': linkShareInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'readingItem.label', default: 'ReadingItem')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: linkShareInstance, field: 'resourceRating', 'error')} ">
	<label for="resourceRating">
		<g:message code="linkShare.resourceRating.label" default="Resource Rating" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${linkShareInstance?.resourceRating?}" var="r">
    <li><g:link controller="resourceRating" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="resourceRating" action="create" params="['linkShare.id': linkShareInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'resourceRating.label', default: 'ResourceRating')])}</g:link>
</li>
</ul>


</div>

