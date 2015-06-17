
        <ul style="padding-bottom: 20px;">
<g:each in="${topicList}" status="i" var="topic">
            <li>
                <article class="entry-item clearfix">
                    <table style="width: 100%;">
                        <tr class="entry-content show-text" style="height: 40px">
                            <td style="font-size: 20px;text-align: left;" colspan="2">
                                <g:link controller="topic" action="show" id="${topic.id}">${topic.name}</g:link>
                                <br>
                                <label style="color: #B2B2B2;display: block;width: 100%;text-align: right;">
                                    <b style="border-bottom:1px solid #CCC;">&nbsp;&nbsp;Creation Date&nbsp;&nbsp;</b>
                                    <br>
                                    <asset:image src="placeholders/clock.png"/>
                                    <g:formatDate format="MMMM dd, yyyy" date="${topic.dateCreated}"/>
                                    &nbsp;
                                </label>
                            </td>
                        </tr>
                        <c:updateTopicForm  topic="${topic}" user="${session.user}"/>
                        <tr class="entry-content">
                            <td>
                                Subscriptions : <a href="href">${topic.subscription.size()}</a>
                                Post : <a href="href">${topic.resource.size()}</a>
                            </td>
                            <td style="text-align: right;">
                                <c:subscribeLink topic="${topic}" user="${session.user}" />
                            </td>
                        </tr>
                    </table>
                    <c:topicCreatedByDetail topic="${topic}"/>
                    <c:sharingOptions />
                </article>
            </li>
</g:each>
        </ul>
