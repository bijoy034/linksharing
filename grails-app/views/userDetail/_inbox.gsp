<%@page import="com.linksharing.UserDetail; com.linksharing.Subscription; com.linksharing.Topic; com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<g:if test="${posts.size() > 0}">
    <div class="sb-search sb-search-open" style=" width: 40%;margin-top: -11px ">
        <form>
            <input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search">
            <input class="sb-search-submit" type="submit" value="">
            <span class="sb-icon-search"></span>
        </form>
    </div>
</g:if>
<div class="tab-container-1" style="  margin-top: 48px;">

    <g:if test="${posts.size() > 0}">
        <ul>
            <g:each in="${posts}" status="i" var="post">
                <%
                   /* Topic topic = post[1]
                    UserDetail userDetail = post[3]*/
                %>
               %{-- <li >
                    <article class="entry-item clearfix">
                        <div class="entry-thumb" style="width: 10%;float: left;"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${userDetail.photo?:'user.png'}")}" alt=""/></a> </div>
                        <div class="entry-content" style="width: 80%;float:left;">
                            <h4 class="entry-title">
                                <a href="#">${userDetail.firstName+" "+userDetail.lastName}</a>
                                <label style="color:#B2B2B2;display: inline;">@${userDetail.username}</label>
                                <label style="color:#B2B2B2;display: inline;">
                                    <c:postTime post="${post[0]}" format="MMMM dd, yyyy"/>
                                </label>
                            </h4>
                            <a href="#">${topic.name}</a>
                            <p class="entry-description">${post[0].description}</p>
                            <span class="entry-date">
                                <a href="#"><asset:image src="placeholders/facebook-icon.png" alt="" /></a>
                                <a href="#"><asset:image src="placeholders/Linkedin.png" alt="" /></a>
                                <a href="#"><asset:image src="placeholders/googleplus.png" alt="" /></a>
                                <div class="modify">
                                    <c:resourceFooter post="${post[0]}" user="${session.user}"/>
                                </div>
                            </span>
                        </div>
                    </article>
                </li>--}%
                <li>
                    <article class="entry-item clearfix" >
                        <div class="entry-content" >
                            <c:viewResource resource="${post[0]}"/>
                            <c:editViewOption post="${post[0]}" user="${session.user}"/>
                            <c:resourceCreatedByDetail resource="${post[0]}"/>
                            <c:sharingOptions />
                            <c:ratingOption resource="${post[0]}" user="${session?.user}" />
                        </div>
                    </article>
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
</div>