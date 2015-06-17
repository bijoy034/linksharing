<%@page import="com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<div id="topicPost">
    <div class="tab-container-1" >

    <g:if test="${posts.size() > 0}">
        <ul>
        <g:each in="${posts}" status="i" var="post">
            <li>
                <article class="entry-item clearfix" >
                    <div class="entry-content" >
                        <c:viewResource resource="${post}"/>
                        <c:editViewOption post="${post}" user="${session.user}" />
                        <c:resourceCreatedByDetail resource="${post}"/>
                        <c:sharingOptions />
                        <c:ratingOption resource="${post}" user="${session?.user}" />
                    </div>
                </article>
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
</div>
</div>