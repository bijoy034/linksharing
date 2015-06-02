<%@ page import="com.linksharing.ResourceRating" %>



<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="resourceRating.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${com.linksharing.Resource.list()}" optionKey="id" required="" value="${resourceRatingInstance?.resource?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'userDetail', 'error')} required">
	<label for="userDetail">
		<g:message code="resourceRating.userDetail.label" default="User Detail" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="userDetail" name="userDetail.id" from="${com.linksharing.UserDetail.list()}" optionKey="id" required="" value="${resourceRatingInstance?.userDetail?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: resourceRatingInstance, field: 'score', 'error')} required">
	<label for="score">
		<g:message code="resourceRating.score.label" default="Score" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="score" type="number" value="${resourceRatingInstance.score}" required=""/>

</div>

