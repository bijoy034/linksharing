
<div class="tab-container-1">
    <g:if test="${topic_subscription.size() > 0}">
    <ul>
<g:each in="${topic_subscription}" status="i" var="subscribe">
        <li>
            -<g:form name="form${i}" controller="subscription" action="update"  class="edit-subscription">

                    <article class="entry-item clearfix">
                        <div class="entry-thumb"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${subscribe.topic.createdBy.photo?:'user.png'}")}" alt="" /></a> </div>
                        <div style="width: 75%;float: left;">
                            <table >
                            <tr class="entry-content show-text">
                                <th colspan="4" style="text-align: left;  padding-left: 12px;">
                                    <g:link controller="subscription" action="list" id="${subscribe.topic.id}">${subscribe.topic.name}</g:link>
                                </th>
                            </tr>
                            <g:if test="${subscribe.topic.createdBy.id == session.user?.id}">
                                <tr class="entry-content edit-text" style="display: none;">
                                    <th colspan="2"><g:textField name="topic.name" value="${subscribe.topic.name}"/> </th>
                                    <th><g:submitButton name="editTopic" value="Save" class="form-input-button-blue"/></th>
                                    <th><input type="reset" value="Cancel" class="form-input-button-blue"/></th>
                                </tr>
                            </g:if>
                            <tr class="entry-content">
                                <th colspan="2" style="color: #B2B2B2;">@${subscribe.topic.createdBy.username}</th>
                                <th>Subscriptions</th>
                                <th>Post</th> 
                            </tr>
                            <tr class="entry-content">
                                <td colspan="2">
                                    <g:if test="${subscribe.topic.createdBy.id != session.user?.id}">
                                        <g:if test="${subscribe.userDetail.id == session.user?.id}">
                                            <g:link controller="subscription" action="remove" params="['topic_id':subscribe.topic.id]">Unsubscribe</g:link>
                                        </g:if>
                                        <g:else>
                                            <g:link controller="subscription" action="save" params="['topic_id':subscribe.topic.id]">Subscribe</g:link>
                                        </g:else>
                                    </g:if>
                                </td>
                                <td><a href="href">${subscribe.topic.subscription.size()}</a></td>
                                <td><a href="href">${subscribe.topic.resource.size()}</a></td>
                            </tr>

                        </table>
                        </div>
                        <g:if test="${subscribe.topic.createdBy.id == session.user?.id}">
                            <g:select class="select"  name="topic.visibility" from="${com.linksharing.Visibility}" value="${subscribe.topic.visibility}" required="required"></g:select>
                        </g:if>
                        <g:field type="hidden" name="id" value="${subscribe.id}" />
                        <g:select class="select" name="seriousness" from="${com.linksharing.Seriousness}" value="${subscribe.seriousness}" required="required"></g:select>


                        <div class="edit">
                            <a href="#" class="invite"><asset:image src="placeholders/email-icon.png" class="modal-form" alt="" /></a>
                        <g:if test="${subscribe.topic.createdBy.id == session.user?.id}">
                            <a href="#" class="edit-topic"><asset:image src="placeholders/editor.png" alt="" /></a>
                            <a href="#"><asset:image src="placeholders/trash.png" alt="" /></a>
                        </g:if>
                        </div>
                        <div id="${i}${i}"></div>
                    </article>
            </g:form>
        </li>
</g:each>
    </ul>
        <div class="pagination kopa-comment-pagination">
            <g:paginate total="${count ?: 0}" />
        </div>
    </g:if>
    <g:else>
        <ul>
            <li>
                <article class="entry-item clearfix">
                    <h3 style="color:#e03d3d ;">No Record found</h3 >
                </article>
            </li>
        </ul>
    </g:else>
</div><!--tab-container-1-->