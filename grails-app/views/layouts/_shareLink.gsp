<%@ page import="com.linksharing.UserDetail; com.linksharing.LinkShare;com.linksharing.Topic" %>
<p class="input-block">
    <label class="required" for="url">
        <g:message code="linkShare.url.label" default="url" />
        <span>*</span>
    </label>
    <g:field type="url" name="url" class="form-input ${hasErrors(bean: linkShareInstance, field: 'description','error')}" required="required" value=""/>
</p>

<p class="input-block clearfix ">
   <label class="required" for="description">
        <g:message code="linkShare.description.label" default="Description" />
        <span>*</span>
    </label>
    <g:textArea name="description" class="form-input ${hasErrors(bean: linkShareInstance, field: 'description','error')}" required="required" style="height: 100px !important;"/>
</p>
<p class="input-block clearfix ">
    <label class="required" for="topic">
        <g:message code="linkShare.topic.label" default="Topic" />
            <span>*</span>
    </label>
    <g:select id="topic"  name="topic.id" required="required" from="${Topic.findAllByCreatedBy(UserDetail.load(session.user?.id),[sort:'name'])}" optionKey="id" optionValue="name"  class="form-input ${hasErrors(bean: linkShareInstance, field: 'topic','error')}"></g:select>
</p>
<g:field type="hidden" id="createdBy" name="createdBy.id"  value="${session.user?.id}"/>
