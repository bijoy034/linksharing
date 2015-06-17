<%@ page import="com.linksharing.DocumentResource;com.linksharing.Topic;com.linksharing.UserDetail" %>
<a href="#" class="close"></a>
<h3 class="widget-title"><span class="title-text">Share Document</span></h3>

<g:uploadForm useToken="true" class="clearfix" controller="resource" action="saveDoc">
<p class="input-block ${hasErrors(bean: documentResourceInstance, field: 'filePath','error')}">
    <label class="required" for="filePath">
        <g:message code="linkShare.filePath.label" default="File" />
        <span>*</span>
    </label>
    <g:field type="file" name="filePath" required="required" class="form-input"/>
</p>

<p class="input-block clearfix ${hasErrors(bean: documentResourceInstance, field: 'description','error')}">
    <label class="required" for="description">
        <g:message code="linkShare.description.label" default="Description" />
        <span>*</span>
    </label>
    <g:textArea name="description" class="form-input" required="required" style="height: 100px !important;"/>
</p>
<p class="input-block clearfix ${hasErrors(bean: documentResourceInstance, field: 'topic','error')}">
    <label class="required" for="topic">
        <g:message code="linkShare.topic.label" default="Topic" />
        <span>*</span>
    </label>
    <g:select id="topic"  name="topic.id" from="${topicList}"   optionKey="topicId" optionValue="topic"  required="required"  class="form-input"></g:select>
</p>
<g:field type="hidden" id="createdBy" name="createdBy.id"  value="${session.user?.id}"/>
    <p class="contact-button clearfix">
        <input type="reset" class="form-input form-input-button" value="Cancel">
        <g:submitButton name="shareDoc" class="form-input form-input-button" value="Share"/>
    </p>

    <div class="clear"></div>
</g:uploadForm>