<%@ page import="com.linksharing.Topic" %>
<a href="#" class="close"></a>
<h3 class="widget-title"><span class="title-text ">Create Topic</span></h3>

<g:form useToken="true" class="clearfix"  controller="subscription" action="saveTopic">
<p class="input-block ${hasErrors(bean: topicInstance, field: 'name','error')}">
    <label class="required" for="name">
        <g:message code="topic.name.label" default="Topic Name"/>
        <span>*</span></label>
    <g:textField type="text" name="name" class="form-input" value="" required="required"/>
</p>

<p class="input-block clearfix ${hasErrors(bean: topicInstance, field: 'visibility','error')}">
    <label class="required" for="visibility">
        <g:message code="topic.visibility.label" default="Visibility"/>
          <span>*</span></label>
<g:select  name="visibility" from="${visibility}" required="required"  class="form-input"></g:select>
</p>
<g:field type="hidden" id="createdBy" name="createdBy.id"  value="${session.user?.id}"/>
    <p class="contact-button clearfix">
        <input type="reset" class="form-input form-input-button" value="Cancel">
        <g:submitButton class="form-input form-input-button" value="Save" name="topicSave"/>
    </p>

    <div class="clear"></div>
</g:form>