<%@ page import="com.linksharing.ReadingItem" %>



<div class="fieldcontain ${hasErrors(bean: readingItemInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="readingItem.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${com.linksharing.Resource.list()}" optionKey="id" required="" value="${readingItemInstance?.resource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: readingItemInstance, field: 'userDetail', 'error')} required">
	<label for="userDetail">
		<g:message code="readingItem.userDetail.label" default="User Detail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userDetail" name="userDetail.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${readingItemInstance?.userDetail?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: readingItemInstance, field: 'isRead', 'error')} ">
	<label for="isRead">
		<g:message code="readingItem.isRead.label" default="Is Read" />
		
	</label>
	<g:checkBox name="isRead" value="${readingItemInstance?.isRead}" />

</div>

