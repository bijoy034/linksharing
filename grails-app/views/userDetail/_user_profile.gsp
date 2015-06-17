
    <div class="tab-container-1">
        <ul>
         <g:each in="${users}" status="i" var="user">
            <li>
                <article class="entry-item clearfix">
                    <div class="entry-thumb" style="width:29%;;"> <g:link uri="/user/${user?.id}"><img src="${resource(dir: 'images/profile',file:"${user.photo?:'user.png'}")}" style="  width: 100% !important;" alt=""></g:link> </div>
                    <h4 class="entry-title">
                        <a href="#">${user.firstName+" "+user.lastName}</a>
                        <label style="color:#B2B2B2;">@${user.username}</label>
                    </h4>
                    <table >
                        <tr class="entry-content">
                            <td style="text-align: center;">Subscriptions</td>
                            <td style="text-align: center;">Topic</td>
                            <td style="text-align: center;">Post</td>
                        </tr>
                        <tr class="entry-content">
                            <td style="text-align: center;"><a href="href" class="count">${user.subscription.size()}</a></td>
                            <td style="text-align: center;"><a href="href" class="count">${user.topic.size()}</a></td>
                            <td style="text-align: center;"><a href="href" class="count">${user.resource.size()}</a></td>
                        </tr>
                    </table>

                </article>
            </li>
         </g:each>
        </ul>
    </div>
