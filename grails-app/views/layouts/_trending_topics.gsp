<h3 class="widget-title"><span class="title-line"></span><span class="title-text">Trending Topics</span></h3>
<div class="list-container-1">
    <ul class="tabs-1 clearfix">
        <li class="active"><a href="#tab-1-1">Today</a></li>
        <li><a href="#tab-1-2">Week</a></li>
        <li><a href="#tab-1-3">Month</a></li>
        <li><a href="#tab-1-4">Year</a></li>
    </ul><!--tabs-1-->
</div>

<div class="tab-container-1">
    <div class="tab-content-1" id="tab-1-1" style="display: block;">

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

    </div><!--tab-content-1-->

</div><!--tab-container-1-->