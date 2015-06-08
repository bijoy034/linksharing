<%@page import="com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<g:if test="${posts.size() > 0}">
    <div class="sb-search sb-search-open" style="
    width: 40%;
    ">
        <form>
            <input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search">
            <input class="sb-search-submit" type="submit" value="">
            <span class="sb-icon-search"></span>
        </form>
    </div>
    </g:if>
<div class="tab-container-1">

    <g:if test="${posts.size() > 0}">
        <ul>
        <g:each in="${posts}" status="i" var="post">
            <li >
                <article class="entry-item clearfix">
                    <div class="entry-thumb" style="width: 10%;float: left;"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${post.createdBy.photo?:'user.png'}")}" alt=""/></a> </div>
                    <div class="entry-content" style="width: 80%;float:left;">
                        <h4 class="entry-title">
                            <a href="#">${post.createdBy.firstName+" "+post.createdBy.lastName}</a>
                            <label style="color:#B2B2B2;display: inline;">@${post.createdBy.username}</label>
                            <label style="color:#B2B2B2;display: inline;"> / 5 mnt before</label>
                        </h4>
                        <a href="#">${post.topic.name}</a>
                        <p class="entry-description">${post.description}</p>
                        <span class="entry-date">
                            <a href="#"><asset:image src="placeholders/facebook-icon.png" alt="" /></a>
                            <a href="#"><asset:image src="placeholders/Linkedin.png" alt="" /></a>
                            <a href="#"><asset:image src="placeholders/googleplus.png" alt="" /></a>
                            <div class="modify">
                                <g:link controller="resource" action="show" id="${post.id}">View post</g:link>
                                <g:if test="${!post.readingItem*.userDetail.id.contains(session.user?.id)}">
                                    <a href="#">Mark as read</a>
                                </g:if>
                                <%
                                    LinkShare link = LinkShare.get(post.id)
                                    DocumentResource doc = DocumentResource.get(post.id)
                                %>
                                <g:if test="${link}">
                                    <a href="${link.url}" target="_blank">View full site</a>
                                </g:if>
                                <g:elseif test="${doc}">
                                    <g:link controller="documentResource" action="downloadDoc" id="${post.id}" target="_blank">Download</g:link>
                                </g:elseif>
                            </div>
                        </span>
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