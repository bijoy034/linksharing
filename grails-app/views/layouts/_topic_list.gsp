<%@ page import="com.linksharing.Seriousness" %>

<div class="tab-container-1">
    <g:if test="${topicList?.size() > 0}">
    <ul>
<g:each in="${topicList}" status="i" var="topic">
        <li>
    <g:form name="form${i}" url="[controller: 'subscription', action: 'update']"   class="edit-subscription">

                    <article class="entry-item clearfix">
                        <div class="entry-thumb"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${topic.createdBy.photo?:'user.png'}")}" alt="" /></a> </div>
                        <div style="width: 75%;float: left;">
                            <table >
                            <tr class="entry-content show-text">
                                <th colspan="4" style="text-align: left;  padding-left: 12px;">
                                    <g:link controller="topic" action="list" id="${topic.id}">${topic.name}</g:link>
                                </th>
                            </tr>
                            <c:updateTopicForm  topic="${topic}" user="${session.user}"/>

                            <tr class="entry-content">
                                <th colspan="2" style="color: #B2B2B2;">@${topic.createdBy.username}</th>
                                <th>Subscriptions</th>
                                <th>Post</th> 
                            </tr>

                            <tr class="entry-content">
                                <td colspan="2">
                                    <c:subscribeLink topic="${topic}" user="${session.user}" />
                                </td>
                                <td><a href="#">${topic.subscription.size()}</a></td>
                                <td><a href="#">${topic.resource.size()}</a></td>
                            </tr>

                        </table>
                        </div>

                        <c:selectUserVisibility  topic="${topic}" user="${session.user}"/>
                        <c:selectSubscriptionSeriousness  topic="${topic}" user="${session.user}"/>

                        <div class="edit">
                        <g:remoteLink controller="ajax" action="inlineInvite" update="actionBody" id="${topic.id}" title="Send Invitation" >
                            <asset:image src="placeholders/email-icon.png" class="modal-form" alt="" />
                        </g:remoteLink>
                            <c:updateTopicLink  topic="${topic}" user="${session.user}"/>
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