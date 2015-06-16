<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js" xmlns="http://www.w3.org/1999/html"><!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>LinkSharing :: <g:layoutTitle default="Home"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="css/bootstrap.css"/>
    <asset:stylesheet src="css/theme-options.css"/>
    <asset:stylesheet src="css/style.css"/>
    <asset:stylesheet src="css/bootstrap-responsive.css"/>
    <asset:stylesheet src="css/responsive.css"/>
    <asset:stylesheet src="css/coban.css"/>
    <asset:stylesheet src="css/rating.css"/>

    <asset:javascript src="js/modernizr.custom.js"/>

    <g:layoutHead/>

</head>

<body>

<div class="kopa-pattern"></div>


<div class="wrapper kopa-shadow">

    <div class="row-fluid">

        <div class="span12 clearfix">

            <header id="page-header">

                <div id="header-top" class="clearfix">

                    <div class="social-search-box">

                        <div class="sb-search-wrapper">
                            <div id="sb-search" class="sb-search">
                                <form>
                                    <input class="sb-search-input" placeholder="Enter your search term..." type="text"
                                           value="" name="search" id="search">
                                    <input class="sb-search-submit" type="submit" value="">
                                    <span class="sb-icon-search"></span>
                                </form>
                            </div><!--sb-search-->
                        </div><!--sb-search-wrapper-->

                    </div><!--social-search-box-->

                </div><!--header-top-->

                <div id="header-middle" class="clearfix">

                    <div id="logo-image">
                        <a href="${createLink(uri: '/')}"><asset:image src="placeholders/logo.png" alt=""
                                                                       style="height: 58px"/></a>
                    </div><!--logo-image-->

                   <g:if test="${session.user}">
                    <div class="top-banner">

                        <nav id="main-nav">

                            <ul id="main-menu" class="clearfix">
                                <li>
                                    <a href="#" ><asset:image src="placeholders/comment.png" alt=""/></a><span></span>
                                    <ul>
                                        <li>
                       <g:remoteLink controller="ajax" action="addTopic" update="actionBody" title="Add topic" >
                                                <label class="modal-form" style="font-size: 20px;">AddTopic</label>
                       </g:remoteLink>
                                        </li>
                                        <li><g:link controller="topic" action="list">List&nbsp;Topics</g:link></li>
                                    </ul>
                                </li>
                                <li>
                                    <g:remoteLink controller="ajax" action="invite" update="actionBody" title="Send Invitation" >
                                        <asset:image src="placeholders/inbox.png" class="modal-form" style=" height:50px;" alt=""/>
                                    </g:remoteLink><span></span>
                                </li>
                                <li>
                                    <g:remoteLink controller="ajax" action="shareLink" update="actionBody" title="Share Link" >
                                        <asset:image src="placeholders/link.png" class="modal-form" alt=""/>
                                    </g:remoteLink><span></span>
                                </li>
                                <li>
                                    <g:remoteLink controller="ajax" action="shareDoc" update="actionBody" title="Add File" >
                                        <asset:image src="placeholders/file.png" class="modal-form" alt=""/>
                                    </g:remoteLink><span></span>
                                </li>
                                <li>
                                    <a href="#"><img src="${resource(dir: 'images/profile',file:"${session.user?.photo?:'user.png'}")}" alt="" style="box-shadow: 0 0 8px rgba(231, 231, 231, 1);"/></a><span></span>
                                    <ul>
                                        <li><a href="gallery.html">Profile</a></li>
                                        <li><a href="video.html">Users</a></li>
                                        <li><a href="elements.html">Topics</a></li>
                                        <li><a href="404.html">Posts</a></li>
                                        <li><g:link controller="login" action="logout">Logout</g:link></li>
                                    </ul>
                                </li>

                            </ul><!--main-menu-->

                        </nav>

                    </div><!--top-banner-->
                    </g:if>

                </div><!--header-middle-->

            <!-- header-bottom-->

            </header><!--page-header-->
            <div id="main-content">
            <g:if test="${flash.message}">
                <label class="message" role="status">${flash.message}</label>
            </g:if>
            <g:if test="${flash.error}">
                <label class="error">${flash.error}</label>
            </g:if>
            <g:hasErrors bean="${flash.get("error-msg")}">
                <ul class="error" role="alert">
                    <g:eachError bean="${flash.get("error-msg")}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
        <g:layoutBody/>
            </div>
        <!--bottom-sidebar-->

            <footer id="page-footer">
                <nav id="footer-nav">
                    <ul id="footer-menu" class="clearfix">
                        <li><a href="http://www.intelligrape.com" target="_blank">LinkSharing.</a></li>
                    </ul><!--footer-menu-->
                </nav><!--footer-nav-->
            </footer><!--page-footer-->

            <p id="back-top">
                <a href="#top">Back to Top</a>
            </p>

        </div><!--span12-->

    </div><!--row-fluid-->

</div><!--wrapper-->
<g:if test="${session.user}">
<div class="modal-overlay"></div>


<div class="bg-image">

    <div id="actionBody">
        <asset:image src="spinner.gif" class="spinner"/>
    </div>


</div>
</g:if>
<g:javascript base="/linksharing/plugins/jquery-1.11.0.2/js/jquery" library="/jquery-1.11.0.min"/>
<asset:javascript src="js/superfish.js"/>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="js/query.carouFredSel-6.0.4-packed.js"/>
<asset:javascript src="js/classie.js"/>
<asset:javascript src="js/uisearch.js"/>
<asset:javascript src="js/jquery.validate.min.js"/>
<asset:javascript src="js/custom.js"/>
<asset:javascript src="js/ajax.js"/>

<script>
    new UISearch(document.getElementById('sb-search'));
</script>

</body>

</html>


