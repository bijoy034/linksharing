
        <ul>
<g:each in="${topicList}" status="i" var="topic">
            <li>
                <article class="entry-item clearfix">
                    <div class="entry-thumb" style="width:10%;float: left;">
                        <a href="#">
                            <img src="${resource(dir: 'images/profile',file:"${topic.createdBy.photo?:'user.png'}")}" alt="" />
                        </a>
                    </div>
                    <div class="entry-content" style="width:80%;float: left">
                        <p class="entry-description">${topic.name}</p>
                        <p class="entry-description">
                            <span class="entry-date" style="float: right;">
                                <g:formatDate format="MMMM dd, yyyy" date="${topic.dateCreated}"/>
                            </span>
                        </p>
                        <p class="entry-description">
                            Subscription : <a href="#">${topic.subscription.size()}</a>&nbsp;&nbsp;Posts : <a href="#">${topic.resource.size()}</a>
                        </p>
                        <p class="entry-description" style="text-align: right">
                            <b>${topic.createdBy.firstName+" "+topic.createdBy.lastName}</b>
                            /
                            <i>@${topic.createdBy.username}</i>
                        </p>

                        <span class="entry-date">
                            <a href="#"><asset:image src="placeholders/facebook-icon.png"/></a>
                            <a href="#"><asset:image src="placeholders/Linkedin.png" alt=""/></a>
                            <a href="#"><asset:image src="placeholders/googleplus.png" alt=""/></a>

                            <div class="modify">
                                <g:link controller="topic" action="show" id="${topic.id}">View Posts</g:link>
                            </div>
                        </span>
                    </div>
                </article>
            </li>
</g:each>
        </ul>
