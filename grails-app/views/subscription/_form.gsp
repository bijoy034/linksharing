<%@ page import="com.linksharing.Subscription" %>



<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="subscription.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="topic" name="topic.id" from="${com.linksharing.Topic.list()}" optionKey="id" required="" value="${subscriptionInstance?.topic?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'userDetail', 'error')} required">
	<label for="userDetail">
		<g:message code="subscription.userDetail.label" default="User Detail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userDetail" name="userDetail.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${subscriptionInstance?.userDetail?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subscriptionInstance, field: 'seriousness', 'error')} required">
	<label for="seriousness">
		<g:message code="subscription.seriousness.label" default="Seriousness" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="seriousness" from="${com.linksharing.Seriousness?.values()}" keys="${com.linksharing.Seriousness.values()*.name()}" required="" value="${subscriptionInstance?.seriousness?.name()}" />

</div>

