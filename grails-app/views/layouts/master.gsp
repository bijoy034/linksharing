<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
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

	<link href='http://fonts.googleapis.com/css?family=Rokkitt' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

	<asset:javascript src="js/modernizr.custom.js"/>

	<g:layoutHead/>

</head>

<body >

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
									<input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search" id="search">
									<input class="sb-search-submit" type="submit" value="">
									<span class="sb-icon-search"></span>
								</form>
							</div><!--sb-search-->
						</div><!--sb-search-wrapper-->

					</div><!--social-search-box-->

				</div><!--header-top-->

				<div id="header-middle" class="clearfix">

					<div id="logo-image">
						<a href="${createLink(uri: '/')}"><asset:image src="placeholders/logo.png" alt="" style="height: 58px" /></a>
					</div><!--logo-image-->

					<div class="top-banner">
						<!--<a href="#"><asset:image src="placeholders/comment.png" class="modal-form" alt="" /></a>
                        <a href="#"><asset:image src="placeholders/inbox.png"  class="modal-form" style=" height:45px;" alt="" /></a>
                        <a href="#"><asset:image src="placeholders/link.png"  class="modal-form" alt="" /></a>
                        <a href="#"><asset:image src="placeholders/file.png"  class="modal-form" alt="" /></a>
                        <a href="#"><asset:image src="placeholders/user.png"  alt="" /></a>-->


						<nav id="main-nav">

							<ul id="main-menu" class="clearfix">
								<li><a href="#" class="create-topic"><asset:image src="placeholders/comment.png" class="modal-form" alt="" /></a><span></span></li>
								<li><a href="#" class="invite"><asset:image src="placeholders/inbox.png"  class="modal-form" style=" height:50px;" alt="" /></a><span></span></li>
								<li><a href="#" class="share-link"><asset:image src="placeholders/link.png"  class="modal-form" alt="" /></a><span></span></li>
								<li><a href="#" class="share-document"><asset:image src="placeholders/file.png"  class="modal-form" alt="" /></a><span></span></li>
								<li>
									<a href="#"><asset:image src="placeholders/user.png"  alt="" /></a><span></span>
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

				</div><!--header-middle-->

			<!-- header-bottom-->

			</header><!--page-header-->

			<g:layoutBody/>

			<!--bottom-sidebar-->

			<footer id="page-footer">
				<nav id="footer-nav">
					<ul id="footer-menu" class="clearfix">
						<li><a href="http://www.intelligrape.com" target="_blank"> LinkSharing.</a></li>
					</ul><!--footer-menu-->
				</nav><!--footer-nav-->
			</footer><!--page-footer-->

			<p id="back-top">
				<a href="#top">Back to Top</a>
			</p>

		</div><!--span12-->

	</div><!--row-fluid-->

</div><!--wrapper-->

<div class="modal-overlay"></div>


<div class="bg-image">
	<a href="#" class="close"></a>
	<div class="create-topic-body" style="display: none">
		<h3 class="widget-title"><span class="title-text ">Create Topic</span></h3>
		<form class="clearfix" action="#" method="post" >

			<p class="input-block">
				<label class="required" >Topic Name <span>*</span></label>
				<input type="text" name="name" class="form-input" value="">
			</p>
			<p class="input-block clearfix">
				<label class="required" >Visibility <span>*</span></label>
				<select name="visibility" class="form-input" >
					<option>Public</option>
					<option>Private</option>
				</select>
			</p>
			<p class="contact-button clearfix">
				<input type="reset" class="form-input form-input-button" value="Cancel">
				<input type="submit" class="form-input form-input-button" value="Submit">
			</p>
			<div class="clear"></div>
		</form>
	</div>

	<div class="share-document-body" style="display: none">

		<h3 class="widget-title"><span class="title-text">Share Document</span></h3>
		<form class="clearfix" action="#" method="post" >

			<p class="input-block">
				<label class="required" >Document <span>*</span></label>
				<input type="file" name="name" class="form-input" value="">
			</p>
			<p class="input-block clearfix">
				<label class="required" >Description <span>*</span></label>
				<textarea name="name" class="form-input" style="height: 100px !important;"></textarea>
			</p>
			<p class="input-block clearfix">
				<label class="required" >Topic <span>*</span></label>
				<select name="visibility" class="form-input" >
					<option>Topic 1</option>
					<option>Topic 2</option>
				</select>
			</p>
			<p class="contact-button clearfix">
				<input type="reset" class="form-input form-input-button" value="Cancel">
				<input type="submit" class="form-input form-input-button" value="Share">
			</p>
			<div class="clear"></div>
		</form>
	</div>
	<div class="share-link-body" style="display: none">

		<h3 class="widget-title"><span class="title-text">Share Link</span></h3>
		<form class="clearfix" action="#" method="post" >

			<p class="input-block">
				<label class="required" >Link <span>*</span></label>
				<input type="url" name="name" class="form-input" value="">
			</p>
			<p class="input-block clearfix">
				<label class="required" >Description <span>*</span></label>
				<textarea name="name" class="form-input" style="height: 100px !important;"></textarea>
			</p>
			<p class="input-block clearfix">
				<label class="required" >Topic <span>*</span></label>
				<select name="visibility" class="form-input" >
					<option>Topic 1</option>
					<option>Topic 2</option>
				</select>
			</p>
			<p class="contact-button clearfix">
				<input type="reset" class="form-input form-input-button" value="Cancel">
				<input type="submit" class="form-input form-input-button" value="Share">
			</p>
			<div class="clear"></div>
		</form>
	</div>
	<div class="invite-body" style="display: none">

		<h3 class="widget-title"><span class="title-text ">Send Invitation</span></h3>
		<form class="clearfix" action="#" method="post" >

			<p class="input-block">
				<label class="required" >Email <span>*</span></label>
				<input type="email" name="name" class="form-input" value="">
			</p>
			<p class="input-block clearfix">
				<label class="required" >Topic <span>*</span></label>
				<select name="visibility" class="form-input" >
					<option>Topic 1</option>
					<option>Topic 2</option>
				</select>
			</p>
			<p class="contact-button clearfix">
				<input type="reset" class="form-input form-input-button" value="Cancel">
				<input type="submit" class="form-input form-input-button" value="Invite">
			</p>
			<div class="clear"></div>
		</form>
	</div>
</div>

<asset:javascript src="js/jquery-1.8.3.min.js"/>
<asset:javascript src="js/superfish.js"/>
<asset:javascript src="js/bootstrap.js"/>
<asset:javascript src="js/query.carouFredSel-6.0.4-packed.js"/>
<asset:javascript src="js/classie.js"/>
<asset:javascript src="js/uisearch.js"/>
<asset:javascript src="js/jquery.validate.min.js"/>
<asset:javascript src="js/custom.js"/>

<script>
	new UISearch( document.getElementById( 'sb-search' ) );
</script>

</body>

</html>