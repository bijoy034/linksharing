<%@ page import="com.linksharing.Topic" %>

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
<g:select  name="visibility" from="${com.linksharing.Visibility}" required="required"  class="form-input"></g:select>
</p>