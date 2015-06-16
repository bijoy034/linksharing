
<div class="tab-container-1">
    <g:if test="${topicSubscription.size() > 0}">
        <g:if test="${topicSubscription.size() == 5}">
            <g:link controller="subscription" action="list" class="view-all">View All</g:link>
            </g:if>
        <ul>
            <g:each in="${topicSubscription}" status="i" var="subscribe">
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
                                <c:updateTopicForm  topic="${subscribe.topic}" user="${session.user}"/>
                                <tr class="entry-content">
                                    <th colspan="2" style="color: #B2B2B2;">@${subscribe.topic.createdBy.username}</th>
                                    <th>Subscriptions</th>
                                    <th>Post</th>
                                </tr>
                                <tr class="entry-content">
                                    <td colspan="2">
                                        <c:subscribeLink topic="${subscribe.topic}" user="${session.user}" />
                                    </td>
                                    <td><a href="href">${subscribe.topic.subscription.size()}</a></td>
                                    <td><a href="href">${subscribe.topic.resource.size()}</a></td>
                                </tr>

                            </table>
                        </div>
                        <c:selectUserVisibility  topic="${subscribe.topic}" user="${session.user}"/>
                        <c:selectSubscriptionSeriousness  topic="${subscribe.topic}" user="${session.user}"/>

                        <div class="edit">
                        <g:remoteLink controller="ajax" action="inlineInvite" update="actionBody" id="${subscribe.topic.id}" title="Send Invitation" >
                            <asset:image src="placeholders/email-icon.png" class="modal-form" alt="" />
                        </g:remoteLink>
                        <c:updateTopicLink  topic="${subscribe.topic}" user="${session.user}"/>
                        </div>
                        <div id="${i}${i}"></div>
                    </article>
                </g:form>
                </li>
            </g:each>
        </ul>
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