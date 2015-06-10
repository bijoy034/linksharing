<h3 class="widget-title"><span class="title-line"></span><span class="title-text">User Login</span></h3>

<div class="list-container-3">
    <ul class="tabs-3 clearfix">
        <li class="active"><a href="#tab-3-1">Login</a></li>
        <li><a href="#tab-3-2">Registration</a></li>
        <li><a href="#tab-3-3">Password !!!</a></li>
    </ul><!--tabs-3-->
</div>

<div class="tab-container-3">
    <div class="tab-content-3" id="tab-3-1">
        <g:form useToken="true" class="clearfix log-form" controller="login" action="login" name="contact-form">
            <g:render template="/login/login_form"/>

            <p class="contact-button clearfix">
                <g:submitButton name="submit-contact" class="submit-btn" value="Login"/>
            </p>

            <div class="clear"></div>
        </g:form>
    </div><!--tab-content-3-->
    <div class="tab-content-3" id="tab-3-2">
        <g:uploadForm useToken="true" class="clearfix reg-form" controller="login" action="register" name="contact-form">
            <g:render template="/login/register_form"/>
            <p class="contact-button clearfix">
                <g:submitButton name="submit-contact" value="Register"/>
            </p>

            <div class="clear"></div>
        </g:uploadForm>
    </div><!--tab-content-3-->
    <div class="tab-content-3" id="tab-3-3">
        <g:uploadForm useToken="true" class="clearfix reg-form" controller="login" action="forgot" name="contact-form">
            <g:render template="/login/forgot_password_form"/>
            <p class="contact-button clearfix">
                <g:submitButton name="submit-contact" value="Get Password In Mail"/>
            </p>
            <div class="clear"></div>
        </g:uploadForm>
    </div><!--tab-content-3-->

</div>

<div id="response"></div>