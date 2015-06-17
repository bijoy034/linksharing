<%@ page import="com.linksharing.UserDetail; com.linksharing.LinkShare;com.linksharing.Topic" %>
<a href="#" class="close"></a>
<h3 class="widget-title"><span class="title-text">Share Link</span></h3>

<g:form class="clearfix"  useToken="true" controller="resource" action="saveLink">
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
    <g:select id="topic"  name="topic.id" required="required" from="${topicList}"  optionKey="topicId" optionValue="topic"  class="form-input ${hasErrors(bean: linkShareInstance, field: 'topic','error')}"></g:select>
</p>
<g:field type="hidden" id="createdBy" name="createdBy.id"  value="${session.user?.id}"/>
    <p class="contact-button clearfix">
        <input type="reset" class="form-input form-input-button" value="Cancel"/>
        <g:submitButton name="shareLink" type="submit" class="form-input form-input-button" value="Share"/>
    </p>

    <div class="clear"></div>
</g:form>