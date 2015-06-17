<g:uploadForm useToken="true" class="clearfix reg-form" controller="userDetail" action="updateProfile" name="contact-form">

    <p class="input-block">
        <label class="required " for="firstName">
            <g:message code="userDetail.firstName.label" default="First Name"/>
            <span>*</span>
        </label>
        <g:textField name="firstName" required="required" class="form-input  ${hasErrors(bean: flash.get("error-msg"), field: 'firstName', 'error')}" value="${flash.get("error-msg")?flash.get("error-msg")?.firstName:users[0].firstName}"/>
    </p>

    <p class="input-block ">
        <label class="required" for="lastName">
            <g:message code="userDetail.lastName.label" default="Last Name"/>
            <span>*</span>
        </label>
        <g:textField name="lastName" required="required" class="form-input ${hasErrors(bean: flash.get("error-msg"), field: 'lastName', 'error')}" value="${flash.get("error-msg")?flash.get("error-msg")?.lastName:users[0].lastName}"/>

    </p>

    <p class="input-block">
        <label class="required" for="username">
            <g:message code="userDetail.username.label" default="User Name"/>
            <span>*</span>
        </label>
        <g:textField name="username" required="required" class="form-input  ${hasErrors(bean: flash.get("error-msg"), field: 'username', 'error')}" value="${flash.get("error-msg")?flash.get("error-msg")?.username:users[0].username}"/>

    </p>
    <p class="input-block ">
        <label for="photo">
            <g:message code="userDetail.photo.label" default="Photo"/>
        </label>
        <g:field type="file" name="photo" class="form-input  ${hasErrors(bean: flash.get("error-msg"), field: 'photo', 'error')}"/>
    </p>
    <g:hiddenField name="userId" value="${session.user.id}"/>
    <p class="contact-button clearfix">
        <g:submitButton name="submit-contact" value="Update Profile"/>
    </p>

    <div class="clear"></div>
</g:uploadForm>