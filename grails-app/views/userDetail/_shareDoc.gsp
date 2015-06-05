<%@ page import="com.linksharing.DocumentResource" %>
<p class="input-block">
    <label class="required">Document <span>*</span></label>
    <input type="file" name="name" class="form-input" value="">
</p>

<p class="input-block clearfix">
    <label class="required">Description <span>*</span></label>
    <textarea name="name" class="form-input" style="height: 100px !important;"></textarea>
</p>

<p class="input-block clearfix">
    <label class="required">Topic <span>*</span></label>
    <select name="visibility" class="form-input">
        <option>Topic 1</option>
        <option>Topic 2</option>
    </select>
</p>