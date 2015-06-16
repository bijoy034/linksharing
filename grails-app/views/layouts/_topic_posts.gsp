<%@page import="com.linksharing.LinkShare;com.linksharing.DocumentResource" %>
<g:if test="${posts.size() > 0}">
    <div class="sb-search sb-search-open" style=" width: 40%;margin-top: -11px">
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