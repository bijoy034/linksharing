<a href="#" class="close"></a>
<h3 class="widget-title"><span class="title-text ">Send Invitation</span></h3>

<g:form class="clearfix" useToken="true" action="#" method="post">
<p class="input-block">
    <label class="required">Email <span>*</span></label>
    <g:field type="email" name="name" class="form-input" value=""></g:field>
</p>

<p class="input-block clearfix">
    <label class="required">Topic <span>*</span></label>
    <select name="visibility" class="form-input">
        <option>Topic 1</option>
        <option>Topic 2</option>
    </select>
</p>
    <p class="contact-button clearfix">
        <input type="reset" class="form-input form-input-button" value="Cancel">
        <input type="submit" class="form-input form-input-button" value="Invite">
    </p>

    <div class="clear"></div>
</g:form>