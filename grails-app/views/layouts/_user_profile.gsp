
    <div class="tab-container-1">
        <ul>
         <g:each in="${users}" status="i" var="user">
            <li>
                <article class="entry-item clearfix">
                    <div class="entry-thumb"> <a href="#"><img src="${resource(dir: 'images/profile',file:"${user.username?:'user.png'}")}" style="width: 110px;" alt=""></a> </div>
                    <h4 class="entry-title">
                        <a href="#">${user.firstName+" "+user.lastName}</a>
                        <label style="color:#B2B2B2;">@${user.username}</label>
                    </h4>
                    <table >
                        <tr class="entry-content">
                            <td>Subscriptions</td>
                            <td>Post</td>
                        </tr>
                        <tr class="entry-content">
                            <td><a href="href">${user.subscription.size()}</a></td>
                            <td><a href="href">${user.resource.size()}</a></td>
                        </tr>
                    </table>

                </article>
            </li>
         </g:each>
        </ul>
    </div>
