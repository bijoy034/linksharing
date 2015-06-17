
<div class="tab-container-1">
    <g:if test="${topic_subscription.size() > 0}">
    <ul>
<g:each in="${topic_subscription}" status="i" var="subscribe">
        <li style="margin: auto;"s>
            <g:form name="form${i}" controller="subscription" action="update"  class="edit-subscription">

            <article class="entry-item clearfix">
                <table style="width: 100%;">
                    <tr class="entry-content show-text" style="height: 40px">
                        <td style="font-size: 20px;text-align: left;" colspan="2">
                            <g:link controller="subscription" action="list" id="${subscribe.topic.id}">${subscribe.topic.name}</g:link>
                            <br>
                            <label style="color: #B2B2B2;display: block;width: 100%;text-align: right;">
                                <b style="border-bottom:1px solid #CCC;">Subscription Date</b>
                                <br>
                                <asset:image src="placeholders/clock.png"/>
                                <g:formatDate format="MMMM dd, yyyy" date="${subscribe.dateCreated}"/>
                                &nbsp;&nbsp;
                            </label>
                        </td>
                    </tr>
                    <c:updateTopicForm  topic="${subscribe.topic}" user="${session.user}"/>
                    <tr class="entry-content">
                        <td>
                            Subscriptions : <a href="href">${subscribe.topic.subscription.size()}</a>
                            Post : <a href="href">${subscribe.topic.resource.size()}</a>
                        </td>
                        <td style="text-align: right;">
                            <c:subscribeLink topic="${subscribe.topic}" user="${session.user}" />
                        </td>
                    </tr>
                </table>
                <c:topicCreatedByDetail topic="${subscribe.topic}"/>
                <div style="width: 100%; float: left;margin-top: 7px;">
                    <c:selectUserVisibility  topic="${subscribe.topic}" user="${session.user}"/>
                    <c:selectSubscriptionSeriousness  topic="${subscribe.topic}" user="${session.user}"/>
                    <c:updateTopicLink  topic="${subscribe.topic}" user="${session.user}"/>
                </div>

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