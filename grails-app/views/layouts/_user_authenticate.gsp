<h3 class="widget-title"><span class="title-line"></span><span class="title-text">User Login</span></h3>
<g:if test="${flash.message}">
    <label class="message" role="status">${flash.message}</label>
</g:if>
<g:if test="${flash.error}">
    <label class="error">${flash.error}</label>
</g:if>
<g:hasErrors bean="${flash.get("error-msg")}" >
    <ul class="error" role="alert">
        <g:eachError bean="${flash.get("error-msg")}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                    error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<div class="list-container-3">
    <ul class="tabs-3 clearfix">
        <li class="active"><a href="#tab-3-1">Login</a></li>
        <li><a href="#tab-3-2">Registration</a></li>
    </ul><!--tabs-3-->
</div>

<div class="tab-container-3">
    <div class="tab-content-3" id="tab-3-1">
        <g:form useToken="true" class="clearfix log-form" controller="login" action="login" name="contact-form">
            <g:render template="login_form"/>

            <p class="contact-button clearfix">
                <g:submitButton name="submit-contact" class="submit-btn" value="Login"/>
            </p>

            <div class="clear"></div>
        </g:form>
    </div><!--tab-content-3-->
    <div class="tab-content-3" id="tab-3-2">
        <g:uploadForm useToken="true" class="clearfix reg-form" controller="login" action="register" name="contact-form">
            <g:render template="register_form"/>
            <p class="contact-button clearfix">
                <g:submitButton name="submit-contact" value="Register"/>
            </p>

            <div class="clear"></div>
        </g:uploadForm>
    </div><!--tab-content-3-->

</div>

<div id="response"></div>