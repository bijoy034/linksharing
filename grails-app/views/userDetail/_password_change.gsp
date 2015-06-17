<g:uploadForm useToken="true" class="clearfix reg-form" controller="userDetail" action="updatePassword" name="contact-form">

    <p class="input-block">
        <label class="required " for="password">
            <g:message code="userDetail.password.label" default="Password"/>
            <span>*</span>
        </label>
        <g:field type="password" name="password" required="required" class="form-input ${hasErrors(bean: flash.get("error-msg-pw"), field: 'password', 'error')}" value="${flash.get("error-msg-pw")?.password}"/>
    </p>

    <p class="input-block ">
        <label class="required" for="confirmPassword">
            <g:message code="userDetail.password.label" default="Confirm Password" />
            <span>*</span>
        </label>
        <g:field type="password" name="confirmPassword" required="required" class="form-input  ${hasErrors(bean: flash.get("error-msg-pw"), field: 'confirmPassword', 'error')}" value="${flash.get("error-msg-pw")?.confirmPassword}"/>
    </p>
    <g:hiddenField name="userId" value="${session.user.id}"/>

    <p class="contact-button clearfix">
        <g:submitButton name="submit-contact" value="Change Password"/>
    </p>

    <div class="clear"></div>
</g:uploadForm>