<%@ page import="com.linksharing.UserDetail" %>


<p class="input-block ">
    <label class="required" for="loginid">
        <g:message code="userDetail.email.label" default="Email / Username" />
        <span>*</span>
    </label>
    <g:textField name="loginid" required="required" class="form-input"/>
</p>

<p class="input-block ">
    <label class="required" for="password">
        <g:message code="userDetail.password.label" default="Password" />
        <span>*</span>
    </label>
    <g:field type="password" name="password" required="required"  class="form-input"/>

</p>
